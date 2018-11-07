library verilog;
use verilog.vl_types.all;
entity urna_vlg_sample_tst is
    port(
        LCD_DATA        : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        finalizar       : in     vl_logic;
        key0            : in     vl_logic;
        key1            : in     vl_logic;
        key2            : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end urna_vlg_sample_tst;
