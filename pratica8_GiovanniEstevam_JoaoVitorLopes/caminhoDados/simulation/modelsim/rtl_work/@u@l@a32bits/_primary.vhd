library verilog;
use verilog.vl_types.all;
entity ULA32bits is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        op              : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        s               : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic
    );
end ULA32bits;
