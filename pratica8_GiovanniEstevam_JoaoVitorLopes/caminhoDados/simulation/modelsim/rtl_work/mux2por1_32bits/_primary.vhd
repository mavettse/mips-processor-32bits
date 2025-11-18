library verilog;
use verilog.vl_types.all;
entity mux2por1_32bits is
    port(
        I0              : in     vl_logic_vector(31 downto 0);
        I1              : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        s               : out    vl_logic_vector(31 downto 0)
    );
end mux2por1_32bits;
