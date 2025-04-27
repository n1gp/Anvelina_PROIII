library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity datetime is
  port(
  --  Day   : out std_logic_vector(4 downto 0);
  --  Month : out std_logic_vector(3 downto 0);
  --  Year  : out std_logic_vector(4 downto 0));
  Epoch_min  : out std_logic_vector(25 downto 0));
  -- Date information
  constant YEAR_INT  : integer                       := 2025;
  constant YEAR_HEX  : std_logic_vector(15 downto 0) := X"2025";
  constant MONTH_INT : integer                       := 03;
  constant MONTH_HEX : std_logic_vector(7 downto 0)  := X"03";
  constant DAY_INT   : integer                       := 04;
  constant DAY_HEX   : std_logic_vector(7 downto 0)  := X"04";
  constant DATE_HEX  : std_logic_vector(31 downto 0) := YEAR_HEX & MONTH_HEX & DAY_HEX;
  -- Time information
  constant HOUR_INT   : integer                       := 16;
  constant HOUR_HEX   : std_logic_vector(7 downto 0)  := X"16";
  constant MINUTE_INT : integer                       := 02;
  constant MINUTE_HEX : std_logic_vector(7 downto 0)  := X"02";
  constant SECOND_INT : integer                       := 02;
  constant SECOND_HEX : std_logic_vector(7 downto 0)  := X"02";
  constant TIME_HEX   : std_logic_vector(31 downto 0) := X"00" & HOUR_HEX & MINUTE_HEX & SECOND_HEX;
  -- Miscellaneous information
  constant EPOCH_INT  : integer := 1741122122;  -- Seconds since 1970-01-01_00:00:00


end datetime;

architecture rtl of datetime is
begin
--  Day   <= conv_std_logic_vector(datetime.day_int, 5);
--  Month <= conv_std_logic_vector(datetime.month_int, 4);
--  Year  <= conv_std_logic_vector(datetime.year_int mod 100, 5);
  Epoch_min  <= conv_std_logic_vector(datetime.epoch_int / 60, 26);
end architecture rtl;
