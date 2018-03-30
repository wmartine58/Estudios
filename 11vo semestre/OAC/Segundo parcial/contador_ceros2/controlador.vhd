--Controlador

library ieee;
use ieee.std_logic_1164.all;

entity controlador is
	port( Resetn,Clock:in std_logic;
	      Start,LdReg:in std_logic;
	      Regig0,Q0:in std_logic;
	      EnCnt,LdCnt:out std_logic;
	      EnReg,Fin:out std_logic);
end controlador;

architecture comportamiento of controlador is
	type estado is (Ta,Tb,Tc);
	signal y:estado;

begin
	process (Resetn,Clock)
		begin
			if Resetn ='0' then y<=Ta;
				elsif (Clock'event and Clock='1') then
				case y is
					when Ta=> if Start='0' then y<=Ta; else y<=Tb; end if;
					when Tb=> if Regig0='0' then y<=Tb;else y<=Tc; end if;
					when Tc=> if Start='1' then y<=Tc; else y<=Ta; end if;
				end case;
			end if;
	end process;

	process (y,Start,LdReg,Regig0,Q0)
		begin
			EnReg<='0';LdCnt<='0';EnCnt<='0';Fin<='0';
			case y is
				when Ta=> EnCnt<='1'; LdCnt<='1';
					if (Start='0' and LdReg='1') then EnReg<='1'; end if;
				when Tb=> EnReg<='1';
					if (Regig0='0' and Q0='0') then EnCnt<='1'; end if;
				when Tc=>Fin<='1';
			end case;
	end process;
end comportamiento;

