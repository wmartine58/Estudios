library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port(Resetn, Clock, A, B: in std_logic;
			HP: out std_logic);
end deber;

architecture comportamiento of deber is
	type estado is (e0, e1, e2, e3, e4, e5);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = 0 then y<= e0;
			elsif clock'event and clock = '1' then
				case y
					when e0 =>
						if X = '0' and Y = '0' then y <= e0;
						elsif X = '0' and Y = '1' then y <= e2;
						elsif X = '1' and Y = '0' then y <= e1;
						else y <= e0;
					end if;
					when e1 =>
						if X = '0' and Y = '0' then y <= e2;
						else y <= e3;
						end if;
					when e2 =>
						if X = '1' and Y = '1' then y <= e1;
						else y <= e3;
						end if;
					when e3 =>
						y <= e0;
					end if;
					when e4 =>
						if X = '0' and Y = '0' then y <= e0;
						elsif X = '0' and Y = '1' then y <= e1;
						elsif X = '1' and Y = '0' then y <= e2;
						else y <= e3;
						end if;
					when e5 =>
						y <= e0;
					end if;
				end case;
			end if;
	end process;
	HP <= X or Y when y = e3 or y = e4 else '0';
end comportamiento;	
			