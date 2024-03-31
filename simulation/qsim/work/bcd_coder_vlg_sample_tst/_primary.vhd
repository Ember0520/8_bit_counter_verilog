library verilog;
use verilog.vl_types.all;
entity bcd_coder_vlg_sample_tst is
    port(
        ain             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end bcd_coder_vlg_sample_tst;
