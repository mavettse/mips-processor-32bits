library verilog;
use verilog.vl_types.all;
entity extensor_sinal is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        s               : out    vl_logic_vector(31 downto 0)
    );
end extensor_sinal;
