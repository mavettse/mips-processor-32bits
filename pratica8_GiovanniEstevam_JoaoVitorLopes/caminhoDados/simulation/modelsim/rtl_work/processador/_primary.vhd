library verilog;
use verilog.vl_types.all;
entity processador is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        pcout_out       : out    vl_logic_vector(31 downto 0);
        instruction_out : out    vl_logic_vector(31 downto 0);
        ULA_result_out  : out    vl_logic_vector(31 downto 0);
        zero_out        : out    vl_logic;
        overflow_out    : out    vl_logic;
        reg1_data_out   : out    vl_logic_vector(31 downto 0);
        reg2_data_out   : out    vl_logic_vector(31 downto 0);
        immediate_out   : out    vl_logic_vector(31 downto 0);
        op_out          : out    vl_logic_vector(2 downto 0);
        ULASrc_out      : out    vl_logic
    );
end processador;
