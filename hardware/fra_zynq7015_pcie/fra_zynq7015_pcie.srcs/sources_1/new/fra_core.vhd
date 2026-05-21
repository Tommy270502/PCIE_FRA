library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fra_core is
    generic (
        C_S_AXI_DATA_WIDTH : integer := 32;
        C_S_AXI_ADDR_WIDTH : integer := 8
    );
    port (
        s_axi_aclk    : in  std_logic;
        s_axi_aresetn : in  std_logic;

        s_axi_awaddr  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_awprot  : in  std_logic_vector(2 downto 0);
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;

        s_axi_wdata   : in  std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
        s_axi_wstrb   : in  std_logic_vector((C_S_AXI_DATA_WIDTH / 8) - 1 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;

        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;

        s_axi_araddr  : in  std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_arprot  : in  std_logic_vector(2 downto 0);
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;

        s_axi_rdata   : out std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;

        adc_in        : in  std_logic_vector(7 downto 0);
        adc_clk_out   : out std_logic;

        dac_out       : out std_logic_vector(7 downto 0);
        dac_clk_out   : out std_logic
    );

    attribute X_INTERFACE_INFO : string;
    attribute X_INTERFACE_PARAMETER : string;

    attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
    attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 50000000";
    attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
    attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "POLARITY ACTIVE_LOW";

    attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
    attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
    attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
    attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
    attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
    attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
    attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
    attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
    attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
    attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
    attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
    attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
    attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
    attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
    attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
    attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
    attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
    attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
    attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
    attribute X_INTERFACE_PARAMETER of s_axi_awaddr : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, ADDR_WIDTH 8, PROTOCOL AXI4LITE, FREQ_HZ 50000000, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1";
end fra_core;

architecture rtl of fra_core is

    constant REG_VERSION        : integer := 16#00010000#;
    constant REG_VERSION_ADDR   : unsigned(5 downto 0) := "000000";
    constant REG_CONTROL        : unsigned(5 downto 0) := "000001";
    constant REG_STATUS         : unsigned(5 downto 0) := "000010";
    constant REG_PHASE_INC      : unsigned(5 downto 0) := "000011";
    constant REG_PHASE_OFFSET   : unsigned(5 downto 0) := "000100";
    constant REG_AMPLITUDE      : unsigned(5 downto 0) := "000101";
    constant REG_SETTLE_CYCLES  : unsigned(5 downto 0) := "000110";
    constant REG_MEASURE_CYCLES : unsigned(5 downto 0) := "000111";
    constant REG_SAMPLE_COUNT   : unsigned(5 downto 0) := "001000";
    constant REG_I_ACC_LO       : unsigned(5 downto 0) := "001001";
    constant REG_I_ACC_HI       : unsigned(5 downto 0) := "001010";
    constant REG_Q_ACC_LO       : unsigned(5 downto 0) := "001011";
    constant REG_Q_ACC_HI       : unsigned(5 downto 0) := "001100";
    constant REG_ADC_MIN_MAX    : unsigned(5 downto 0) := "001101";
    constant REG_LAST_SAMPLE    : unsigned(5 downto 0) := "001110";

    constant LOW_SIGNAL_SPAN_THRESHOLD : integer := 4;
    constant U32_ZERO : unsigned(31 downto 0) := (others => '0');
    constant U32_MAX  : unsigned(31 downto 0) := (others => '1');

    signal axi_awready_i : std_logic := '0';
    signal axi_wready_i  : std_logic := '0';
    signal axi_bvalid_i  : std_logic := '0';
    signal axi_arready_i : std_logic := '0';
    signal axi_rvalid_i  : std_logic := '0';
    signal axi_rdata_i   : std_logic_vector(31 downto 0) := (others => '0');
    signal axi_aw_seen   : std_logic := '0';
    signal axi_w_seen    : std_logic := '0';
    signal axi_awaddr_i  : std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0) := (others => '0');
    signal axi_wdata_i   : std_logic_vector(31 downto 0) := (others => '0');
    signal axi_wstrb_i   : std_logic_vector(3 downto 0) := (others => '0');

    signal clk_div       : std_logic := '0';
    signal phase_acc     : unsigned(31 downto 0) := (others => '0');
    signal lut_addr_i    : unsigned(7 downto 0) := (others => '0');
    signal lut_addr_q    : unsigned(7 downto 0) := (others => '0');
    signal lut_data_i    : std_logic_vector(7 downto 0);
    signal lut_data_q    : std_logic_vector(7 downto 0);
    signal dac_out_i     : std_logic_vector(7 downto 0) := x"80";

    signal dds_enable           : std_logic := '0';
    signal reset_phase_on_start : std_logic := '1';
    signal phase_inc_reg        : unsigned(31 downto 0) := (others => '0');
    signal phase_offset_reg     : unsigned(31 downto 0) := (others => '0');
    signal amplitude_reg        : unsigned(7 downto 0)  := x"80";
    signal settle_cycles_reg    : unsigned(31 downto 0) := to_unsigned(2, 32);
    signal measure_cycles_reg   : unsigned(31 downto 0) := to_unsigned(4, 32);

    signal busy_i        : std_logic := '0';
    signal done_i        : std_logic := '0';
    signal overflow_i    : std_logic := '0';
    signal adc_clip_i    : std_logic := '0';
    signal low_signal_i  : std_logic := '0';
    signal config_err_i  : std_logic := '0';
    signal settling_i    : std_logic := '0';

    signal settle_cycle_count  : unsigned(31 downto 0) := (others => '0');
    signal measure_cycle_count : unsigned(31 downto 0) := (others => '0');
    signal sample_count_i      : unsigned(31 downto 0) := (others => '0');
    signal i_acc_i             : signed(63 downto 0) := (others => '0');
    signal q_acc_i             : signed(63 downto 0) := (others => '0');
    signal adc_min_i           : unsigned(7 downto 0) := x"FF";
    signal adc_max_i           : unsigned(7 downto 0) := x"00";
    signal last_sample_i       : unsigned(7 downto 0) := x"00";

    function addr_word(addr : std_logic_vector) return unsigned is
    begin
        return unsigned(addr(7 downto 2));
    end function;

    function apply_wstrb(
        old_value : std_logic_vector(31 downto 0);
        new_value : std_logic_vector(31 downto 0);
        strobe    : std_logic_vector(3 downto 0)
    ) return std_logic_vector is
        variable result : std_logic_vector(31 downto 0);
    begin
        result := old_value;
        for i in 0 to 3 loop
            if strobe(i) = '1' then
                result((i * 8) + 7 downto i * 8) := new_value((i * 8) + 7 downto i * 8);
            end if;
        end loop;
        return result;
    end function;

    function scale_lut(lut_value : std_logic_vector(7 downto 0); amplitude : unsigned(7 downto 0)) return std_logic_vector is
        variable lut_center : integer;
        variable scaled     : integer;
        variable dac_int    : integer;
    begin
        lut_center := to_integer(unsigned(lut_value)) - 128;
        scaled     := (lut_center * to_integer(amplitude)) / 255;
        dac_int    := scaled + 128;

        if dac_int < 0 then
            return x"00";
        elsif dac_int > 255 then
            return x"FF";
        else
            return std_logic_vector(to_unsigned(dac_int, 8));
        end if;
    end function;

