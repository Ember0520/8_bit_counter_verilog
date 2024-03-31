library verilog;
use verilog.vl_types.all;
entity mux_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ina             : in     vl_logic_vector(3 downto 0);
        inb             : in     vl_logic_vector(3 downto 0);
        inc             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux_vlg_sample_tst;
