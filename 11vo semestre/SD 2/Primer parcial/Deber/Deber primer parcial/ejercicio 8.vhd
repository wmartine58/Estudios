library ieee;
use ieee.std_logic_1164.all;

entity deber is
	port(Resetn, Clock, K: in std_logic;
			R, S: out std_logic);
end deber;

architecture comportamiento of deber is
	type estado is (e0, e1, e2, e3, e4)
	signal y: estado;
begin
	process (resetn, clock)
		begin
			if resetn = 0 then y<= e0;
			elsif clock'event and clock = '1' then
				case y
					when e0 =>
						if K = '0' then y <= e1;
						else y <= e2;
						end if;
					when e1 =>
						if X = '0' and Y = '0' then y <= e4;
						end if;
					when e2 =>
						if K = '1' then y <= e1;
						end if;
					when e3 =>
						if K = '0' then y <= e4;
						else y <= e5;
						end if;
					end if;
					when e4 =>
						if K = '0' then y <= e0;
						else y <= e5;
						end if;
				end case;
			end if;
	end process;
	process (y, R, S)
		begin
			case y
				when e0 =>
					R <= '0';
					S <= '0' when k = '0' else '1';
				when e1 =>
					R <= '1' when k = '0' else '0';
					S <= '0' when k = '0' else '1';
				when e2 =>
					R <= '0' when k = '1';
					S <= '0' when k = '1';
				when e3 =>
					R <= '0' when k = '0' else '1';
					S <= '1';
				when e4 =>
					R <= '0';
					S <= '1';
			end case;
	end process;
end comportamiento;