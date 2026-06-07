-- =============================================================================
-- pcie_bar_regs.vhd
--
-- Minimal AXI4-Lite slave that sits behind PCIe BAR0 for Stage-2 bring-up.
-- Gives the host a fixed identity/version to read and a scratch register to
-- write+read-back, which proves the BAR0 -> M_AXI -> fabric path end to end.
--
-- This is a trivial register file (no PCIe / transceiver logic) -- the PCIe and
-- GTP logic all come from the xilinx.com:ip:axi_pcie IP, per the bring-up brief.
--
-- Register map (32-bit, word-addressed; see docs/PCIE_BAR0_REGISTER_MAP.md):
--   0x00 BOARD_ID  RO  0xA7015B00  -- "AX7015B" board magic
--   0x04 VERSION   RO  0x00010000  -- gateware version 1.0.0
--   0x08 SCRATCH   RW  0x00000000  -- host read/write smoke test
--   0x0C CONTROL   RW  0x00000000  -- bit0 host->PS attention (informational)
--   0x10 SCRATCH2  RW  0x00000000  -- spare RW
--   0x14 RESERVED  RO  0x00000000
--   0x18 RESERVED  RO  0x00000000
--   0x1C RESERVED  RO  0x00000000
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pcie_bar_regs is
  generic (
    C_S_AXI_DATA_WIDTH : integer := 32;
    C_S_AXI_ADDR_WIDTH : integer := 12  -- 4 KB decode window; 3 reg-select bits used
  );
  port (
    S_AXI_ACLK    : in  std_logic;
    S_AXI_ARESETN : in  std_logic;

    -- Write address channel
    S_AXI_AWADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT  : in  std_logic_vector(2 downto 0);
    S_AXI_AWVALID : in  std_logic;
    S_AXI_AWREADY : out std_logic;
    -- Write data channel
    S_AXI_WDATA   : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB   : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID  : in  std_logic;
    S_AXI_WREADY  : out std_logic;
    -- Write response channel
    S_AXI_BRESP   : out std_logic_vector(1 downto 0);
    S_AXI_BVALID  : out std_logic;
    S_AXI_BREADY  : in  std_logic;
    -- Read address channel
    S_AXI_ARADDR  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT  : in  std_logic_vector(2 downto 0);
    S_AXI_ARVALID : in  std_logic;
    S_AXI_ARREADY : out std_logic;
    -- Read data channel
    S_AXI_RDATA   : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP   : out std_logic_vector(1 downto 0);
    S_AXI_RVALID  : out std_logic;
    S_AXI_RREADY  : in  std_logic
  );
end entity pcie_bar_regs;

architecture rtl of pcie_bar_regs is

  -- Identity / version constants
  constant BOARD_ID_C : std_logic_vector(31 downto 0) := x"A7015B00";
  constant VERSION_C  : std_logic_vector(31 downto 0) := x"00010000";

  -- Number of address bits that select a 32-bit word (low 2 bits are byte lanes)
  constant ADDR_LSB   : integer := 2;
  constant REG_SEL_W  : integer := 3;  -- 8 registers

  -- Writable registers
  signal scratch_reg  : std_logic_vector(31 downto 0) := (others => '0');
  signal control_reg  : std_logic_vector(31 downto 0) := (others => '0');
  signal scratch2_reg : std_logic_vector(31 downto 0) := (others => '0');

  -- AXI handshake
  signal awready_i : std_logic := '0';
  signal wready_i  : std_logic := '0';
  signal bvalid_i  : std_logic := '0';
  signal bresp_i   : std_logic_vector(1 downto 0) := "00";
  signal arready_i : std_logic := '0';
  signal rvalid_i  : std_logic := '0';
  signal rresp_i   : std_logic_vector(1 downto 0) := "00";
  signal rdata_i   : std_logic_vector(31 downto 0) := (others => '0');

  signal awaddr_q  : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');

