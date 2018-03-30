library ieee;
use ieee.std_logic_1164.all;

package componentes is
	component reg
		generic (n:integer:=4);
		port(ent:in std_logic_vector(n-1 downto 0);
			EN,clock:in std_logic;
			Q:out std_logic_vector(n-1 downto 0));
	end component;

	component contador_up
		generic (m:integer:=4);
		port(Resetn,Clock,En,Ld:in std_logic;
			 Ent:in std_logic_vector(m-1 downto 0);
			 Q:buffer std_logic_vector(m-1 downto 0));
	end component;

	component registro_i_d
		generic(n:integer:=8);
		port(Resetn,Clock,En,Ld,R:in std_logic;
			 Ent:in std_logic_vector(n-1 downto 0);
			 Q:buffer std_logic_vector(n-1 downto 0));
	end component;
end componentes;

