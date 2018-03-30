--Codigo para el contador_up

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_up is
	generic (m:integer:=4);
	port(Resetn,Clock,En,Ld:in std_logic;
		 Ent:in std_logic_vector(m-1 downto 0);
		 Q:buffer std_logic_vector(m-1 downto 0));
end contador_up;

architecture comportamiento of contador_up is
begin
	process(Resetn,Clock)
	begin
		if Resetn='0' then Q<=(others=>'0');
		elsif (clock'event and Clock='1') then
			if En='1' then
				if Ld='1' then Q<= Ent;
					else Q<=Q+'1';
				end if;
			end if;
		end if;
	end process;
end comportamiento;

