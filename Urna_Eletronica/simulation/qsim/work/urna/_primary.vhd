library verilog;
use verilog.vl_types.all;
entity urna is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        key0            : in     vl_logic;
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        display1        : out    vl_logic_vector(6 downto 0);
        display2        : out    vl_logic_vector(6 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        finalizar       : in     vl_logic;
        LCD_ON          : out    vl_logic;
        LCD_BLON        : out    vl_logic;
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_RS          : out    vl_logic;
        LCD_DATA        : inout  vl_logic_vector(7 downto 0);
        teste2          : out    vl_logic_vector(2 downto 0);
        testeEstado     : out    vl_logic_vector(2 downto 0)
    );
end urna;
