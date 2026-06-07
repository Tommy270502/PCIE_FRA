-- =============================================================================
-- tb_pcie_bar_regs.vhd
--
-- Self-checking AXI4-Lite testbench for pcie_bar_regs. Validates the BAR0
-- register file logic WITHOUT any PCIe / GT / hardware -- this is the coverage
-- we can get for the register file while no PCIe slot (and thus no refclk) is
-- available to exercise it on silicon.
--
-- Checks:
--   * BOARD_ID (0x00) reads 0xA7015B00
--   * VERSION  (0x04) reads 0x00010000
--   * SCRATCH/CONTROL/SCRATCH2 (0x08/0x0C/0x10) write + read-back
--   * WSTRB byte-lane partial writes are honoured
--   * RO/reserved offsets ignore writes (stay at reset) and read 0 where reserved
--   * Write responses are OKAY
--
-- Run: vivado -mode batch -source scripts/run_pcie_bar_regs_sim.tcl
-- Pass/fail marker printed as TB_PCIE_BAR_REGS_RESULT.
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pcie_bar_regs is
end entity tb_pcie_bar_regs;

architecture sim of tb_pcie_bar_regs is

  constant ADDR_W : integer := 12;
  constant DATA_W : integer := 32;
  constant TCLK   : time := 10 ns;  -- 100 MHz

  signal clk     : std_logic := '0';
  signal aresetn : std_logic := '0';

  signal awaddr  : std_logic_vector(ADDR_W-1 downto 0) := (others => '0');
  signal awprot  : std_logic_vector(2 downto 0) := (others => '0');
  signal awvalid : std_logic := '0';
  signal awready : std_logic;
  signal wdata   : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal wstrb   : std_logic_vector(DATA_W/8-1 downto 0) := (others => '1');
  signal wvalid  : std_logic := '0';
  signal wready  : std_logic;
  signal bresp   : std_logic_vector(1 downto 0);
  signal bvalid  : std_logic;
  signal bready  : std_logic := '0';
  signal araddr  : std_logic_vector(ADDR_W-1 downto 0) := (others => '0');
  signal arprot  : std_logic_vector(2 downto 0) := (others => '0');
  signal arvalid : std_logic := '0';
  signal arready : std_logic;
  signal rdata   : std_logic_vector(DATA_W-1 downto 0);
  signal rresp   : std_logic_vector(1 downto 0);
  signal rvalid  : std_logic;
  signal rready  : std_logic := '0';

  signal done    : boolean := false;
  signal errors  : integer := 0;

