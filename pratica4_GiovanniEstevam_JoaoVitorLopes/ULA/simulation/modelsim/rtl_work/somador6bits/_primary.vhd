library verilog;
use verilog.vl_types.all;
entity somador6bits is
    port(
        b               : in     vl_logic_vector(5 downto 0);
        cin             : in     vl_logic;
        s               : out    vl_logic_vector(5 downto 0)
    );
end somador6bits;
