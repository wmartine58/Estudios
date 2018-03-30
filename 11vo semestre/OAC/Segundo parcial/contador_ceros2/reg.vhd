library ieee;
use ieee.std_logic_1164.all;

Entity reg is
	generic (n:integer:=4);
	port(ent:in std_logic_vector(n-1 downto 0);
		EN,clock:in std_logic;
		Q:out std_logic_vector(n-1 downto 0));
	end reg;

Architecture sol OF reg IS
BEGIN
PROCESS(clock)
BEGIN
	if clock'event and clock='1' then
		if EN='1' then Q<=ent;
		end if;
	end if;
end process;
end sol;