begin

  S_AXI_AWREADY <= awready_i;
  S_AXI_WREADY  <= wready_i;
  S_AXI_BRESP   <= bresp_i;
  S_AXI_BVALID  <= bvalid_i;
  S_AXI_ARREADY <= arready_i;
  S_AXI_RDATA   <= rdata_i;
  S_AXI_RRESP   <= rresp_i;
  S_AXI_RVALID  <= rvalid_i;

  -- ---------------------------------------------------------------------------
  -- Write address + write data handshake (accept when both AW and W are valid)
  -- ---------------------------------------------------------------------------
  write_proc : process (S_AXI_ACLK)
    variable sel : integer range 0 to 2**REG_SEL_W-1;
  begin
    if rising_edge(S_AXI_ACLK) then
      if S_AXI_ARESETN = '0' then
        awready_i    <= '0';
        wready_i     <= '0';
        bvalid_i     <= '0';
        bresp_i      <= "00";
        scratch_reg  <= (others => '0');
        control_reg  <= (others => '0');
        scratch2_reg <= (others => '0');
        awaddr_q     <= (others => '0');
      else
        -- Latch write address
        if awready_i = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' then
          awready_i <= '1';
          awaddr_q  <= S_AXI_AWADDR;
        else
          awready_i <= '0';
        end if;

        -- Accept write data together with address
        if wready_i = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' then
          wready_i <= '1';
        else
          wready_i <= '0';
        end if;

        -- Perform the register write
        if wready_i = '1' and S_AXI_WVALID = '1' and awready_i = '1' and S_AXI_AWVALID = '1' then
          sel := to_integer(unsigned(awaddr_q(ADDR_LSB+REG_SEL_W-1 downto ADDR_LSB)));
          case sel is
            when 2 =>  -- 0x08 SCRATCH
              for b in 0 to (C_S_AXI_DATA_WIDTH/8)-1 loop
                if S_AXI_WSTRB(b) = '1' then
                  scratch_reg(b*8+7 downto b*8) <= S_AXI_WDATA(b*8+7 downto b*8);
                end if;
              end loop;
            when 3 =>  -- 0x0C CONTROL
              for b in 0 to (C_S_AXI_DATA_WIDTH/8)-1 loop
                if S_AXI_WSTRB(b) = '1' then
                  control_reg(b*8+7 downto b*8) <= S_AXI_WDATA(b*8+7 downto b*8);
                end if;
              end loop;
            when 4 =>  -- 0x10 SCRATCH2
              for b in 0 to (C_S_AXI_DATA_WIDTH/8)-1 loop
                if S_AXI_WSTRB(b) = '1' then
                  scratch2_reg(b*8+7 downto b*8) <= S_AXI_WDATA(b*8+7 downto b*8);
                end if;
              end loop;
            when others =>
              null;  -- writes to RO / reserved are ignored, still OKAY
          end case;
          bvalid_i <= '1';
          bresp_i  <= "00";  -- OKAY
        elsif S_AXI_BREADY = '1' and bvalid_i = '1' then
          bvalid_i <= '0';
        end if;
      end if;
    end if;
  end process;

  -- ---------------------------------------------------------------------------
  -- Read handshake
  -- ---------------------------------------------------------------------------
  read_proc : process (S_AXI_ACLK)
    variable sel : integer range 0 to 2**REG_SEL_W-1;
  begin
    if rising_edge(S_AXI_ACLK) then
      if S_AXI_ARESETN = '0' then
        arready_i <= '0';
        rvalid_i  <= '0';
        rresp_i   <= "00";
        rdata_i   <= (others => '0');
      else
        if arready_i = '0' and S_AXI_ARVALID = '1' and rvalid_i = '0' then
          arready_i <= '1';
          sel := to_integer(unsigned(S_AXI_ARADDR(ADDR_LSB+REG_SEL_W-1 downto ADDR_LSB)));
          case sel is
            when 0      => rdata_i <= BOARD_ID_C;
            when 1      => rdata_i <= VERSION_C;
            when 2      => rdata_i <= scratch_reg;
            when 3      => rdata_i <= control_reg;
            when 4      => rdata_i <= scratch2_reg;
            when others => rdata_i <= (others => '0');
          end case;
          rvalid_i <= '1';
          rresp_i  <= "00";  -- OKAY
        else
          arready_i <= '0';
          if rvalid_i = '1' and S_AXI_RREADY = '1' then
            rvalid_i <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture rtl;
