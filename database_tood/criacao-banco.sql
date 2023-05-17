drop database tooddatabase;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ToodDatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ToodDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ToodDatabase` DEFAULT CHARACTER SET utf8 ;
USE `ToodDatabase` ;

-- -----------------------------------------------------
-- Table `ToodDatabase`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `razaoSocial` VARCHAR(45) NULL,
  `nomeFantasia` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `responsavel` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `fkEmpresa` INT NOT NULL,
  `nomeUsuario` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`, `fkEmpresa`),
  INDEX `fk_Usuario_Empresa_idx` (`fkEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Empresa`
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `ToodDatabase`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`estabelecimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`estabelecimento` (
  `idEstabelecimento` INT NOT NULL AUTO_INCREMENT,
  `fkEmpresa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  INDEX `fk_table1_Empresa1_idx` (`fkEmpresa` ASC) VISIBLE,
  PRIMARY KEY (`idEstabelecimento`),
  CONSTRAINT `fk_table1_Empresa1`
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `ToodDatabase`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`Totem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`Totem` (
  `idTotem` INT NOT NULL AUTO_INCREMENT,
  `fkEstabelecimento` INT NOT NULL,
  `numeroSerial` VARCHAR(45) NULL,
  `processador` VARCHAR(45) NULL,
  `alertaProcessador` INT NULL,
  `ram` VARCHAR(45) NULL,
  `alertaRam` INT NULL,
  `disco` VARCHAR(45) NULL,
  `alertaDisco` INT NULL,
  PRIMARY KEY (`idTotem`, `fkEstabelecimento`),
  INDEX `fk_Totem_estabelecimento1_idx` (`fkEstabelecimento` ASC) VISIBLE,
  CONSTRAINT `fk_Totem_estabelecimento1`
    FOREIGN KEY (`fkEstabelecimento`)
    REFERENCES `ToodDatabase`.`estabelecimento` (`idEstabelecimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`DadoTotem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`DadoTotem` (
  `idDadosTotem` INT NOT NULL AUTO_INCREMENT,
  `fkTotem` INT,
  `dataHora` DATETIME NULL,
  `qtdRam` VARCHAR(45) NULL,
  `qtdTotalDisco` VARCHAR(45) NULL,
  `qtdProcessador` VARCHAR(45) NULL,
  `qtdFaltaDisco` VARCHAR(45) NULL,
  `qtdLeituraDisco` VARCHAR(45) NULL,
  `qtdPacoteEnviado` VARCHAR(45) NULL,
  `qtdPacoteRecebido` VARCHAR(45) NULL,
  PRIMARY KEY (`idDadosTotem`),
  INDEX `fk_DadoTotem_Totem1_idx` (`fkTotem` ASC) VISIBLE,
  CONSTRAINT `fk_DadoTotem_Totem1`
    FOREIGN KEY (`fkTotem`)
    REFERENCES `ToodDatabase`.`Totem` (`idTotem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `fkFranquia` INT NOT NULL,
  `logradouro` VARCHAR(45) NULL,
  `numero` INT NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_estabelecimento1_idx` (`fkFranquia` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_estabelecimento1`
    FOREIGN KEY (`fkFranquia`)
    REFERENCES `ToodDatabase`.`estabelecimento` (`idEstabelecimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ToodDatabase`.`ComandoJava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToodDatabase`.`ComandoJava` (
  `idComandoJava` INT NOT NULL AUTO_INCREMENT,
  `fkTotem` INT NOT NULL,
  `fkEstabelecimento` INT NOT NULL,
  `executarComando` VARCHAR(45) NULL,
  `comando` VARCHAR(255) NULL,
  PRIMARY KEY (`idComandoJava`, `fkTotem`, `fkEstabelecimento`),
  INDEX `fk_ComandoJava_Totem1_idx` (`fkTotem` ASC, `fkEstabelecimento` ASC) VISIBLE,
  CONSTRAINT `fk_ComandoJava_Totem1`
    FOREIGN KEY (`fkTotem` , `fkEstabelecimento`)
    REFERENCES `ToodDatabase`.`Totem` (`idTotem` , `fkEstabelecimento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
