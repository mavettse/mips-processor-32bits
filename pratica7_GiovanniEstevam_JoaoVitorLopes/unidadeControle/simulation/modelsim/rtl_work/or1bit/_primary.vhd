library verilog;
use verilog.vl_types.all;
entity or1bit is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : out    vl_logic
    );
end or1bit;
