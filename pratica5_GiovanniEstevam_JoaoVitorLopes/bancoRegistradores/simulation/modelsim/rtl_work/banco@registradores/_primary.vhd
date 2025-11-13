library verilog;
use verilog.vl_types.all;
entity bancoRegistradores is
    port(
        Read1           : in     vl_logic_vector(4 downto 0);
        Read2           : in     vl_logic_vector(4 downto 0);
        WriteReg        : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        RegWrite        : in     vl_logic;
        Data1           : out    vl_logic_vector(31 downto 0);
        Data2           : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end bancoRegistradores;
