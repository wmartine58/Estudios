library ieee;
use ieee.std_logic_1164.all;
use work.componentes.all;

entity detector_ceros is
	port(Resetn,Clock:in std_logic;
		 start,Ld_Reg:in std_logic;
		 data:in std_logic_vector(7 downto 0);
		 Fin: out std_logic;
		 num_ceros:buffer std_logic_vector(3 downto 0));
end detector_ceros;

architecture sol of detector_ceros is
	type estado is(Ta,Tb,Tc);
	signal y:estado;
	signal Rig0,EnC,LdC,EnR,uno:std_logic;
	signal Q:std_logic_vector(7 downto 0);
	signal cero4:std_logic_vector(3 downto 0);

	begin
	--Transición Controlador
	process(Resetn,Clock)
	begin
		if Resetn='0' then y<=Ta;
		elsif clock'event and Clock='1' then
			case y is 
				when Ta=>if start='0' then y<=Ta;
						 else y<=Tb; end if;
				when Tb=>if Rig0='0' then y<=Tb;
						 else y<=Tc; end if;
				when Tc=>if start='0' then y<=Ta;
						 else y<=Tc; end if;
			end case;
		end if;
	end process;

	--Salidas Controlador
	process (y,start,Ld_Reg,Rig0,Q(0))
	begin
		if(y=Ta) or (y=Tb and Rig0='0' and Q(0)='0') then EnC<='1';--Cambio realizado Q(0)='0'en lugar de Q(0)='1' 
			else EnC<='0'; end if;
		if y=Ta then LdC<='1'; 
			else LdC<='0'; end if;
		if(y=Tb) or (y=Ta and start='0' and Ld_Reg='1') then EnR<='1';
			else EnR<='0'; end if;
		if(y=Tc) then Fin<='1';
			else Fin<='0';  end if;
	end process;

	--Procesador de Datos
	Registro:registro_i_d generic map(n=>8)
		port map(Resetn,Clock,EnR,Ld_Reg,uno,data,Q);
	uno<='1';--Cambio realizado la señal uno

	Contador:contador_up generic map(m=>4)
		port map(Resetn,Clock,EnC,LdC,cero4,num_ceros);
	cero4<="0000";

	Rig0<='1' when Q="11111111" else '0';--Cambio realizado Q="11111111" en lugar de Q="00000000"  
end sol;

