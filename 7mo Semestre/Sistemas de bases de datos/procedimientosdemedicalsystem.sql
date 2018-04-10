delimiter ||
create procedure obtener_datos_paciente_y_ficha_medica(in id int)
begin
select * from Ficha_Medica f, Paciente p, Sexo s, GrupoSanguineo g where f.idPaciente = p.idPaciente 
and s.idSexo = p.SexoPaciente and f.idSanguineo = g.idSanguineo and p.idPaciente = id;
end ||

delimiter ||
create procedure obtener_ID_de_Paciente(in nombre varchar(50))
begin
select idPaciente from Paciente where namePaciente = nombre;
end ||

delimiter ||
create procedure obtener_datos_padres(in id int)
begin
select * from Datos_Padres d, GrupoSanguineo g where d.GSanguineo_Madre = g.idSanguineo
and d.idPaciente = id;
end ||

delimiter ||
create procedure registrar_certificado_medico(in id int, in descr varchar(100), in fechaActual date, in fechaFin date, in descr_presentar varchar(100))
begin
insert into Certificado_Medico(idPaciente,Descri_Diagnostico,FechaInicio,FechaFin,descrip_presentar) 
values(id, descr, fechaActual, fechaFin,descr_presentar);
end ||

delimiter ||
create procedure registrar_datos_pac(in namePaciente varchar(40), in fechaNacimiento date, in SexoPaciente int)
begin

insert into Paciente(NamePaciente,Fecha_Nacimiento,SexoPaciente) 
values(namePaciente, fechaNacimiento,SexoPaciente);

end ||

delimiter ||
create procedure registrar_datos_representante(in nombreRepre varchar(40), in direccion varchar(40)
,in telefono int, hijos int, in ingresos int, in sexo int,in idPac int)
begin

insert into Representante(Nombre_Repre,Direccion,telefono,NoHijos,Ingresos,Sexo,idPaciente) 
values(nombreRepre,direccion,telefono,hijos,ingresos,sexo,idPac);

end ||

delimiter ||
create procedure registrar_ficha_medica(in idPaciente int, in peso int, in tamaño int
, in idsang int, in pc int, in pt int, pa int, in coment varchar(40), in ant varchar(40)
,in aliment varchar(40), in apf varchar(40), in app varchar(40), in apg1 int, in apg2 int, in apg3 int
,in ingant varchar(40),in intercons varchar(40), in g int, in p int, in a int, in c int)
begin

insert into Ficha_Medica(idPaciente,Peso,Estatura,idSanguineo,PC,PT,PA,Comentarios,Antecedentes
,Alimentacion,APF,APP,APGAR1,APGAR2,APGAR3,IngrAnteriores,Interconsulta,G,P,A,C)
values(idPaciente,peso,tamaño,idsang,pc,pt,pa,coment,ant,aliment,apf,app,apg1,apg2,apg3
,ingant,intercons,g,p,a,c);

end ||

delimiter ||
create procedure registrar_datos_padres(in ar1 varchar(40), in ar2 varchar(40), in ar3 varchar(50)
,in ar4 int, in ar5 int, in ar6 int, in ar7 int,in ar8 int, in ar9 int, in ar10 int)
begin

insert into Datos_Padres(Nombre_Padre,Nombre_Madre,Direccion,telefono,movil,NoHijos,Ingresos,
GSanguineo_Padre,GSanguineo_Madre,IDPaciente)
values(ar1,ar2,ar3,ar4,ar5,ar6,ar7,ar8,ar9,ar10);

end ||

delimiter ||
create procedure registrar_datos(in namePaciente varchar(40), in fechaNacimiento date, in SexoPaciente int
,in nombreRepre varchar(40), in direccion varchar(40),in telefono int, hijos int, in ingresos int, in sexo int
,in peso int, in tamaño int, in idsang int, in pc int, in pt int, pa int, in coment varchar(40), in ant varchar(40)
,in aliment varchar(40), in apf varchar(40), in app varchar(40), in apg1 int, in apg2 int, in apg3 int
,in ingant varchar(40),in intercons varchar(40), in g int, in p int, in a int, in c int
,in ar1 varchar(40), in ar2 varchar(40), in ar3 varchar(50), in ar4 int
,in ar5 int, in ar6 int, in ar7 int,in ar8 int, in ar9 int)
begin
declare id int;
call registrar_datos_pac(namePaciente,fechaNacimiento,SexoPaciente);

select idPaciente into id from Paciente where NamePaciente = namePaciente and fechaNacimiento = Fecha_Nacimiento;

call registrar_datos_representante(nombreRepre,direccion,telefono,hijos,ingresos,sexo,id);

