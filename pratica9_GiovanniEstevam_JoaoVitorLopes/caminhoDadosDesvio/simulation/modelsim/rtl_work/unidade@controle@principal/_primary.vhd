library verilog;
use verilog.vl_types.all;
entity unidadeControlePrincipal is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ULAOp           : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        ULASrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end unidadeControlePrincipal;
