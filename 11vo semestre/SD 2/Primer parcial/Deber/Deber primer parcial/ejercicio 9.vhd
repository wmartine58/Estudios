library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port (Resetn, Clock, X1, X2: in std_logic;
			S1, S2: out std_logic);
end deber;

architecture comportamiento of leccion is
	type estado is (A, B, C, D);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = '0' then y <= A;
			elsif clock'event and clock = '1' then
				case y
					when A =>
						if X = '0' and Y = '0' then y <= A;
						elsif X = '0' and Y = '1' then y <= D;
						elsif X = '1' and Y = '0' then y <= B;
						else y <= D;
						end if;
					when B =>
						if X = '0' and Y = '0' then y <= A;
						else y <= C;
						end if;
					when C =>
						if X = '0' and Y = '0' then y <= A;
						elsif X = '0' and Y = '1' then y <= D;
						else y <= C;
						end if;
					when D =>
						if X = '0' and Y = '0' then y <= A;
						else y <= C;
						end if;
				end case;
			end if
	end process;
	process (y, S1, S2)
		begin
			case y
				when A =>
					S1 <= X2;
					S2 <= '1';
				when B =>
					S1 <= '0';
					S2 <= '1';
				when C =>
					S1 <= X2;
					S2 <= '0';
				when D =>
					S1 <= '0';
					S2 <= X1;
			end case;
	end process;
end comportamiento;