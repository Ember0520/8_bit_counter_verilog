library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        up_down         : in     vl_logic;
        rst_n           : in     vl_logic;
        step            : in     vl_logic_vector(3 downto 0);
        count           : out    vl_logic_vector(7 downto 0)
    );
end counter;
