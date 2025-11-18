library verilog;
use verilog.vl_types.all;
entity somador32bits is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        cin             : in     vl_logic;
        s               : out    vl_logic_vector(31 downto 0);
        cout            : out    vl_logic;
        overflow        : out    vl_logic
    );
end somador32bits;
