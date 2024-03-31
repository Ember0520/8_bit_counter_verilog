library verilog;
use verilog.vl_types.all;
entity mux_vlg_check_tst is
    port(
        data_out        : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end mux_vlg_check_tst;
