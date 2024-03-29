
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package nexys4_pack is

    constant data_out_width : integer := 16;
    constant data_in_width : integer := 16;
    constant cache_address_width : integer := 29;
    constant cache_way_width : integer := 1;
    constant cache_index_width : integer := 5;
    constant cache_offset_width : integer := 4;
    constant cache_replace_strat : string := "rr";
    constant uart_baud : positive := 9600;
    constant uart_clock_frequency : positive := 50000000;
    constant lock_control_default : integer := 0;

end package;