library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port(Resetn, Clock, X, Y: in std_logic;
			OK: out std_logic);
end deber;

architecture comportamiento of deber is
	type estado is (e0, e1, e2, e3, e4, e5, e6, e7);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn='0' then y <= e0;
			elsif clock'event and clok = '1' then
				case y
					when e0 =>
						if X = '1' and Y = '1' then y <= e1;
						else y <= e0;
						end if;
					when e1 =>
						if X = '0' and Y = '0' then y <= e3;
						elsif X = '0' and Y = '1' then y <= e5;
						elsif X = '1' and Y = '0' then y <= e5;
						else y <= e3;
						end if;
					when e2 =>
						if X = '0' and Y = '0' then y <= e6;
						elsif X = '0' and Y = '1' then y <= e4;
						elsif X = '1' and Y = '0' then y <= e4;
						else y <= e6;
						end if;
					when e3 =>
						if X = '0' and Y = '0' then y <= e2;
						elsif X = '0' and Y = '1' then y <= e7;
						elsif X = '1' and Y = '0' then y <= e7;
						else y <= e2;
						end if;
					when e4 =>
						y <= e0;
					when e5 =>
						y <= e7;
					when e6 =>
						y <= e0;
				end case;
			end if;
	end process;
	OK <= not(X*not(Y)+ not(X)*Y) when y = e6 else '0';
end comportamiento;
						