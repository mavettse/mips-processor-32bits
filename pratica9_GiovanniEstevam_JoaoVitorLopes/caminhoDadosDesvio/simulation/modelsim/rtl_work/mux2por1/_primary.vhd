library verilog;
use verilog.vl_types.all;
entity mux2por1 is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        sel             : in     vl_logic;
        s               : out    vl_logic
    );
end mux2por1;
