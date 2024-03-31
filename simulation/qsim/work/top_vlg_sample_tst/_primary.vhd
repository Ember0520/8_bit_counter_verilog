library verilog;
use verilog.vl_types.all;
entity top_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        step            : in     vl_logic_vector(3 downto 0);
        up_down         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end top_vlg_sample_tst;
