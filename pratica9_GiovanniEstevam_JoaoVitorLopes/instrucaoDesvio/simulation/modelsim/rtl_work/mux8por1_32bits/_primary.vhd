library verilog;
use verilog.vl_types.all;
entity mux8por1_32bits is
    port(
        res_and         : in     vl_logic_vector(31 downto 0);
        res_or          : in     vl_logic_vector(31 downto 0);
        res_soma        : in     vl_logic_vector(31 downto 0);
        res_slt         : in     vl_logic_vector(31 downto 0);
        ULAop           : in     vl_logic_vector(2 downto 0);
        s               : out    vl_logic_vector(31 downto 0)
    );
end mux8por1_32bits;
