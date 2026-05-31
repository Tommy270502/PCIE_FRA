library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_fra_core is
end entity;

architecture sim of tb_fra_core is

    constant CLK_PERIOD : time := 20 ns;

    constant REG_VERSION        : natural := 16#00#;
    constant REG_CONTROL        : natural := 16#04#;
    constant REG_STATUS         : natural := 16#08#;
    constant REG_PHASE_INC      : natural := 16#0C#;
    constant REG_AMPLITUDE      : natural := 16#14#;
    constant REG_SETTLE_CYCLES  : natural := 16#18#;
    constant REG_MEASURE_CYCLES : natural := 16#1C#;
    constant REG_SAMPLE_COUNT   : natural := 16#20#;
    constant REG_ADC_MIN_MAX    : natural := 16#34#;

    constant CTRL_DDS_ENABLE           : std_logic_vector(31 downto 0) := x"00000001";
    constant CTRL_START                : std_logic_vector(31 downto 0) := x"00000002";
    constant CTRL_CLEAR_DONE           : std_logic_vector(31 downto 0) := x"00000004";
    constant CTRL_RESET_PHASE_ON_START : std_logic_vector(31 downto 0) := x"00000008";

    constant STATUS_DONE       : natural := 1;
    constant STATUS_ADC_CLIP   : natural := 3;
    constant STATUS_LOW_SIGNAL : natural := 4;
    constant STATUS_CONFIG_ERR : natural := 5;

    signal clk    : std_logic := '0';
    signal resetn : std_logic := '0';

    signal awaddr  : std_logic_vector(7 downto 0) := (others => '0');
    signal awprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal awvalid : std_logic := '0';
    signal awready : std_logic;
    signal wdata   : std_logic_vector(31 downto 0) := (others => '0');
    signal wstrb   : std_logic_vector(3 downto 0) := (others => '1');
    signal wvalid  : std_logic := '0';
    signal wready  : std_logic;
    signal bresp   : std_logic_vector(1 downto 0);
    signal bvalid  : std_logic;
    signal bready  : std_logic := '0';
    signal araddr  : std_logic_vector(7 downto 0) := (others => '0');
    signal arprot  : std_logic_vector(2 downto 0) := (others => '0');
    signal arvalid : std_logic := '0';
    signal arready : std_logic;
    signal rdata   : std_logic_vector(31 downto 0);
    signal rresp   : std_logic_vector(1 downto 0);
    signal rvalid  : std_logic;
    signal rready  : std_logic := '0';

    signal adc_in      : std_logic_vector(7 downto 0) := x"80";
    signal adc_clk_out : std_logic;
    signal dac_out     : std_logic_vector(7 downto 0);
    signal dac_clk_out : std_logic;
    signal adc_mode    : natural := 0;

    procedure axi_write(
        signal clk_s     : in  std_logic;
        signal awaddr_s  : out std_logic_vector(7 downto 0);
        signal awvalid_s : out std_logic;
        signal awready_s : in  std_logic;
        signal wdata_s   : out std_logic_vector(31 downto 0);
        signal wstrb_s   : out std_logic_vector(3 downto 0);
        signal wvalid_s  : out std_logic;
        signal wready_s  : in  std_logic;
        signal bvalid_s  : in  std_logic;
        signal bready_s  : out std_logic;
        constant addr    : in  natural;
        constant data    : in  std_logic_vector(31 downto 0);
        constant strb    : in  std_logic_vector(3 downto 0) := x"F"
    ) is
    begin
        wait until rising_edge(clk_s);
        awaddr_s  <= std_logic_vector(to_unsigned(addr, awaddr_s'length));
        awvalid_s <= '1';
        wdata_s   <= data;
        wstrb_s   <= strb;
        wvalid_s  <= '1';

        loop
            wait until rising_edge(clk_s);
            exit when (awready_s = '1') and (wready_s = '1');
        end loop;

        awvalid_s <= '0';
        wvalid_s  <= '0';
        bready_s  <= '1';

        loop
            wait until rising_edge(clk_s);
            exit when bvalid_s = '1';
        end loop;

        bready_s <= '0';
    end procedure;

    procedure axi_read(
        signal clk_s     : in  std_logic;
        signal araddr_s  : out std_logic_vector(7 downto 0);
        signal arvalid_s : out std_logic;
        signal arready_s : in  std_logic;
        signal rdata_s   : in  std_logic_vector(31 downto 0);
        signal rvalid_s  : in  std_logic;
        signal rready_s  : out std_logic;
        constant addr    : in  natural;
        variable data    : out std_logic_vector(31 downto 0)
    ) is
    begin
        wait until rising_edge(clk_s);
        araddr_s  <= std_logic_vector(to_unsigned(addr, araddr_s'length));
        arvalid_s <= '1';

        loop
            wait until rising_edge(clk_s);
            exit when arready_s = '1';
        end loop;

        arvalid_s <= '0';
        rready_s  <= '1';

        loop
            wait until rising_edge(clk_s);
            exit when rvalid_s = '1';
        end loop;

        data := rdata_s;
        rready_s <= '0';
    end procedure;

    procedure wait_done(
        signal clk_s     : in  std_logic;
        signal araddr_s  : out std_logic_vector(7 downto 0);
        signal arvalid_s : out std_logic;
        signal arready_s : in  std_logic;
        signal rdata_s   : in  std_logic_vector(31 downto 0);
        signal rvalid_s  : in  std_logic;
        signal rready_s  : out std_logic;
        variable status  : out std_logic_vector(31 downto 0)
    ) is
        variable tmp : std_logic_vector(31 downto 0);
    begin
        for i in 0 to 2000 loop
            axi_read(clk_s, araddr_s, arvalid_s, arready_s, rdata_s, rvalid_s, rready_s, REG_STATUS, tmp);
            if tmp(STATUS_DONE) = '1' then
                status := tmp;
                return;
            end if;
        end loop;

        assert false report "fra_core measurement did not complete" severity failure;
    end procedure;

begin

    clk <= not clk after CLK_PERIOD / 2;

    dut : entity work.fra_core
        port map (
            s_axi_aclk    => clk,
            s_axi_aresetn => resetn,
            s_axi_awaddr  => awaddr,
            s_axi_awprot  => awprot,
            s_axi_awvalid => awvalid,
            s_axi_awready => awready,
            s_axi_wdata   => wdata,
            s_axi_wstrb   => wstrb,
            s_axi_wvalid  => wvalid,
            s_axi_wready  => wready,
            s_axi_bresp   => bresp,
            s_axi_bvalid  => bvalid,
            s_axi_bready  => bready,
            s_axi_araddr  => araddr,
            s_axi_arprot  => arprot,
            s_axi_arvalid => arvalid,
            s_axi_arready => arready,
            s_axi_rdata   => rdata,
            s_axi_rresp   => rresp,
            s_axi_rvalid  => rvalid,
            s_axi_rready  => rready,
            adc_in        => adc_in,
            adc_clk_out   => adc_clk_out,
            dac_out       => dac_out,
            dac_clk_out   => dac_clk_out
        );

    adc_driver : process(clk)
    begin
        if rising_edge(clk) then
            case adc_mode is
                when 0 =>
                    adc_in <= dac_out;
                when 1 =>
                    adc_in <= x"80";
                when others =>
                    adc_in <= x"FF";
            end case;
        end if;
    end process;

    stimulus : process
        variable rd     : std_logic_vector(31 downto 0);
        variable status : std_logic_vector(31 downto 0);
    begin
        wait for 200 ns;
        resetn <= '1';
        wait for 200 ns;

        axi_read(clk, araddr, arvalid, arready, rdata, rvalid, rready, REG_VERSION, rd);
        assert rd = x"00010000" report "unexpected fra_core version" severity failure;

        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_RESET_PHASE_ON_START);
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  x"00000000", x"E");
        axi_read(clk, araddr, arvalid, arready, rdata, rvalid, rready, REG_CONTROL, rd);
        assert rd = (CTRL_DDS_ENABLE or CTRL_RESET_PHASE_ON_START)
            report "CONTROL write ignored WSTRB" severity failure;

        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_PHASE_INC, x"10000000");
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_AMPLITUDE, x"000000C0");
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_SETTLE_CYCLES, x"00000001");
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_MEASURE_CYCLES, x"00000004");

        adc_mode <= 0;
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_START or CTRL_CLEAR_DONE or CTRL_RESET_PHASE_ON_START);
        wait_done(clk, araddr, arvalid, arready, rdata, rvalid, rready, status);
        assert status(STATUS_DONE) = '1' report "loopback measurement not done" severity failure;
        assert status(STATUS_LOW_SIGNAL) = '0' report "loopback measurement falsely flagged low signal" severity failure;

        axi_read(clk, araddr, arvalid, arready, rdata, rvalid, rready, REG_SAMPLE_COUNT, rd);
        assert unsigned(rd) > 0 report "sample count did not advance" severity failure;

        axi_read(clk, araddr, arvalid, arready, rdata, rvalid, rready, REG_ADC_MIN_MAX, rd);
        assert unsigned(rd(15 downto 8)) > unsigned(rd(7 downto 0)) report "ADC min/max did not span" severity failure;

        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_SETTLE_CYCLES, x"00000000");
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_START or CTRL_CLEAR_DONE or CTRL_RESET_PHASE_ON_START);
        wait_done(clk, araddr, arvalid, arready, rdata, rvalid, rready, status);
        axi_read(clk, araddr, arvalid, arready, rdata, rvalid, rready, REG_SAMPLE_COUNT, rd);
        assert unsigned(rd) = 64 report "zero-settle measurement did not accumulate four whole DDS cycles" severity failure;

        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_PHASE_INC, x"00000000");
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_START or CTRL_CLEAR_DONE or CTRL_RESET_PHASE_ON_START);
        wait_done(clk, araddr, arvalid, arready, rdata, rvalid, rready, status);
        assert status(STATUS_CONFIG_ERR) = '1' report "zero phase increment did not set config error" severity failure;
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_PHASE_INC, x"10000000");

        adc_mode <= 1;
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_START or CTRL_CLEAR_DONE or CTRL_RESET_PHASE_ON_START);
        wait_done(clk, araddr, arvalid, arready, rdata, rvalid, rready, status);
        assert status(STATUS_LOW_SIGNAL) = '1' report "low-signal input was not flagged" severity failure;

        adc_mode <= 2;
        axi_write(clk, awaddr, awvalid, awready, wdata, wstrb, wvalid, wready, bvalid, bready, REG_CONTROL,
                  CTRL_DDS_ENABLE or CTRL_START or CTRL_CLEAR_DONE or CTRL_RESET_PHASE_ON_START);
        wait_done(clk, araddr, arvalid, arready, rdata, rvalid, rready, status);
        assert status(STATUS_ADC_CLIP) = '1' report "clipped ADC input was not flagged" severity failure;

        assert false report "tb_fra_core completed" severity note;
        wait;
    end process;

end architecture;
