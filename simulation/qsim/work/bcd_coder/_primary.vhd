library verilog;
use verilog.vl_types.all;
entity bcd_coder is
    port(
        yout            : out    vl_logic_vector(7 downto 0);
        ain             : in     vl_logic_vector(3 downto 0)
    );
end bcd_coder;
