library verilog;
use verilog.vl_types.all;
entity urna is
    generic(
        esperaMsg       : integer := 0;
        esperaDigito    : integer := 1;
        confirmaDig     : integer := 2;
        confirmaMsg     : integer := 3;
        apura           : integer := 4;
        cadvencedor     : integer := 5;
        totalvotos1     : integer := 6;
        totalvotos2     : integer := 7;
        cad1            : integer := 10;
        cad2            : integer := 13;
        cad3            : integer := 17;
        cad             : integer := 51
    );
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        key0            : in     vl_logic;
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        teste           : out    vl_logic_vector(2 downto 0);
        chave           : in     vl_logic;
        confirma        : out    vl_logic;
        negacao         : out    vl_logic;
        valor1          : out    vl_logic_vector(3 downto 0);
        valor2          : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of esperaMsg : constant is 1;
    attribute mti_svvh_generic_type of esperaDigito : constant is 1;
    attribute mti_svvh_generic_type of confirmaDig : constant is 1;
    attribute mti_svvh_generic_type of confirmaMsg : constant is 1;
    attribute mti_svvh_generic_type of apura : constant is 1;
    attribute mti_svvh_generic_type of cadvencedor : constant is 1;
    attribute mti_svvh_generic_type of totalvotos1 : constant is 1;
    attribute mti_svvh_generic_type of totalvotos2 : constant is 1;
    attribute mti_svvh_generic_type of cad1 : constant is 1;
    attribute mti_svvh_generic_type of cad2 : constant is 1;
    attribute mti_svvh_generic_type of cad3 : constant is 1;
    attribute mti_svvh_generic_type of cad : constant is 1;
end urna;
