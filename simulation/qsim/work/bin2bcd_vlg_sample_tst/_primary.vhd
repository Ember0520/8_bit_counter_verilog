library verilog;
use verilog.vl_types.all;
entity bin2bcd_vlg_sample_tst is
    port(
        bin_in          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end bin2bcd_vlg_sample_tst;