begin

  -- DUT
  dut : entity work.pcie_bar_regs
    generic map (
      C_S_AXI_DATA_WIDTH => DATA_W,
      C_S_AXI_ADDR_WIDTH => ADDR_W
    )
    port map (
      S_AXI_ACLK    => clk,
      S_AXI_ARESETN => aresetn,
      S_AXI_AWADDR  => awaddr,
      S_AXI_AWPROT  => awprot,
      S_AXI_AWVALID => awvalid,
      S_AXI_AWREADY => awready,
      S_AXI_WDATA   => wdata,
      S_AXI_WSTRB   => wstrb,
      S_AXI_WVALID  => wvalid,
      S_AXI_WREADY  => wready,
      S_AXI_BRESP   => bresp,
      S_AXI_BVALID  => bvalid,
      S_AXI_BREADY  => bready,
      S_AXI_ARADDR  => araddr,
      S_AXI_ARPROT  => arprot,
      S_AXI_ARVALID => arvalid,
      S_AXI_ARREADY => arready,
      S_AXI_RDATA   => rdata,
      S_AXI_RRESP   => rresp,
      S_AXI_RVALID  => rvalid,
      S_AXI_RREADY  => rready
    );

  -- Clock
  clk <= '0' when done else not clk after TCLK/2;

  -- Stimulus + checks
  stim : process

    procedure tick(n : integer) is
    begin
      for i in 1 to n loop
        wait until rising_edge(clk);
      end loop;
    end procedure;

    -- Standard AXI4-Lite write: hold AW/W valid until both ready seen, then
    -- collect the OKAY write response.
    procedure axi_write(addr : in integer;
                        data : in std_logic_vector(31 downto 0);
                        strb : in std_logic_vector(3 downto 0)) is
    begin
      awaddr  <= std_logic_vector(to_unsigned(addr, ADDR_W));
      wdata   <= data;
      wstrb   <= strb;
      awvalid <= '1';
      wvalid  <= '1';
      -- wait until address+data accepted
      loop
        wait until rising_edge(clk);
        exit when awready = '1' and wready = '1';
      end loop;
      awvalid <= '0';
      wvalid  <= '0';
      bready  <= '1';
      -- wait for write response
      loop
        wait until rising_edge(clk);
        exit when bvalid = '1';
      end loop;
      if bresp /= "00" then
        report "axi_write: BRESP not OKAY at addr " & integer'image(addr)
          severity error;
        errors <= errors + 1;
      end if;
      bready <= '0';
    end procedure;

    -- Standard AXI4-Lite read returning captured data.
    procedure axi_read(addr : in integer;
                       data : out std_logic_vector(31 downto 0)) is
    begin
      araddr  <= std_logic_vector(to_unsigned(addr, ADDR_W));
      arvalid <= '1';
      loop
        wait until rising_edge(clk);
        exit when arready = '1';
      end loop;
      arvalid <= '0';
      rready  <= '1';
      loop
        wait until rising_edge(clk);
        exit when rvalid = '1';
      end loop;
      data := rdata;
      if rresp /= "00" then
        report "axi_read: RRESP not OKAY at addr " & integer'image(addr)
          severity error;
        errors <= errors + 1;
      end if;
      rready <= '0';
    end procedure;

    procedure check(name : in string;
                    got  : in std_logic_vector(31 downto 0);
                    exp  : in std_logic_vector(31 downto 0)) is
    begin
      if got = exp then
        report "PASS " & name severity note;
      else
        report "FAIL " & name & " got=" & to_hstring(got) &
               " exp=" & to_hstring(exp) severity error;
        errors <= errors + 1;
      end if;
    end procedure;

    variable rd : std_logic_vector(31 downto 0);
  begin
    -- reset
    aresetn <= '0';
    tick(5);
    aresetn <= '1';
    tick(2);

    -- Identity / version (read-only)
    axi_read(16#00#, rd); check("BOARD_ID", rd, x"A7015B00");
    axi_read(16#04#, rd); check("VERSION",  rd, x"00010000");

    -- SCRATCH (0x08) full write + read-back
    axi_write(16#08#, x"DEADBEEF", "1111");
    axi_read (16#08#, rd); check("SCRATCH=DEADBEEF", rd, x"DEADBEEF");
    axi_write(16#08#, x"00000000", "1111");
    axi_read (16#08#, rd); check("SCRATCH=0", rd, x"00000000");

    -- CONTROL (0x0C) and SCRATCH2 (0x10) read-back
    axi_write(16#0C#, x"00000001", "1111");
    axi_read (16#0C#, rd); check("CONTROL=1", rd, x"00000001");
    axi_write(16#10#, x"A5A5A5A5", "1111");
    axi_read (16#10#, rd); check("SCRATCH2=A5A5A5A5", rd, x"A5A5A5A5");

    -- WSTRB byte-lane: preload, then write only lane 0 and lane 2
    axi_write(16#08#, x"FFFFFFFF", "1111");
    axi_write(16#08#, x"11223344", "0101");  -- only bytes 0 and 2 update
    axi_read (16#08#, rd); check("SCRATCH WSTRB 0101", rd, x"FF22FF44");

    -- Reserved offset (0x14) reads 0
    axi_read(16#14#, rd); check("RESERVED 0x14 reads 0", rd, x"00000000");

    -- Write to read-only BOARD_ID is ignored (still reads magic)
    axi_write(16#00#, x"12345678", "1111");
    axi_read (16#00#, rd); check("BOARD_ID RO after write", rd, x"A7015B00");

    -- Summary
    tick(2);
    if errors = 0 then
      report "TB_PCIE_BAR_REGS_RESULT = PASS" severity note;
    else
      report "TB_PCIE_BAR_REGS_RESULT = FAIL (" & integer'image(errors) &
             " errors)" severity note;
    end if;

    done <= true;
    -- A failing run ends with severity failure so batch flows flag it.
    assert errors = 0
      report "tb_pcie_bar_regs: one or more checks failed"
      severity failure;
    wait;
  end process;

end architecture sim;
