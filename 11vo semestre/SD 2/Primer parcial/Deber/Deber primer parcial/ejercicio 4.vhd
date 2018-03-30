library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port (Resetn, Clock, X1, X2: in std_logic;
			Q1, Q2: out std_logic);
end deber;

architecture comportamiento of leccion is
	type estado is (A, B, C);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = '0' then y <= A;
			elsif clock'event and clock = '1' then
				case y
					when A =>
						if X = '0' and Y = '0' then y <= A;
						elsif X = '0' and Y = '1' then y <= B;
						else y <= D;
						end if;
					when B =>
						y <= A;
					when C =>
						if X = '0' and Y = '0' then y <= B0;
						elsif X = '0' and Y = '1' then y <= D;
						else y <= A;
						end if;
				end case;
			end if
	end process;
	process (y, X1, X2)
		begin
			case y
				when A =>
					Q1 <= '1';
					Q2 <= '1';
				when B =>
					Q1 <= X1 or X2;
					Q2 <= '0';
				when C =>
					Q1 <= X1;
					Q2 <= '1';
			end case;
	end process;
end comportamiento;
				
			