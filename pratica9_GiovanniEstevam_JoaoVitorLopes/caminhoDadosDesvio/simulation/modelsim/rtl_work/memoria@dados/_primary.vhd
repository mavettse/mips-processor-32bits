library verilog;
use verilog.vl_types.all;
entity memoriaDados is
    port(
        address         : in     vl_logic_vector(5 downto 0);
        memWrite        : in     vl_logic;
        memRead         : in     vl_logic;
        clock           : in     vl_logic;
        writeData       : in     vl_logic_vector(31 downto 0);
        readData        : out    vl_logic_vector(31 downto 0)
    );
end memoriaDados;
