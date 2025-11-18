library verilog;
use verilog.vl_types.all;
entity unidadeControleULA is
    port(
        funct           : in     vl_logic_vector(5 downto 0);
        ULAOp           : in     vl_logic_vector(1 downto 0);
        op              : out    vl_logic_vector(2 downto 0)
    );
end unidadeControleULA;
