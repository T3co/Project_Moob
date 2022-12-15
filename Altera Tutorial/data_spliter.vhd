library ieee;
use ieee.std_logic_1164.all;
entity data_spliter is
port (data : in bit_vector(7 downto 0);
	  motor : out bit_vector(3 downto 0);
		laserPointer : out bit_vector(6 downto 4);
		TBA : out bit);
end;
architecture behave of data_spliter is
begin
motor<=data(3 downto 0);
laserPointer<=data(6 downto 4);
TBA<=data(7);

end behave;