begin

    s_axi_awready <= axi_awready_i;
    s_axi_wready  <= axi_wready_i;
    s_axi_bvalid  <= axi_bvalid_i;
    s_axi_bresp   <= "00";
    s_axi_arready <= axi_arready_i;
    s_axi_rvalid  <= axi_rvalid_i;
    s_axi_rresp   <= "00";
    s_axi_rdata   <= axi_rdata_i;

    adc_clk_out <= clk_div;
    dac_clk_out <= clk_div;
    dac_out     <= dac_out_i;

    lut_addr_i <= phase_acc(31 downto 24) + phase_offset_reg(31 downto 24);
    lut_addr_q <= phase_acc(31 downto 24) + phase_offset_reg(31 downto 24) + to_unsigned(64, 8);

    sine_i : entity work.sine_lut
        port map (
            clk  => s_axi_aclk,
            addr => lut_addr_i,
            data => lut_data_i
        );

    sine_q : entity work.sine_lut
        port map (
            clk  => s_axi_aclk,
            addr => lut_addr_q,
            data => lut_data_q
        );

    process(s_axi_aclk)
        variable v_aw_seen            : std_logic;
        variable v_w_seen             : std_logic;
        variable v_awaddr             : std_logic_vector(C_S_AXI_ADDR_WIDTH - 1 downto 0);
        variable v_wdata              : std_logic_vector(31 downto 0);
        variable v_wstrb              : std_logic_vector(3 downto 0);
        variable v_start              : std_logic;
        variable read_data            : std_logic_vector(31 downto 0);
        variable sample_tick          : boolean;
        variable phase_next           : unsigned(31 downto 0);
        variable wrapped              : boolean;
        variable sample_int           : integer;
        variable ref_i_int            : integer;
        variable ref_q_int            : integer;
        variable prod_i               : integer;
        variable prod_q               : integer;
        variable next_cycle_count     : unsigned(31 downto 0);
        variable next_sample_count    : unsigned(31 downto 0);
        variable min_next             : unsigned(7 downto 0);
        variable max_next             : unsigned(7 downto 0);
        variable span                 : integer;
        variable phase_inc_value      : std_logic_vector(31 downto 0);
        variable phase_offset_value   : std_logic_vector(31 downto 0);
        variable settle_cycles_value  : std_logic_vector(31 downto 0);
        variable measure_cycles_value : std_logic_vector(31 downto 0);
        variable amplitude_value      : std_logic_vector(31 downto 0);
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                axi_awready_i        <= '0';
                axi_wready_i         <= '0';
                axi_bvalid_i         <= '0';
                axi_arready_i        <= '0';
                axi_rvalid_i         <= '0';
                axi_rdata_i          <= (others => '0');
                axi_aw_seen          <= '0';
                axi_w_seen           <= '0';
                axi_awaddr_i         <= (others => '0');
                axi_wdata_i          <= (others => '0');
                axi_wstrb_i          <= (others => '0');
                clk_div              <= '0';
                phase_acc            <= (others => '0');
                dac_out_i            <= x"80";
                dds_enable           <= '0';
                reset_phase_on_start <= '1';
                phase_inc_reg        <= (others => '0');
                phase_offset_reg     <= (others => '0');
                amplitude_reg        <= x"80";
                settle_cycles_reg    <= to_unsigned(2, 32);
                measure_cycles_reg   <= to_unsigned(4, 32);
                busy_i               <= '0';
                done_i               <= '0';
                overflow_i           <= '0';
                adc_clip_i           <= '0';
                low_signal_i         <= '0';
                config_err_i         <= '0';
                settling_i           <= '0';
                settle_cycle_count   <= (others => '0');
                measure_cycle_count  <= (others => '0');
                sample_count_i       <= (others => '0');
                i_acc_i              <= (others => '0');
                q_acc_i              <= (others => '0');
                adc_min_i            <= x"FF";
                adc_max_i            <= x"00";
                last_sample_i        <= x"00";
            else
                axi_awready_i <= '0';
                axi_wready_i  <= '0';
                axi_arready_i <= '0';
                v_start       := '0';

                v_aw_seen := axi_aw_seen;
                v_w_seen  := axi_w_seen;
                v_awaddr  := axi_awaddr_i;
                v_wdata   := axi_wdata_i;
                v_wstrb   := axi_wstrb_i;

                if axi_bvalid_i = '1' then
                    if s_axi_bready = '1' then
                        axi_bvalid_i <= '0';
                    end if;
                else
                    if (v_aw_seen = '0') and (s_axi_awvalid = '1') then
                        axi_awready_i <= '1';
                        v_aw_seen     := '1';
                        v_awaddr      := s_axi_awaddr;
                    end if;

                    if (v_w_seen = '0') and (s_axi_wvalid = '1') then
                        axi_wready_i <= '1';
                        v_w_seen     := '1';
                        v_wdata      := s_axi_wdata;
                        v_wstrb      := s_axi_wstrb;
                    end if;

                    if (v_aw_seen = '1') and (v_w_seen = '1') then
                        case addr_word(v_awaddr) is
                            when REG_CONTROL =>
                                dds_enable           <= v_wdata(0);
                                reset_phase_on_start <= v_wdata(3);

                                if v_wdata(2) = '1' then
                                    done_i       <= '0';
                                    overflow_i   <= '0';
                                    adc_clip_i   <= '0';
                                    low_signal_i <= '0';
                                    config_err_i <= '0';
                                end if;

                                if v_wdata(1) = '1' then
                                    v_start := '1';
                                end if;

                            when REG_PHASE_INC =>
                                phase_inc_value := apply_wstrb(std_logic_vector(phase_inc_reg), v_wdata, v_wstrb);
                                phase_inc_reg   <= unsigned(phase_inc_value);

                            when REG_PHASE_OFFSET =>
                                phase_offset_value := apply_wstrb(std_logic_vector(phase_offset_reg), v_wdata, v_wstrb);
                                phase_offset_reg   <= unsigned(phase_offset_value);

                            when REG_AMPLITUDE =>
                                amplitude_value := (others => '0');
                                amplitude_value(7 downto 0) := std_logic_vector(amplitude_reg);
                                amplitude_value := apply_wstrb(amplitude_value, v_wdata, v_wstrb);
                                amplitude_reg   <= unsigned(amplitude_value(7 downto 0));

                            when REG_SETTLE_CYCLES =>
                                settle_cycles_value := apply_wstrb(std_logic_vector(settle_cycles_reg), v_wdata, v_wstrb);
                                settle_cycles_reg   <= unsigned(settle_cycles_value);

                            when REG_MEASURE_CYCLES =>
                                measure_cycles_value := apply_wstrb(std_logic_vector(measure_cycles_reg), v_wdata, v_wstrb);
                                measure_cycles_reg   <= unsigned(measure_cycles_value);

                            when others =>
                                null;
                        end case;

                        axi_bvalid_i <= '1';
                        v_aw_seen    := '0';
                        v_w_seen     := '0';
                    end if;
                end if;

                axi_aw_seen  <= v_aw_seen;
                axi_w_seen   <= v_w_seen;
                axi_awaddr_i <= v_awaddr;
                axi_wdata_i  <= v_wdata;
                axi_wstrb_i  <= v_wstrb;

                if axi_rvalid_i = '1' then
                    if s_axi_rready = '1' then
                        axi_rvalid_i <= '0';
                    end if;
                elsif s_axi_arvalid = '1' then
                    read_data := (others => '0');

                    case addr_word(s_axi_araddr) is
                        when REG_VERSION_ADDR =>
                            read_data := std_logic_vector(to_unsigned(REG_VERSION, 32));
                        when REG_CONTROL =>
                            read_data(0) := dds_enable;
                            read_data(3) := reset_phase_on_start;
                        when REG_STATUS =>
                            read_data(0) := busy_i;
                            read_data(1) := done_i;
                            read_data(2) := overflow_i;
                            read_data(3) := adc_clip_i;
                            read_data(4) := low_signal_i;
                            read_data(5) := config_err_i;
                        when REG_PHASE_INC =>
                            read_data := std_logic_vector(phase_inc_reg);
                        when REG_PHASE_OFFSET =>
                            read_data := std_logic_vector(phase_offset_reg);
                        when REG_AMPLITUDE =>
                            read_data(7 downto 0) := std_logic_vector(amplitude_reg);
                        when REG_SETTLE_CYCLES =>
                            read_data := std_logic_vector(settle_cycles_reg);
                        when REG_MEASURE_CYCLES =>
                            read_data := std_logic_vector(measure_cycles_reg);
                        when REG_SAMPLE_COUNT =>
                            read_data := std_logic_vector(sample_count_i);
                        when REG_I_ACC_LO =>
                            read_data := std_logic_vector(i_acc_i(31 downto 0));
                        when REG_I_ACC_HI =>
                            read_data := std_logic_vector(i_acc_i(63 downto 32));
                        when REG_Q_ACC_LO =>
                            read_data := std_logic_vector(q_acc_i(31 downto 0));
                        when REG_Q_ACC_HI =>
                            read_data := std_logic_vector(q_acc_i(63 downto 32));
                        when REG_ADC_MIN_MAX =>
                            read_data(7 downto 0)   := std_logic_vector(adc_min_i);
                            read_data(15 downto 8)  := std_logic_vector(adc_max_i);
                        when REG_LAST_SAMPLE =>
                            read_data(7 downto 0) := std_logic_vector(last_sample_i);
                        when others =>
                            null;
                    end case;

                    axi_arready_i <= '1';
                    axi_rdata_i   <= read_data;
                    axi_rvalid_i  <= '1';
                end if;

                sample_tick := (clk_div = '0');
                clk_div <= not clk_div;

                if sample_tick then
                    phase_next := phase_acc + phase_inc_reg;
                    wrapped    := phase_next < phase_acc;

                    if dds_enable = '1' then
                        phase_acc <= phase_next;
                        dac_out_i <= scale_lut(lut_data_i, amplitude_reg);
                    else
                        dac_out_i <= x"80";
                    end if;

                    last_sample_i <= unsigned(adc_in);

                    if v_start = '1' then
                        if (phase_inc_reg = U32_ZERO) or (measure_cycles_reg = U32_ZERO) then
                            busy_i       <= '0';
                            done_i       <= '1';
                            config_err_i <= '1';
                        else
                            busy_i              <= '1';
                            done_i              <= '0';
                            overflow_i          <= '0';
                            adc_clip_i          <= '0';
                            low_signal_i        <= '0';
                            config_err_i        <= '0';
                            settling_i          <= '1';
                            settle_cycle_count  <= (others => '0');
                            measure_cycle_count <= (others => '0');
                            sample_count_i      <= (others => '0');
                            i_acc_i             <= (others => '0');
                            q_acc_i             <= (others => '0');
                            adc_min_i           <= x"FF";
                            adc_max_i           <= x"00";

                            if reset_phase_on_start = '1' then
                                phase_acc <= (others => '0');
                            end if;
                        end if;
                    elsif busy_i = '1' then
                        if settling_i = '1' then
                            if settle_cycles_reg = 0 then
                                settling_i <= '0';
                            elsif wrapped then
                                next_cycle_count := settle_cycle_count + 1;
                                settle_cycle_count <= next_cycle_count;
                                if next_cycle_count >= settle_cycles_reg then
                                    settling_i <= '0';
                                end if;
                            end if;
                        else
                            sample_int := to_integer(unsigned(adc_in)) - 128;
                            ref_i_int  := to_integer(unsigned(lut_data_i)) - 128;
                            ref_q_int  := to_integer(unsigned(lut_data_q)) - 128;
                            prod_i     := sample_int * ref_i_int;
                            prod_q     := sample_int * ref_q_int;

                            i_acc_i <= i_acc_i + to_signed(prod_i, 64);
                            q_acc_i <= q_acc_i + to_signed(prod_q, 64);

                            next_sample_count := sample_count_i + 1;
                            sample_count_i <= next_sample_count;

                            min_next := adc_min_i;
                            max_next := adc_max_i;
                            if unsigned(adc_in) < min_next then
                                min_next := unsigned(adc_in);
                            end if;
                            if unsigned(adc_in) > max_next then
                                max_next := unsigned(adc_in);
                            end if;
                            adc_min_i <= min_next;
                            adc_max_i <= max_next;

                            if (adc_in = x"00") or (adc_in = x"FF") then
                                adc_clip_i <= '1';
                            end if;

                            if next_sample_count = U32_MAX then
                                overflow_i <= '1';
                            end if;

                            if wrapped then
                                next_cycle_count := measure_cycle_count + 1;
                                measure_cycle_count <= next_cycle_count;

                                if next_cycle_count >= measure_cycles_reg then
                                    busy_i <= '0';
                                    done_i <= '1';
                                    span := to_integer(max_next) - to_integer(min_next);
                                    if span < LOW_SIGNAL_SPAN_THRESHOLD then
                                        low_signal_i <= '1';
                                    end if;
                                end if;
                            end if;
                        end if;
                    end if;
                elsif v_start = '1' then
                    if (phase_inc_reg = U32_ZERO) or (measure_cycles_reg = U32_ZERO) then
                        busy_i       <= '0';
                        done_i       <= '1';
                        config_err_i <= '1';
                    else
                        busy_i              <= '1';
                        done_i              <= '0';
                        overflow_i          <= '0';
                        adc_clip_i          <= '0';
                        low_signal_i        <= '0';
                        config_err_i        <= '0';
                        settling_i          <= '1';
                        settle_cycle_count  <= (others => '0');
                        measure_cycle_count <= (others => '0');
                        sample_count_i      <= (others => '0');
                        i_acc_i             <= (others => '0');
                        q_acc_i             <= (others => '0');
                        adc_min_i           <= x"FF";
                        adc_max_i           <= x"00";

                        if reset_phase_on_start = '1' then
                            phase_acc <= (others => '0');
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

end architecture;
