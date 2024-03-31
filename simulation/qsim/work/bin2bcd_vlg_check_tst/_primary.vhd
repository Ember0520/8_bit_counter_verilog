library verilog;
use verilog.vl_types.all;
entity bin2bcd_vlg_check_tst is
    port(
        bcd_out         : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end bin2bcd_vlg_check_tst;
