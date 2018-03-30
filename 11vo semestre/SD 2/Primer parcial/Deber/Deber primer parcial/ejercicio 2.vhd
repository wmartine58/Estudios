library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port (Resetn, Clock, DG1, DG2: in std_logic;
			S: out std_logic);
end deber;

architecture comportamiento of deber is
	type estado is (e0, e1, e2, e3, e4);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = '0' then y <= e0;
			elsif clock'event and clock = '1' then
				case y
					when e0 =>
						if DG1 = '0' and DG2 = '0' then y <= e0;
						elsif DG1 = '0' and DG2 = '1' then y <= e2;
						elsif DG1 = '1' and DG2 = '0' then y <= e1;
						else y <= e0;
						end if;
					when e1 =>
						if DG1 = '0' and DG2 = '0' then y <= e1;
						elsif DG1 = '0' and DG2 = '1' then y <= e3;
						elsif DG1 = '1' and DG2 = '0' then y <= e4;
						else y <= e1;
						end if;
					when e2 =>
						if DG1 = '0' and DG2 = '0' then y <= e2;
						elsif DG1='0' and DG2 = '1' then y <= e1;
						elsif DG1='1' and DG2 = '0' then y <= e3;
						else y <= e2;
						end if;
					when e3 =>
						if DG1 = '0' and DG2 = '0' then y <= e4;
						else y <= e0;
						end if;
					when e4 =>
						y <= e2;
				end case;
			end if;
	end process;
	S <= '1' when y = e3 or y = e4 else '0';
end comportamiento;