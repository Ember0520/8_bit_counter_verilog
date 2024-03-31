library verilog;
use verilog.vl_types.all;
entity bin2bcd is
    port(
        bin_in          : in     vl_logic_vector(7 downto 0);
        bcd_out         : out    vl_logic_vector(11 downto 0)
    );
end bin2bcd;
