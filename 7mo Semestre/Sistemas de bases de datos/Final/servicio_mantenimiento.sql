SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `servicio_mantenimiento` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `servicio_mantenimiento` ;

-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`TipoCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`TipoCliente` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`TipoCliente` (
  `idTipoCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Cliente` (
  `idCliente` INT NOT NULL,
  `cedula` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `Tipo_idTipo` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Tipo`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `servicio_mantenimiento`.`TipoCliente` (`idTipoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_Tipo_idx` ON `servicio_mantenimiento`.`Cliente` (`Tipo_idTipo` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Vehiculo` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Vehiculo` (
  `idVehiculo` INT NOT NULL,
  `placa` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `anio` YEAR NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  CONSTRAINT `fk_Vehiculo_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `servicio_mantenimiento`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Vehiculo_Cliente1_idx` ON `servicio_mantenimiento`.`Vehiculo` (`Cliente_idCliente` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Orden_Mantenimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Orden_Mantenimiento` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Orden_Mantenimiento` (
  `idOrden_Mantenimiento` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `fecha_proxima` DATETIME NULL,
  `fecha_actual` DATETIME NOT NULL,
  `Km_proximo` INT NULL,
  `km_actual` INT NOT NULL,
  `Vehiculo_idVehiculo` INT NOT NULL,
  PRIMARY KEY (`idOrden_Mantenimiento`),
  CONSTRAINT `fk_Orden_Mantenimiento_Vehiculo1`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `servicio_mantenimiento`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Orden_Mantenimiento_Vehiculo1_idx` ON `servicio_mantenimiento`.`Orden_Mantenimiento` (`Vehiculo_idVehiculo` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Servicio` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Servicio` (
  `idServicio` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `costo` FLOAT NOT NULL,
  PRIMARY KEY (`idServicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Repuesto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Repuesto` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Repuesto` (
  `idRepuesto` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idRepuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Cargo` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Cargo` (
  `idCargo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCargo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fecha_contrato_ini` DATE NOT NULL,
  `fecha_contrato_fin` VARCHAR(45) NULL,
  `Cargo_idCargo` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `fk_Empleado_Cargo1`
    FOREIGN KEY (`Cargo_idCargo`)
    REFERENCES `servicio_mantenimiento`.`Cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Empleado_Cargo1_idx` ON `servicio_mantenimiento`.`Empleado` (`Cargo_idCargo` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`OM_Servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`OM_Servicio` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`OM_Servicio` (
  `Orden_Mantenimiento_idOrden_Mantenimiento` INT NOT NULL,
  `Servicio_idServicio` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`Orden_Mantenimiento_idOrden_Mantenimiento`, `Servicio_idServicio`),
  CONSTRAINT `fk_OrdenMantenimiento_Servicio_Orden_Mantenimiento1`
    FOREIGN KEY (`Orden_Mantenimiento_idOrden_Mantenimiento`)
    REFERENCES `servicio_mantenimiento`.`Orden_Mantenimiento` (`idOrden_Mantenimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenMantenimiento_Servicio_Servicio1`
    FOREIGN KEY (`Servicio_idServicio`)
    REFERENCES `servicio_mantenimiento`.`Servicio` (`idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenMantenimiento_Servicio_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `servicio_mantenimiento`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OrdenMantenimiento_Servicio_Servicio1_idx` ON `servicio_mantenimiento`.`OM_Servicio` (`Servicio_idServicio` ASC);

CREATE INDEX `fk_OrdenMantenimiento_Servicio_Empleado1_idx` ON `servicio_mantenimiento`.`OM_Servicio` (`Empleado_idEmpleado` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`OM_Servicio_Repuesto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`OM_Servicio_Repuesto` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`OM_Servicio_Repuesto` (
  `Repuesto_idRepuesto` INT NOT NULL,
  `OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` INT NOT NULL,
  `OM_Servicio_Servicio_idServicio` INT NOT NULL,
  PRIMARY KEY (`Repuesto_idRepuesto`, `OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento`, `OM_Servicio_Servicio_idServicio`),
  CONSTRAINT `fk_OM_Servicio_Repuesto_Repuesto1`
    FOREIGN KEY (`Repuesto_idRepuesto`)
    REFERENCES `servicio_mantenimiento`.`Repuesto` (`idRepuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OM_Servicio_Repuesto_OM_Servicio1`
    FOREIGN KEY (`OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` , `OM_Servicio_Servicio_idServicio`)
    REFERENCES `servicio_mantenimiento`.`OM_Servicio` (`Orden_Mantenimiento_idOrden_Mantenimiento` , `Servicio_idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_OM_Servicio_Repuesto_Repuesto1_idx` ON `servicio_mantenimiento`.`OM_Servicio_Repuesto` (`Repuesto_idRepuesto` ASC);

CREATE INDEX `fk_OM_Servicio_Repuesto_OM_Servicio1_idx` ON `servicio_mantenimiento`.`OM_Servicio_Repuesto` (`OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` ASC, `OM_Servicio_Servicio_idServicio` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Factura` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Factura` (
  `idFactura` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `subtotal` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `descuento` FLOAT NULL,
  `idOrden_Mantenimiento` INT NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  CONSTRAINT `fk_Factura_Orden_Mantenimiento1`
    FOREIGN KEY (`idOrden_Mantenimiento`)
    REFERENCES `servicio_mantenimiento`.`Orden_Mantenimiento` (`idOrden_Mantenimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `servicio_mantenimiento`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Factura_Orden_Mantenimiento1_idx` ON `servicio_mantenimiento`.`Factura` (`idOrden_Mantenimiento` ASC);

CREATE INDEX `fk_Factura_Empleado1_idx` ON `servicio_mantenimiento`.`Factura` (`Empleado_idEmpleado` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`TipoPago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`TipoPago` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`TipoPago` (
  `idTipoPago` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Pago` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Pago` (
  `idPago` INT NOT NULL,
  `fecha_pago` DATETIME NULL,
  `valor` VARCHAR(45) NULL,
  `Factura_idFactura` INT NOT NULL,
  `TipoPago_idTipoPago` INT NOT NULL,
  PRIMARY KEY (`idPago`),
  CONSTRAINT `fk_Pago_TipoPago1`
    FOREIGN KEY (`TipoPago_idTipoPago`)
    REFERENCES `servicio_mantenimiento`.`TipoPago` (`idTipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Factura1`
    FOREIGN KEY (`Factura_idFactura`)
    REFERENCES `servicio_mantenimiento`.`Factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pago_TipoPago1_idx` ON `servicio_mantenimiento`.`Pago` (`TipoPago_idTipoPago` ASC);

CREATE INDEX `fk_Pago_Factura1_idx` ON `servicio_mantenimiento`.`Pago` (`Factura_idFactura` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Tarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Tarjeta` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Tarjeta` (
  `idTarjeta` INT NOT NULL,
  `nombre_tarjeta` VARCHAR(45) NOT NULL,
  `numero_tarjeta` VARCHAR(45) NOT NULL,
  `banco_emisor` VARCHAR(45) NOT NULL,
  `fecha_expiracion` DATE NOT NULL,
  `debito` TINYINT(1) NULL,
  `credito` TINYINT(1) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarjeta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`PagoTarjeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`PagoTarjeta` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`PagoTarjeta` (
  `idTarjeta` INT NOT NULL,
  `Pago_idPago` INT NOT NULL,
  PRIMARY KEY (`idTarjeta`, `Pago_idPago`),
  CONSTRAINT `fk_PagoTarjeta_TransaccionTarjeta1`
    FOREIGN KEY (`idTarjeta`)
    REFERENCES `servicio_mantenimiento`.`Tarjeta` (`idTarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PagoTarjeta_Pago1`
    FOREIGN KEY (`Pago_idPago`)
    REFERENCES `servicio_mantenimiento`.`Pago` (`idPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PagoTarjeta_TransaccionTarjeta1_idx` ON `servicio_mantenimiento`.`PagoTarjeta` (`idTarjeta` ASC);

CREATE INDEX `fk_PagoTarjeta_Pago1_idx` ON `servicio_mantenimiento`.`PagoTarjeta` (`Pago_idPago` ASC);


-- -----------------------------------------------------
-- Table `servicio_mantenimiento`.`Observaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicio_mantenimiento`.`Observaciones` ;

CREATE TABLE IF NOT EXISTS `servicio_mantenimiento`.`Observaciones` (
  `idObservaciones` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` INT NOT NULL,
  `OM_Servicio_Servicio_idServicio` INT NOT NULL,
  PRIMARY KEY (`idObservaciones`),
  CONSTRAINT `fk_Observaciones_OM_Servicio1`
    FOREIGN KEY (`OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` , `OM_Servicio_Servicio_idServicio`)
    REFERENCES `servicio_mantenimiento`.`OM_Servicio` (`Orden_Mantenimiento_idOrden_Mantenimiento` , `Servicio_idServicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Observaciones_OM_Servicio1_idx` ON `servicio_mantenimiento`.`Observaciones` (`OM_Servicio_Orden_Mantenimiento_idOrden_Mantenimiento` ASC, `OM_Servicio_Servicio_idServicio` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
