library verilog;
use verilog.vl_types.all;
entity and1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : out    vl_logic
    );
end and1bit;
