library verilog;
use verilog.vl_types.all;
entity valor_absoluto is
    port(
        s               : in     vl_logic_vector(5 downto 0);
        s_absoluto      : out    vl_logic_vector(5 downto 0);
        bit_sinal       : out    vl_logic
    );
end valor_absoluto;
