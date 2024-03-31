library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        clk             : in     vl_logic;
        ina             : in     vl_logic_vector(3 downto 0);
        inb             : in     vl_logic_vector(3 downto 0);
        inc             : in     vl_logic_vector(3 downto 0);
        data_out        : out    vl_logic_vector(3 downto 0);
        sel             : out    vl_logic_vector(1 downto 0)
    );
end mux;
