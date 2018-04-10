CREATE DATABASE  IF NOT EXISTS `medicalsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `medicalsystem`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 192.168.81.129    Database: medicalsystem
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Consulta`
--

DROP TABLE IF EXISTS `Consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consulta` (
  `id_Consulta` int(11) NOT NULL AUTO_INCREMENT,
  `idFicha` int(11) DEFAULT NULL,
  `EdadActual` int(11) DEFAULT NULL,
  `PesoActual` decimal(3,2) DEFAULT NULL,
  `Talla` decimal(2,2) DEFAULT NULL,
  `Fecha_Actual` date DEFAULT NULL,
  `idOrden` int(11) DEFAULT NULL,
  `Detalle` varchar(80) DEFAULT NULL,
  `Motivo_Evaluacion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_Consulta`),
  KEY `idFicha` (`idFicha`),
  CONSTRAINT `Consulta_ibfk_1` FOREIGN KEY (`idFicha`) REFERENCES `Ficha_Medica` (`idFicha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consulta`
--

LOCK TABLES `Consulta` WRITE;
/*!40000 ALTER TABLE `Consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consulta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET @sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger IDORDEN After insert on Consulta
for each row
begin
declare consultaId int;
insert into consultaId values( new.Id_consulta);
insert into Orden(idConsulta) values (consultaId);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Datos_Padres`
--

DROP TABLE IF EXISTS `Datos_Padres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Datos_Padres` (
  `idDatos_Padres` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Padre` varchar(40) DEFAULT NULL,
  `Nombre_Madre` varchar(40) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `movil` varchar(10) DEFAULT NULL,
  `NoHijos` int(2) DEFAULT NULL,
  `Ingresos` decimal(4,0) DEFAULT NULL,
  `GSanguineo_Padre` int(11) DEFAULT NULL,
  `GSanguineo_Madre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDatos_Padres`),
  KEY `fkgs_1_idx` (`GSanguineo_Padre`),
  KEY `fksa_2_idx` (`GSanguineo_Madre`),
  CONSTRAINT `fkgs_1` FOREIGN KEY (`GSanguineo_Padre`) REFERENCES `GrupoSanguineo` (`idSanguineo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fksa_2` FOREIGN KEY (`GSanguineo_Madre`) REFERENCES `GrupoSanguineo` (`idSanguineo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datos_Padres`
--

LOCK TABLES `Datos_Padres` WRITE;
/*!40000 ALTER TABLE `Datos_Padres` DISABLE KEYS */;
INSERT INTO `Datos_Padres` VALUES (1,'CADENA ARCENTALES JORGE ANTONIO','PAREDES QUINDE MARIA','CDLA. PARAISO CALLE 4TA AVE, PRIMERA','2365415','0963254584',3,700,2,2),(2,'RODRIGUEZ CHICA MANUEL RICARDO','GOMEZ ORTEGA JUANA','CDLA. ALBORADA CALLE 3TA AVE, PRINCIPAL','2365415','0963252144',2,1200,3,1),(3,'PANCHANA OLMEDO JOSUE CARLOS','JURADO VENTIMILLA LUISA','CDLA. ORQUIDEAS 7MA ETAPA AVE, PRINCIPAL','2361423','0998252111',3,800,4,2),(4,'SOLORZANO QUIZHPI LUIS ANDRES','VERA ESCALANTE CARLA','CDLA. URDENOR CALLE 6TA AVE, 2DA','2365415','0963253423',2,900,2,2),(5,'RIVAS CUENCA MANUEL RICARDO','CANTOS FLORES JULIA','CDLA. 9 OCTUBRE CALLE 4TA AVE, 4TA','2366511','0963252156',2,500,5,6),(6,'SALCEDO GARCIA ARMANDO','MURILLO PORTILLA MARIA','CDLA. SANTA CECILIA CALLE 2TA MZ 12 AVE, PRINCIPAL','2367618','0963244765',3,800,3,8),(7,'ANDRADE CUEVAS MANUEL RICARDO','PINZON ORTEGA MARITZA','URDESA CALLE 3TA AVE, PRINCIPAL','2367817','093252112',1,600,5,4),(8,'CADENA PEÑAFIEL MANUEL VICTOR','BRIONES ALVARADO FLOR','MUCHO LOTE 2 CALLE 3TA AVE, PRINCIPAL','2368815','0963252164',4,1000,7,6),(9,'CEDEÑO TOALA VASQUEZ EDWIN','MOLINA BERMUDEZ ESTEFANIA','ORQUIDEAS CALLE 2DA AVE, PRINCIPAL','2368814','0963252163',3,2000,4,2),(10,'VILLAFUERTE MUÑOZ MANUEL VICTOR','POZO ALVARADO FLOR','MUCHO LOTE 2 CALLE 5TA AVE, PRINCIPAL','2368815','0963252164',4,1500,1,1),(11,'ALCIVAR GARCIA JORGE ENRIQUE','RIVERA CEVALLOS MARITZA','MUCHO LOTE 1 CALLE 6DA AVE, PRINCIPAL','2368814','0963252163',3,900,5,3),(12,'CEPEDA RIVAS JULIO ANTONIO','ALVARADO ROCA LUCIA MARIA','GUASMO CENTRAL Y PRIMAVERA','23232323','0987434343',4,300,5,5),(14,'ARCENTALES MUÑOZ CARLOS','MONTAÑO ANGULO MARCELA','ESMERALDAS','234566667','234234234',2,2344,3,3);
/*!40000 ALTER TABLE `Datos_Padres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ecografia`
--

DROP TABLE IF EXISTS `Ecografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ecografia` (
  `idEcografia` int(11) NOT NULL AUTO_INCREMENT,
  `idOrden` int(11) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEcografia`),
  KEY `idOrden` (`idOrden`),
  CONSTRAINT `Ecografia_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `Orden` (`idOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ecografia`
--

LOCK TABLES `Ecografia` WRITE;
/*!40000 ALTER TABLE `Ecografia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ecografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Estatura`
--

DROP TABLE IF EXISTS `Estatura`;
/*!50001 DROP VIEW IF EXISTS `Estatura`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Estatura` (
  `Estatura` tinyint NOT NULL,
  `NamePaciente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Ficha_Medica`
--

DROP TABLE IF EXISTS `Ficha_Medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ficha_Medica` (
  `idFicha` int(11) NOT NULL AUTO_INCREMENT,
  `idPaciente` int(11) DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `Estatura` int(11) DEFAULT NULL,
  `Discapacidad` varchar(20) DEFAULT NULL,
  `idSanguineo` int(11) DEFAULT NULL,
  `PC` int(11) DEFAULT NULL,
  `PT` int(11) DEFAULT NULL,
  `PA` int(11) DEFAULT NULL,
  `Comentarios` varchar(100) DEFAULT NULL,
  `Antecedentes` varchar(100) DEFAULT NULL,
  `Alimentacion` varchar(10) DEFAULT NULL,
  `EG` varchar(10) DEFAULT NULL,
  `APF` varchar(50) DEFAULT NULL,
  `APP` varchar(50) DEFAULT NULL,
  `APGAR1` int(11) DEFAULT NULL,
  `APGAR2` int(11) DEFAULT NULL,
  `APGAR3` int(11) DEFAULT NULL,
  `IngrAnteriores` varchar(50) DEFAULT NULL,
  `Interconsulta` varchar(50) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `P` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFicha`),
  KEY `idPaciente` (`idPaciente`),
  KEY `idSanguineo` (`idSanguineo`),
  CONSTRAINT `Ficha_Medica_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `Paciente` (`idPaciente`),
  CONSTRAINT `Ficha_Medica_ibfk_2` FOREIGN KEY (`idSanguineo`) REFERENCES `GrupoSanguineo` (`idSanguineo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ficha_Medica`
--

LOCK TABLES `Ficha_Medica` WRITE;
/*!40000 ALTER TABLE `Ficha_Medica` DISABLE KEYS */;
INSERT INTO `Ficha_Medica` VALUES (1,1,1,1,'no',7,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',1,4,7,2,2,1,1),(2,4,19,75,'no',7,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',2,5,3,2,2,1,1),(3,5,45,60,'no',7,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',3,2,3,4,1,2,2),(4,2,40,45,'no',4,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','ingresado','Sin interconsulta',2,4,6,2,3,1,2),(5,3,15,75,'no',4,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',2,2,2,2,3,3,3),(6,6,23,78,'no',2,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','ingresado','Sin interconsulta',3,1,2,3,4,6,2),(7,7,80,80,'no',1,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',3,2,2,3,6,7,2),(8,8,12,74,'no',3,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',1,3,2,2,4,3,4),(9,9,29,76,'no',4,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',4,1,2,3,7,8,2),(10,10,12,50,'no',8,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','no ingresado','Sin interconsulta',5,1,1,6,5,2,1),(11,11,25,60,'no',2,10,20,7,'ninguno','ninguno','normal','bueno','bueno','bueno','ingresado','Sin interconsulta',5,1,2,4,6,2,2);
/*!40000 ALTER TABLE `Ficha_Medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GrupoSanguineo`
--

DROP TABLE IF EXISTS `GrupoSanguineo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GrupoSanguineo` (
  `idSanguineo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSanguineo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idSanguineo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GrupoSanguineo`
--

LOCK TABLES `GrupoSanguineo` WRITE;
/*!40000 ALTER TABLE `GrupoSanguineo` DISABLE KEYS */;
INSERT INTO `GrupoSanguineo` VALUES (1,'A +'),(2,'A -'),(3,'B +'),(4,'B -'),(5,'AB +'),(6,'AB -'),(7,'O +'),(8,'O -');
/*!40000 ALTER TABLE `GrupoSanguineo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Laboratorio`
--

DROP TABLE IF EXISTS `Laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laboratorio` (
  `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `idOrden` int(11) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLaboratorio`),
  KEY `idOrden` (`idOrden`),
  CONSTRAINT `Laboratorio_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `Orden` (`idOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laboratorio`
--

LOCK TABLES `Laboratorio` WRITE;
/*!40000 ALTER TABLE `Laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orden`
--

DROP TABLE IF EXISTS `Orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orden` (
  `idOrden` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Orden` date DEFAULT NULL,
  `DescriptionOrden` varchar(80) DEFAULT NULL,
  `Lugar` varchar(10) DEFAULT NULL,
  `idConsulta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrden`),
  KEY `idConsulta` (`idConsulta`),
  CONSTRAINT `Orden_ibfk_1` FOREIGN KEY (`idConsulta`) REFERENCES `Consulta` (`id_Consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orden`
--

LOCK TABLES `Orden` WRITE;
/*!40000 ALTER TABLE `Orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paciente` (
  `idPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `NamePaciente` varchar(100) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `SexoPaciente` int(11) NOT NULL,
   `Edad` int(2) NOT NULL,
  `idDatos_Padres` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `sexopacientobfk_2_idx` (`SexoPaciente`),
  KEY `dtPadre_fk3_idx` (`idDatos_Padres`),
  CONSTRAINT `dtPadre_fk3` FOREIGN KEY (`idDatos_Padres`) REFERENCES `Datos_Padres` (`idDatos_Padres`),
  CONSTRAINT `sexopacientobfk_2` FOREIGN KEY (`SexoPaciente`) REFERENCES `Sexo` (`idSexo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

CREATE TABLE Certificado_Medico(
idCertificado int auto_increment,
idPaciente int,
Descri_Diagnostico varchar(100),
Fecha_Actual date,
FechaInicio date,
FechaFin date,
descrip_presentar varchar(100),
primary key (idCertificado),
foreign key (idPaciente) references Paciente(idPaciente)
);

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` VALUES (1,'PAREDES CADENA SARA MISHELLE','2011-08-15',2,8,1),(2,'RODRIGUEZ GOMEZ CARLA ESTEPHANY','2010-05-12',2,9,2),(3,'PANCHANA JURADO MARIO ANTONIO','2013-02-18',1,11,3),(4,'SOLORZANO VERA RODRIGO STEVEN','2009-04-05',1,4,4),(5,'RIVAS CANTOS MELANIE BERENICE','2008-11-22',2,3,5),(6,'SALCEDO MURILLO CARLOS MATHIAS','2014-04-25',1,7,6),(7,'ANDRADE PINZON SELENA NATASHA','2006-09-29',2,9,7),(8,'CADENA BRIONES ALVIERY STEVEN','2006-07-22',1,5,8),(9,'CEDEÑO MOLINA RICARDO ANDRES','2011-08-19',1,14,9),(10,'VILLAFUERTE POZO PATRICIO JOSE','2010-09-02',1,6,10),(11,'ALCIVAR RIVERA ALINE DOMENICA','2007-11-23',2,7,11),(12,'BUSTOS ASCENCIO ANGEL RICARDO','2011-03-17',1,10,3);
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger EdadActual  before insert on Paciente
for each row
begin
if(NEW.Fecha_Nacimiento < 2000-01-01) then
set new.Fecha_Nacimiento = null;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RAYOS_X`
--

DROP TABLE IF EXISTS `RAYOS_X`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RAYOS_X` (
  `idRayosX` int(11) NOT NULL AUTO_INCREMENT,
  `idOrden` int(11) DEFAULT NULL,
  `Sintomas` varchar(50) DEFAULT NULL,
  `Diagnostico_presuntivo` varchar(45) DEFAULT NULL,
  `Se_Solicita` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRayosX`),
  KEY `idOrden` (`idOrden`),
  CONSTRAINT `RAYOS_X_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `Orden` (`idOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAYOS_X`
--

LOCK TABLES `RAYOS_X` WRITE;
/*!40000 ALTER TABLE `RAYOS_X` DISABLE KEYS */;
/*!40000 ALTER TABLE `RAYOS_X` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receta`
--

DROP TABLE IF EXISTS `Receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `idConsulta` int(11) DEFAULT NULL,
  `detalleReceta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idReceta`),
  KEY `idConsulta` (`idConsulta`),
  CONSTRAINT `Receta_ibfk_1` FOREIGN KEY (`idConsulta`) REFERENCES `Consulta` (`id_Consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receta`
--

LOCK TABLES `Receta` WRITE;
/*!40000 ALTER TABLE `Receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Representante`
--

DROP TABLE IF EXISTS `Representante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Representante` (
  `idRepresentante` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Repre` varchar(40) DEFAULT NULL,
  `Cedula` varchar(13) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `movil` varchar(10) DEFAULT NULL,
  `NoHijos` int(2) DEFAULT NULL,
  `Ingresos` decimal(4,0) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `idPaciente` int(2) NOT NULL,
  PRIMARY KEY (`idRepresentante`),
  KEY `sex_fk_idx` (`Sexo`),
  KEY `idpac_fk_idx` (`idPaciente`),
  CONSTRAINT `idpac_fk` FOREIGN KEY (`idPaciente`) REFERENCES `Paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sex_fk` FOREIGN KEY (`Sexo`) REFERENCES `Sexo` (`idSexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Representante`
--

LOCK TABLES `Representante` WRITE;
/*!40000 ALTER TABLE `Representante` DISABLE KEYS */;
INSERT INTO `Representante` VALUES (1,'CARLOS FRANCISCO ALCIVAR MURILLO','0926857496','CDLA. PARAISO CALLE 4TA Y AVE. PRIMERA','2536845','0926936254',3,500,1,1),(2,'CARRILLO MORA ALEJANDRO','0999999999','CLA. ALBORADA 5TA ETAPA','2365478','023698745',3,2000,1,2),(3,'ARCENTALES CARRION PEDRO LUIS','0992562254','URDESA CENTRAL AV. LAS MONJAS','2365414','0999999999',2,500,1,3),(4,'RENDON AVEIGA MICAELA','0987451255','LIZARDO GARCIA Y PANCHO SEGURA','23654782','0925871452',1,600,2,4),(5,'MARTINEZ FLORES MERCEDES','0925417845','MILAGRO','2365478','0926987451',3,400,2,5),(6,'RIVADENEIRA NUNEZ JAIME','0124563322','PASCUALES','23654882','0926973122',4,500,1,6),(7,'VACARO MENDOZA VICKY','092685477','MUCHO LOTE 2','2365478','23654785',2,390,2,7),(8,'BUENO CEVALLOS CARLOS','09269895656','PEDRO MENENDEZ GUILBER','2365478','0926988989',3,500,1,8),(9,'RODRIGUEZ ARCENTALES PAULA','0923456799','ORQUIDEAS AV. FCO ORELLANA','2345678','0926985566',3,600,2,9),(10,'ZAMORA ZUNIGA VICENTE','2345677779','SAMBORONDON FRENTE AL RIO','2365478','0926977878',3,2000,1,10),(11,'VASQUEZ TITO JAIME','0925874545','ESPOL AVENIDA PROSPERINA','2345678','0987654321',4,2000,1,11),(12,'BUSTOS ASCENCIO ERMEREGILDO','0952415263','ATARAZANA Y AVE. PRINCIPAL','2365412','0985412369',3,2000,1,12);
/*!40000 ALTER TABLE `Representante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger Ced before insert on Representante
for each row 
begin
declare CedAnt int;
select r.idRepresentante into CedAnt from Representante r
where NEW.idRepresentante =r.idRepresentante;
if(cedAnt = new.idRepresentante)
then set New.idRepresentante= null;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Sexo`
--

DROP TABLE IF EXISTS `Sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sexo` (
  `idSexo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreSexo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idSexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sexo`
--

LOCK TABLES `Sexo` WRITE;
/*!40000 ALTER TABLE `Sexo` DISABLE KEYS */;
INSERT INTO `Sexo` VALUES (1,'MASCULINO'),(2,'FEMENINO');
/*!40000 ALTER TABLE `Sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoExamen`
--

DROP TABLE IF EXISTS `TipoExamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoExamen` (
  `idTipoExamen` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoExamen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoExamen`
--

LOCK TABLES `TipoExamen` WRITE;
/*!40000 ALTER TABLE `TipoExamen` DISABLE KEYS */;
INSERT INTO `TipoExamen` VALUES (1,'HEMATOLOGICO'),(2,'LEUCOTICOS'),(3,'HEMATOCRITOS'),(5,'ERITROSEDIMENTACION');
/*!40000 ALTER TABLE `TipoExamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medicalsystem'
--

--
-- Dumping routines for database 'medicalsystem'
--
/*!50003 DROP PROCEDURE IF EXISTS `autoNombre_Paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `autoNombre_Paciente`()
begin
select NamePaciente from Paciente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `autoNombre_Padre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `autoNombre_Padre`()
begin

select Nombre_Padre from Datos_Padres;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `busquedaGrupoSanguineo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `busquedaGrupoSanguineo`()
begin
declare totales int;
select sum(Porcentaje) into totales from (select count(*) as Porcentaje   from GrupoSanguineo s, Ficha_Medica f, Datos_Padres d where d.GSanguineo_Madre=s.idSanguineo or d.GSanguineo_Padre=s.idSanguineo and  f.idSanguineo=s.idSanguineo group by s.idSanguineo) as res;
select s.idSanguineo,s.NombreSanguineo, count(*)/ totales as Porcentaje  from GrupoSanguineo s, Ficha_Medica f, Datos_Padres d where d.GSanguineo_Madre=s.idSanguineo or d.GSanguineo_Padre=s.idSanguineo and  f.idSanguineo=s.idSanguineo group by s.idSanguineo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarficha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `consultarficha`(in ar0 varchar(100))
begin

select * from Ficha_Medica, Paciente where Ficha_Medica.idPaciente = (select Paciente.idPaciente from Paciente where NamePaciente=ar0);
select SexoPaciente from Paciente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearDato_Padre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `crearDato_Padre`(in ar1 varchar(50), in ar2 varchar(50),in ar3 varchar(30), in ar4 varchar(10),in ar5 varchar(10),in ar6 int,in ar7 int,in ar8 int, in ar9 int)
begin
INSERT INTO Datos_Padres(Nombre_Padre,Nombre_Madre,Direccion,telefono,movil,NoHijos,Ingresos,GSanguineo_Padre,GSanguineo_Madre) VALUES(ar1,ar2,ar3,ar4,ar5,ar6,ar7,ar8,ar9);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crearPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `crearPaciente`(in ar1 varchar(50), in ar2 date,in ar3 int, in ar4 varchar(100),in ar5 varchar(100),in ar7 varchar(100), in ar9 int,in ar10 int, in ar11 int)
begin
DECLARE idPaci INT;
Insert Into Paciente(NamePaciente,Fecha_Nacimiento,SexoPaciente) values(ar1,ar2,ar3);
select idPaciente into idPaci from Paciente where NamePaciente=ar1;
INSERT INTO Representante(Nombre_Repre,Direccion,telefono,NoHijos,Ingresos,Sexo,idPaciente) VALUES(ar4,ar5,ar7,ar9,ar10,ar11,idPaci);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EstaturaMayor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EstaturaMayor`(in tamano int(10))
begin
select Estatura, NamePaciente
from Paciente, Ficha_Medica
where Ficha_Medica.Estatura > tamano  and Paciente.idPaciente = Ficha_Medica.idPaciente
and Paciente.SexoPaciente =1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingreso_datos_receta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ingreso_datos_receta`(in ar1 int, in ar2 varchar(100))
begin
insert into Receta(idConsulta, detalleReceta) values(ar1,ar2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Estatura`
--

/*!50001 DROP TABLE IF EXISTS `Estatura`*/;
/*!50001 DROP VIEW IF EXISTS `Estatura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Estatura` AS select `Ficha_Medica`.`Estatura` AS `Estatura`,`Paciente`.`NamePaciente` AS `NamePaciente` from (`Paciente` join `Ficha_Medica`) where ((`Ficha_Medica`.`Estatura` > 70) and (`Paciente`.`idPaciente` = `Ficha_Medica`.`idPaciente`) and (`Paciente`.`SexoPaciente` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-09 23:50:57

ALTER TABLE `medicalsystem`.`Laboratorio` 
CHANGE COLUMN `Description` `Hermaties` VARCHAR(5) NULL DEFAULT NULL ,
ADD COLUMN  `Leucocitos` VARCHAR(5) NULL DEFAULT NULL ,
ADD COLUMN `SolicitadoPor` VARCHAR(45) NULL AFTER `idOrden`,
ADD COLUMN `Schilling` VARCHAR(5) NULL AFTER `Leucocitos`,
ADD COLUMN `Eritrosedimientacion` VARCHAR(5) NULL AFTER `Schilling`,
ADD COLUMN `Reticulocitus` VARCHAR(5) NULL AFTER `Eritrosedimientacion`,
ADD COLUMN `Plasmodium` VARCHAR(5) NULL AFTER `Reticulocitus`,
ADD COLUMN `GrupoSanguineo` VARCHAR(5) NULL AFTER `Plasmodium`,
ADD COLUMN `Plaquetas` VARCHAR(5) NULL AFTER `GrupoSanguineo`,
ADD COLUMN `Tiempo de Sangre` VARCHAR(5) NULL AFTER `Plaquetas`,
ADD COLUMN `Tiempo_Coagulacion` VARCHAR(5) NULL AFTER `Tiempo de Sangre`,
ADD COLUMN `T_Protrombina` VARCHAR(5) NULL AFTER `Tiempo_Coagulacion`,
ADD COLUMN `Parcial_Protrombina` VARCHAR(5) NULL AFTER `T_Protrombina`,
ADD COLUMN `Fibrinogeno` VARCHAR(5) NULL AFTER `Parcial_Protrombina`,
ADD COLUMN `Proteinas` VARCHAR(5) NULL AFTER `Fibrinogeno`,
ADD COLUMN `TestLues` VARCHAR(5) NULL AFTER `Proteinas`,
ADD COLUMN `ReaccionWidal` VARCHAR(5) NULL AFTER `TestLues`,
ADD COLUMN `Brucella_abortus` VARCHAR(5) NULL AFTER `ReaccionWidal`,
ADD COLUMN `CelulaLE` VARCHAR(5) NULL AFTER `Brucella_abortus`,
ADD COLUMN `FisicoyQuimico` VARCHAR(5) NULL AFTER `CelulaLE`,
ADD COLUMN `sedimientos` VARCHAR(5) NULL AFTER `FisicoyQuimico`,
ADD COLUMN `PruebaEmbarazo` VARCHAR(5) NULL AFTER `sedimientos`,
ADD COLUMN `CultivoOrina` VARCHAR(5) NULL AFTER `PruebaEmbarazo`,
ADD COLUMN `Direct_paraByK` VARCHAR(5) NULL AFTER `CultivoOrina`,
ADD COLUMN `Parasitologico` VARCHAR(5) NULL AFTER `Direct_paraByK`,
ADD COLUMN `SangreOculta` VARCHAR(5) NULL AFTER `Parasitologico`,
ADD COLUMN `CitoloiaFecal` VARCHAR(5) NULL AFTER `SangreOculta`,
ADD COLUMN `CultivoHeces` VARCHAR(5) NULL AFTER `CitoloiaFecal`,
ADD COLUMN `RA_Test` VARCHAR(5) NULL AFTER `CultivoHeces`,
ADD COLUMN `AntiEstres` VARCHAR(5) NULL AFTER `RA_Test`,
ADD COLUMN `TransFresco` VARCHAR(5) NULL AFTER `AntiEstres`,
ADD COLUMN `Proteux` VARCHAR(5) NULL AFTER `TransFresco`;
