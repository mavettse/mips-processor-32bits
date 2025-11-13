library verilog;
use verilog.vl_types.all;
entity hex_display is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(0 to 6)
    );
end hex_display;
