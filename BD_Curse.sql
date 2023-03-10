-- MySQL Script generated by MySQL Workbench
-- Tue Dec  3 19:43:34 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Store` DEFAULT CHARACTER SET utf8 ;
USE `Store` ;

-- -----------------------------------------------------
-- Table `Store`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Client` (
  `ID_client` INT NOT NULL,
  `Client_name` VARCHAR(50) NOT NULL,
  `Client_surname` VARCHAR(50) NOT NULL,
  `Client_patronymic` VARCHAR(50) NULL,
  `Adress` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID_client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Position` (
  `ID_Position` INT NOT NULL,
  `Position_name` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`ID_Position`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Staff` (
  `ID_Staff` INT NOT NULL,
  `Staff_name` VARCHAR(50) NOT NULL,
  `Staff_surname` VARCHAR(50) NOT NULL,
  `Staff_patronymic` VARCHAR(50) NULL,
  `Staff_number` VARCHAR(20) NOT NULL,
  `Position_ID_Position` INT NOT NULL,
  PRIMARY KEY (`ID_Staff`),
  INDEX `fk_Staff_Position1_idx` (`Position_ID_Position` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Position1`
    FOREIGN KEY (`Position_ID_Position`)
    REFERENCES `Store`.`Position` (`ID_Position`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Pay`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Pay` (
  `Pay_ID` INT NOT NULL,
  `Kind_of_pay` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Pay_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Shipping` (
  `Shipping_ID` INT NOT NULL,
  `Kind_of_shipping` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Shipping_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Order` (
  `ID_order` INT NOT NULL,
  `Client_ID_client` INT NOT NULL,
  `Staff_ID_Staff` INT NOT NULL,
  `Date_order` DATE NOT NULL,
  `Status` VARCHAR(25) NOT NULL,
  `Final_price` INT NOT NULL,
  `Pay_Pay_ID` INT NOT NULL,
  `Shipping_Shipping_ID` INT NOT NULL,
  PRIMARY KEY (`ID_order`),
  INDEX `fk_Order_Client_idx` (`Client_ID_client` ASC) VISIBLE,
  INDEX `fk_Order_Staff1_idx` (`Staff_ID_Staff` ASC) VISIBLE,
  INDEX `fk_Order_Pay1_idx` (`Pay_Pay_ID` ASC) VISIBLE,
  INDEX `fk_Order_Shipping1_idx` (`Shipping_Shipping_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Client`
    FOREIGN KEY (`Client_ID_client`)
    REFERENCES `Store`.`Client` (`ID_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Staff1`
    FOREIGN KEY (`Staff_ID_Staff`)
    REFERENCES `Store`.`Staff` (`ID_Staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Pay1`
    FOREIGN KEY (`Pay_Pay_ID`)
    REFERENCES `Store`.`Pay` (`Pay_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Shipping1`
    FOREIGN KEY (`Shipping_Shipping_ID`)
    REFERENCES `Store`.`Shipping` (`Shipping_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Product` (
  `ID_Product` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(1000) NULL,
  `In_Store` INT NOT NULL,
  `Manufacturer` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`ID_Product`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Supplier` (
  `ID_Supplier` INT NOT NULL,
  `Name_Supplier` VARCHAR(80) NOT NULL,
  `Web_Site` VARCHAR(50) NOT NULL,
  `Email_Supplier` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Supplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Supply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Supply` (
  `ID_Supply` INT NOT NULL,
  `Date_supply` DATE NOT NULL,
  `Supply_Price` INT NOT NULL,
  `Supplier_ID_Supplier` INT NOT NULL,
  PRIMARY KEY (`ID_Supply`, `Supplier_ID_Supplier`),
  INDEX `fk_Supply_Supplier1_idx` (`Supplier_ID_Supplier` ASC) VISIBLE,
  CONSTRAINT `fk_Supply_Supplier1`
    FOREIGN KEY (`Supplier_ID_Supplier`)
    REFERENCES `Store`.`Supplier` (`ID_Supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Supply-Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Supply-Product` (
  `Supply_ID_Supply` INT NOT NULL,
  `Product_ID_Product` INT NOT NULL,
  `Supply_prod_amount` INT NOT NULL,
  `Old_product_price` INT NOT NULL,
  INDEX `fk_table1_Supply1_idx` (`Supply_ID_Supply` ASC) VISIBLE,
  INDEX `fk_table1_Product1_idx` (`Product_ID_Product` ASC) VISIBLE,
  PRIMARY KEY (`Product_ID_Product`, `Supply_ID_Supply`),
  CONSTRAINT `fk_table1_Supply1`
    FOREIGN KEY (`Supply_ID_Supply`)
    REFERENCES `Store`.`Supply` (`ID_Supply`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_Product1`
    FOREIGN KEY (`Product_ID_Product`)
    REFERENCES `Store`.`Product` (`ID_Product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Order_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Order_List` (
  `Product_amount` INT NOT NULL,
  `Order_ID_order` INT NOT NULL,
  `Supply-Product_Product_ID_Product` INT NOT NULL,
  `Supply-Product_Supply_ID_Supply` INT NOT NULL,
  `New_product_price` INT NOT NULL,
  INDEX `fk_Order-Product_Order1_idx` (`Order_ID_order` ASC) VISIBLE,
  PRIMARY KEY (`Order_ID_order`, `Supply-Product_Product_ID_Product`, `Supply-Product_Supply_ID_Supply`),
  INDEX `fk_Order_List_Supply-Product1_idx` (`Supply-Product_Product_ID_Product` ASC, `Supply-Product_Supply_ID_Supply` ASC) VISIBLE,
  CONSTRAINT `fk_Order-Product_Order1`
    FOREIGN KEY (`Order_ID_order`)
    REFERENCES `Store`.`Order` (`ID_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_List_Supply-Product1`
    FOREIGN KEY (`Supply-Product_Product_ID_Product` , `Supply-Product_Supply_ID_Supply`)
    REFERENCES `Store`.`Supply-Product` (`Product_ID_Product` , `Supply_ID_Supply`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Category` (
  `ID_Category` INT NOT NULL,
  `Name_Category` VARCHAR(45) NOT NULL,
  `Price_incr(%)` INT NOT NULL,
  PRIMARY KEY (`ID_Category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Characteristic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Characteristic` (
  `ID_Characteristic` INT NOT NULL,
  `Name_Characteristic` VARCHAR(45) NOT NULL,
  `Measure_Unit` VARCHAR(30) NULL,
  PRIMARY KEY (`ID_Characteristic`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Category_Characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Category_Characteristics` (
  `Category_ID_Category` INT NOT NULL,
  `Characteristic_ID_Characteristic` INT NOT NULL,
  `ID_Characteristics_Table` INT NOT NULL,
  INDEX `fk_Category_Characteristics_Category1_idx` (`Category_ID_Category` ASC) VISIBLE,
  INDEX `fk_Category_Characteristics_Characteristic1_idx` (`Characteristic_ID_Characteristic` ASC) VISIBLE,
  PRIMARY KEY (`ID_Characteristics_Table`),
  CONSTRAINT `fk_Category_Characteristics_Category1`
    FOREIGN KEY (`Category_ID_Category`)
    REFERENCES `Store`.`Category` (`ID_Category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Category_Characteristics_Characteristic1`
    FOREIGN KEY (`Characteristic_ID_Characteristic`)
    REFERENCES `Store`.`Characteristic` (`ID_Characteristic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Store`.`Product_Characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Store`.`Product_Characteristics` (
  `Product_ID_Product` INT NOT NULL,
  `Category_Characteristics_ID_Characteristics_Table` INT NOT NULL,
  `Value` INT NOT NULL,
  INDEX `fk_Product_Characteristics_Product1_idx` (`Product_ID_Product` ASC) VISIBLE,
  INDEX `fk_Product_Characteristics_Category_Characteristics1_idx` (`Category_Characteristics_ID_Characteristics_Table` ASC) VISIBLE,
  PRIMARY KEY (`Category_Characteristics_ID_Characteristics_Table`, `Product_ID_Product`),
  CONSTRAINT `fk_Product_Characteristics_Product1`
    FOREIGN KEY (`Product_ID_Product`)
    REFERENCES `Store`.`Product` (`ID_Product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Characteristics_Category_Characteristics1`
    FOREIGN KEY (`Category_Characteristics_ID_Characteristics_Table`)
    REFERENCES `Store`.`Category_Characteristics` (`ID_Characteristics_Table`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Store`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `Store`;
INSERT INTO `Store`.`Client` (`ID_client`, `Client_name`, `Client_surname`, `Client_patronymic`, `Adress`, `Email`, `number`) VALUES (1, 'Andrey', 'Nikolaev', 'Olegovich', 'Orel, Turgeneva 41/54', 'Nikolayev74@mail.ru', '8 (910) 748-15-15');
INSERT INTO `Store`.`Client` (`ID_client`, `Client_name`, `Client_surname`, `Client_patronymic`, `Adress`, `Email`, `number`) VALUES (2, 'Naum', 'Stepanov', 'Mihailovich', 'Moskow, Planernaya 4/66', 'NaumTheBest@yandex.ru', '7 (495) 115-17-81');
INSERT INTO `Store`.`Client` (`ID_client`, `Client_name`, `Client_surname`, `Client_patronymic`, `Adress`, `Email`, `number`) VALUES (3, 'Vladislav', 'Fomichev', 'Glebovich', 'Moskow, Jilinskaya 34/344', 'Vladik_Fom@gmail.com', '7 (495) 140-77-07 ');
INSERT INTO `Store`.`Client` (`ID_client`, `Client_name`, `Client_surname`, `Client_patronymic`, `Adress`, `Email`, `number`) VALUES (4, 'Osipova', 'Anna', 'Vladimirivna', 'Tula, Vetka 12/89', 'Annihilator3000@mail.ru', '+7(4712) 70-10-44');
INSERT INTO `Store`.`Client` (`ID_client`, `Client_name`, `Client_surname`, `Client_patronymic`, `Adress`, `Email`, `number`) VALUES (5, 'Dmitry', 'Vinogradov', 'Antonovich', 'Kursk, Mashinostroitelnaya 13/165', '-!Vinogradov!-@gmail.com', '+7(4712) 14-88-77');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Store`.`Position`
-- -----------------------------------------------------
START TRANSACTION;
USE `Store`;
INSERT INTO `Store`.`Position` (`ID_Position`, `Position_name`) VALUES (1, 'Sales consultant');
INSERT INTO `Store`.`Position` (`ID_Position`, `Position_name`) VALUES (2, 'Cashier');
INSERT INTO `Store`.`Position` (`ID_Position`, `Position_name`) VALUES (3, 'Technical specialist');
INSERT INTO `Store`.`Position` (`ID_Position`, `Position_name`) VALUES (4, 'Probationer');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Store`.`Staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `Store`;
INSERT INTO `Store`.`Staff` (`ID_Staff`, `Staff_name`, `Staff_surname`, `Staff_patronymic`, `Staff_number`, `Position_ID_Position`) VALUES (1, 'Kirill', 'Antonov', 'Vladimirovich', '1', 2);
INSERT INTO `Store`.`Staff` (`ID_Staff`, `Staff_name`, `Staff_surname`, `Staff_patronymic`, `Staff_number`, `Position_ID_Position`) VALUES (2, 'Aleksandr', 'Drap', NULL, '2', 1);
INSERT INTO `Store`.`Staff` (`ID_Staff`, `Staff_name`, `Staff_surname`, `Staff_patronymic`, `Staff_number`, `Position_ID_Position`) VALUES (3, 'Evgeniy', 'Antonov', 'Semenovich', '3', 3);
INSERT INTO `Store`.`Staff` (`ID_Staff`, `Staff_name`, `Staff_surname`, `Staff_patronymic`, `Staff_number`, `Position_ID_Position`) VALUES (4, 'Egor', 'Nosov', 'Andreevich', '4', 1);
INSERT INTO `Store`.`Staff` (`ID_Staff`, `Staff_name`, `Staff_surname`, `Staff_patronymic`, `Staff_number`, `Position_ID_Position`) VALUES (5, 'Daniil', 'Potyomkin', 'Sergeevich', '5', 1);

COMMIT;

