library verilog;
use verilog.vl_types.all;
entity decodificador_operacao_hex is
    port(
        op              : in     vl_logic_vector(2 downto 0);
        segmentos_hex   : out    vl_logic_vector(6 downto 0)
    );
end decodificador_operacao_hex;
