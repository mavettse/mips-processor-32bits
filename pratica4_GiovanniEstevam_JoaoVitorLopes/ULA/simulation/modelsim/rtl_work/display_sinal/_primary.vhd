library verilog;
use verilog.vl_types.all;
entity display_sinal is
    port(
        bit_sinal       : in     vl_logic;
        seg             : out    vl_logic_vector(6 downto 0)
    );
end display_sinal;
