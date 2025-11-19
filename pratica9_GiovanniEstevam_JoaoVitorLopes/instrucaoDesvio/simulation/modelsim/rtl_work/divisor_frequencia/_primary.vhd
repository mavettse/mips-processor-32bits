library verilog;
use verilog.vl_types.all;
entity divisor_frequencia is
    port(
        novo_clock      : out    vl_logic;
        reset           : in     vl_logic;
        CLOCK_50        : in     vl_logic
    );
end divisor_frequencia;