call registrar_ficha_medica(id,peso,tamaño,idsang,pc,pt,pa,coment,ant,aliment,apf
,app,apg1,apg2,apg3,ingant,intercons,g,p,a,c);

call registrar_datos_padres(ar1,ar2,ar3,ar4,ar5,ar6,ar7,ar8,ar9,id);

end ||

delimiter ||
create procedure registrar_datos_laboratorio (in ar1 int,in ar2 varchar(40),in ar3 varchar(5),in ar4 varchar(5),in ar5 varchar(5),in ar6 varchar(5)
,in ar7 varchar(5),in ar8 varchar(5),in ar9 varchar(5),in ar10 varchar(5),in ar11 varchar(5),in ar12 varchar(5),in ar13 varchar(5),in ar14 varchar(5),in ar15 varchar(5)
,in ar16 varchar(5),in ar17 varchar(5),in ar18 varchar(5),in ar19 varchar(5),in ar20 varchar(5),in ar21 varchar(5),in ar22 varchar(5),in ar23 varchar(5),in ar24 varchar(5)
,in ar25 varchar(5),in ar26 varchar(5),in ar27 varchar(5),in ar28 varchar(5),in ar29 varchar(5),in ar30 varchar(5),in ar31 varchar(5),in ar32 varchar(5),in ar33 varchar(5)
,in ar34 varchar(5),in ar35 varchar(5))
begin
insert into Laboratorio(idOrden,SolicitadoPor,Hermaties,Leucocitos,Schilling,Eritrosedimientacion
,Reticulocitus,Plasmodium,GrupoSanguineo,Plaquetas,TiempoSangre,Tiempo_Coagulacion,T_Protrombina,Parcial_Protrombina
,Fibrinogeno,Proteinas,TestLues,ReaccionWidal,Brucella_abortus,CelulaLE,FisicoyQuimico,sedimientos,PruebaEmbarazo
,CultivoOrina,Direct_paraByk,Parasitologico,SangreOculta,CitoloiaFecal,CultivoHeces,RA_Test,AntiEstres,TransFresco
,Proteux,Hematocritos,Toxoplasmosis) values(ar1,ar2,ar3,ar4,ar5,ar6,ar7,ar8,ar9,ar10,ar11,ar12,ar13,ar14,ar15,ar16,ar17,ar18,ar19,ar20,ar21,ar22
,ar23,ar24,ar25,ar26,ar27,ar28,ar29,ar30,ar31,ar32,ar33,ar34,ar35);
end ||

delimiter ||
create procedure obtener_ID_orden(in id int)
begin
select o.idOrden from Orden o, Consulta c, Ficha_Medica f, Paciente p where o.idConsulta = c.id_Consulta
and c.idFicha = f.idFicha and f.idPaciente = p.idPaciente and p.idPaciente = id;
end ||

delimiter ||
create procedure registrar_datos_receta(in id int, in detalle varchar(40))
begin
insert into Receta(idConsulta, detalleReceta) values(id,detalle);
end ||

create procedure obtener_ID_consulta(in id int)
begin

select c.id_Consulta
from Consulta c, Ficha_Medica f, Paciente p 
where c.idFicha = f.idFicha and p.idPaciente = f.idPaciente and f.idPaciente = id
ORDER BY c.id_Consulta DESC LIMIT 1;

end ||


delimiter //
create procedure registrar_datos_paciente(IN NomPac varchar(50), IN Fecha date, IN sexoP int,
IN NomRep varchar(50), IN Ced int, IN Dir varchar(50),IN Telf int, IN Mov int, IN NoHijos int, 
IN Ingresos int, IN sexoR int)
begin
	insert into Paciente(NamePaciente, Fecha_Nacimiento, SexoPaciente) 
				values (NomPac, Fecha,sexoP);
	insert into Representante(Nombre_Repre, Cedula, Direccion, telefono,movil, NoHijos,Ingresos, Sexo)
				values(NomRep,Ced,Dir,Telf,Mov,NoHijos,Ingresos, SexoR);

end //

delimiter //
create procedure PresentarRayosX (in id int)
begin
select   x.Sintomas , x.Diagnostico_presuntivo,x.Se_Solicita
from RAYOS_X x, Orden o, Consulta c, Ficha_Medica fm, Paciente p
WHERE x.idOrden=o.idOrden and o.idConsulta=c.id_Consulta and c.idFicha=fm.idFicha
	   and fm.idPaciente=p.idPaciente and p.idPaciente=id;
end//

delimiter //
create  procedure obtener_datos_paciente_y_representante(in id int)
begin
select  *
from Paciente p, Representante r
where p.idPaciente = r.idPaciente and p.idPaciente = id;
end //


