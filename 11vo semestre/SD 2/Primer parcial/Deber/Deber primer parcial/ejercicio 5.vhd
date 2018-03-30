library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port (Resetn, Clock, In1, In2: in std_logic;
			S: out std_logic);
end deber;

architecture comportamiento of leccion is
	type estado is (S1, S2, S3);
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = '0' then y <= A;
			elsif clock'event and clock = '1' then
				case y
					when S1 =>
						if In1 = '0' and In2 = '0' then y <= S1;
						elsif In1 = '0' and In2 = '1' then y <= S3;
						elsif In1 = '1' and In2 = '0' then y <= S2;
						end if;
					when S2 =>
						if In1 = '0' and In2 = '0' then y <= S2;
						elsif In1 = '0' and In2 = '1' then y <= S1;
						elsif In1 = '1' and In2 = '0' then y <= S3;
						end if;
					when S3 =>
						if In1 = '0' and In2 = '0' then y <= S3;
						elsif In1 = '0' and In2 = '1' then y <= S2;
						elsif In1 = '1' and In2 = '0' then y <= S1;
						end if;
				end case;
			end if
	end process;
	process (y, S)
		begin
			case y
				when S1 =>
					S <= '0';
				when S2 =>
					S <= (In1 or In2);
				when S3 =>
					S <= In1;
			end case;
	end process;
end comportamiento;