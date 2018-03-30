-- Codigo para el registro_i_d

library ieee;
use ieee.std_logic_1164.all;

entity registro_i_d is
	generic(n:integer:=8);
	port(Resetn,Clock,En,Ld,R:in std_logic;
		 Ent:in std_logic_vector(n-1 downto 0);
		 Q:buffer std_logic_vector(n-1 downto 0));
end registro_i_d;

architecture comportamiento of registro_i_d is
begin
	process(Resetn,Clock)
	begin
		if Resetn='0' then Q<=(others=>'0');
		elsif (clock'event and clock='1') then
			if En='1' then
				if Ld='1' then Q<=Ent;
					else desplazamiento:for i in 0 to n-2 loop
						Q(i)<=Q(i+1);
					end loop;
					Q(n-1)<=R;
				end if;
			end if;
		end if;
	end process;
end comportamiento;

