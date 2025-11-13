library verilog;
use verilog.vl_types.all;
entity mux8por1_1bit is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        I2              : in     vl_logic;
        I3              : in     vl_logic;
        I4              : in     vl_logic;
        I5              : in     vl_logic;
        I6              : in     vl_logic;
        I7              : in     vl_logic;
        sel             : in     vl_logic_vector(2 downto 0);
        s               : out    vl_logic
    );
end mux8por1_1bit;
