-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MCS2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MCS2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MCS2` DEFAULT CHARACTER SET utf8 ;
USE `MCS2` ;

-- -----------------------------------------------------
-- Table `MCS2`.`Clothing_Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Clothing_Brand`;
CREATE TABLE `MCS2`.`Clothing_Brand` (
  `Brand_id` INT NOT NULL,
  `brand_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Brand_id`))
ENGINE = InnoDB;

-- ----------------
-- Dumping data for table `Clothing_Brand`
-- ----------------
/*!40000 ALTER TABLE `Clothing_Brand` DISABLE KEYS */;
LOCK TABLES `Clothing_Brand` WRITE;
INSERT INTO `MCS2`.`Clothing_Brand` VALUES  
	(1,'GAP'),
	(2,'PATAGONIA'),
	(3,'ZARA'),
	(4,'REFORMATION'),
	(5,'PEOPLE TREE'),
	(6,'THEORY'),
	(7,'NINETY PERCENT'),
	(8,'STELLA MCCARTNEY'),
	(9,'ARITZIA'),
	(0,'H&M');
UNLOCK TABLES;
/*!40000 ALTER TABLE `Clothing_Brand` ENABLE KEYS */;

-- -----------------------------------------------------
-- Table `MCS2`.`Tops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Tops`;
CREATE TABLE `MCS2`.`Tops` (
  `top_desc` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`top_desc`))
ENGINE = InnoDB;

-- ----------------
-- Dumping data for table `Tops`
-- ----------------
LOCK TABLES `Tops` WRITE;
INSERT INTO `MCS2`.`Tops` VALUES  
('VNeck', 'S','$10.00', 'blue'),
('Corsette', 'M','$10.00', 'blue'),
('ButtonUp', 'M', '$15.00', 'white'),
('FrontTie', 'S', '$11.00', 'black'),
('TankTop', 'S', '$11.00', 'red'),
('TShirt-Women', 'L', '$10.00', 'black'),
('TShirt-Men', 'M', '$10.00', 'black'),
('CollaredShirt','L', '$17.00', 'yellow'),
('WorkoutTee','L', '$15.00', 'green'),
('Long_Sleeve','M', '$13.00', 'purple');
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Bottoms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Bottoms`;
CREATE TABLE `MCS2`.`Bottoms` (
  `bottoms_desc` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bottoms_desc`))
ENGINE = InnoDB;

LOCK TABLES `Bottoms` WRITE;
INSERT INTO `MCS2`.`Bottoms` VALUES  
('JeanPants', 'S','$10.00', 'blue'),
('Jean-Shorts', 'M','$10.00', 'blue'),
('Cargo-Pants', 'M', '$15.00', 'green'),
('Leggings', 'S', '$11.00', 'black'),
('Mom-Jeans', 'S', '$11.00', 'blue'),
('Skirt', 'L', '$10.00', 'white'),
('Biker-Shorts', 'M', '$10.00', 'black'),
('Cargo-Shorts','L', '$17.00', 'blue'),
('Sweats','L', '$15.00', 'grey'),
('Sweat-Shorts','M', '$13.00', 'grey');
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Jackets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Jackets`;
CREATE TABLE `MCS2`.`Jackets` (
  `jackets_desc` VARCHAR(45) NOT NULL,
  `size` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`jackets_desc`))
ENGINE = InnoDB;

LOCK TABLES `Jackets` WRITE;
INSERT INTO `MCS2`.`Jackets` VALUES  
('Puffer', 'S','$50.00', 'pink'),
('Sweatshirt', 'M','$20.00', 'black'),
('Zip-up', 'M', '$15.00', 'green'),
('Bomber-Jacket', 'S', '$40.00', 'green'),
('Jean', 'S', '$30.00', 'blue'),
('Leather', 'L', '$40.00', 'black'),
('Fleece', 'M', '$25.00', 'grey'),
('Snow-Jacket','L', '$100.00', 'red'),
('Long-coat','L', '$85.00', 'black'),
('Parka','M', '$70.00', 'black');
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Shopping_cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Shopping_cart`;
CREATE TABLE `MCS2`.`Shopping_cart` (
  `cart_cust_id` INT NOT NULL,
  `item_id` VARCHAR(45) NOT NULL,
  `Product_quantity` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cart_cust_id`))
ENGINE = InnoDB;

LOCK TABLES `Shopping_cart` WRITE;
INSERT INTO `MCS2`.`Shopping_cart` VALUES  
	(1123, '1001', '1','$50.00'),
	(1135, '1002' ,'1', '$20.00'),
	(1345, '1003', '1', '$15.00'),
	(1456, '1004', '1', '$40.00'),
	(1678, '1005', '1', '$30.00'),
	(1789, '1001', '1', '$40.00'),
	(1246, '1007', '1', '$25.00'),
	(1234, '1006', '1', '$100.00'),
	(1567, '1009', '1', '$85.00'),
	(1987, '1008', '1', '$70.00');
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Items`;
CREATE TABLE `MCS2`.`Items` (
  `item_code` INT NOT NULL,
  `clothes_type` VARCHAR(45) NOT NULL,
  `clothes_brand` VARCHAR(45) NOT NULL,
  `item_desc` VARCHAR(45) NOT NULL,
  `item_price` VARCHAR(45) NOT NULL, 
  `Inventory_stock_code` INT NOT NULL,
  `Shopping_cart_cust_id` INT NOT NULL,
  `Clothing_Brand_id` INT NOT NULL,
  PRIMARY KEY (`item_code`, `Clothing_Brand_id`),
  INDEX `fk_Items_Shopping_cart1_idx` (`Shopping_cart_cust_id` ASC) VISIBLE,
  INDEX `fk_Items_Clothing_Brand1_idx` (`Clothing_Brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_Items_Shopping_cart1`
    FOREIGN KEY (`Shopping_cart_cust_id`)
    REFERENCES `MCS2`.`Shopping_cart` (`cart_cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_Clothing_Brand1`
    FOREIGN KEY (`Clothing_Brand_id`)
    REFERENCES `MCS2`.`Clothing_Brand` (`Brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `Items` WRITE;
INSERT INTO `MCS2`.`Items` VALUES  
	(1001, 'Shirt', 'GAP', 'T-Shirt-Women',        '$10.00',  1, 1123, 1),
	(1002, 'Jacket', 'Patagonia', 'Puffer',         '$100.00', 2, 1135, 2),
	(1003, 'Bottoms', 'Aritzia', 'JeanPants',       '$10.00', 3, 1345, 9),
	(1004, 'Bottoms', 'Zara', 'Skirt',              '$10.00', 4, 1456, 3),
	(1005, 'Jacket','Theory', 'Long Coat',          '$85.00', 5, 1678, 6),
	(1006, 'Shirt', 'Ninety Percent', 'FrontTie',   '$85.00', 6, 1789, 7),
	(1007, 'Shirt', 'H&M', 'Tank Top',              '$15.00', 7, 1246, 0),
	(1008, 'Jacket', 'Stella McCartney', 'Leather', '$40.00', 8, 1234, 8),
	(1009, 'Jacket', 'Zara', 'Sweatshirt',          '$20.00', 9, 1567, 3),
	(1010, 'Bottoms','Reformation', 'Leggings',    ' $11.00', 10, 1987, 4);
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Inventory`;
CREATE TABLE `MCS2`.`Inventory` (
  `stock_code` INT NOT NULL,
  `stock_quantity` VARCHAR(45) NOT NULL,
  `Item_desc` VARCHAR(45) NULL,
  `Items_item_code` INT,
  PRIMARY KEY (`stock_code`),
  INDEX `fk_Inventory_Items1_idx` (`Items_item_code` ASC) VISIBLE,
  CONSTRAINT `fk_Inventory_Items1`
    FOREIGN KEY (`Items_item_code`)
    REFERENCES `MCS2`.`Items` (`item_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `Inventory` WRITE;
INSERT INTO `MCS2`.`Inventory` VALUES  
	(1, '10', 'T-Shirt-Women', 1001),
	(2, '2', 'Puffer', 1002),
	(3, '15', 'JeanPants', 1003),
	(4, '5', 'Skirt', 1004),
	(5, '1', 'Long Coat', 1005),
	(6, '7', 'Front Tie', 1006),
	(7, '10', 'Tank Top', 1007),
	(8, '5', 'Leather', 1008),
	(9, '30', 'Sweatshirt', 1009),
	(10, '15', 'Leggings', 1010),
    (11, '10', 'Leather', '1011'),
	(12, '10', 'Fleece', '1012'),
	(13, '5', 'Zip-up', '1013'),
	(14, '7', 'Bomber-Jacket', '1014'),
	(15, '15', 'Jean', '1015'),
	(16, '7', 'Snow-Jacket','1016'),
	(17, '15', 'Parka', '1017');
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`customer`;
CREATE TABLE `MCS2`.`customer` (
  `customer_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `Shopping_cart_cart_cust_id` INT,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_Shopping_cart1_idx` (`Shopping_cart_cart_cust_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_Shopping_cart1`
    FOREIGN KEY (`Shopping_cart_cart_cust_id`)
    REFERENCES `MCS2`.`Shopping_cart` (`cart_cust_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `customer` WRITE;
INSERT INTO `MCS2`.`customer` VALUES  
	(123, 'John Doe', 'jd@gmail.com',          '785 Geary St, San Francisco CA, 94117', 'Mastercard', 1123),
	(135, 'Anne Brown', 'ab@gmail.com',        '654 Poplar, Palo Alto CA, 94303', 'Visa', 1135),
	(345, 'Ben Smith', 'bens@aol.com',         '422 Bay Road, Redwood City CA,94026', 'Mastercard', 1345),
	(456, 'Tyler Mahomes', 'tmoney@yahoo.com', '1899 La Loma Drive, Los Altos CA, 94022', 'American Express', 1456),
	(678, 'Jannice Keith', 'jank@gmail.com',   '1143 Carver Place, Mountain View CA,94063', 'Paypal', 1678),
	(789, 'May Dane', 'maydane@aol.com',       '5427 College, Oakland CA, 94609', 'Visa', 1789),
	(246, 'Rachel Green', 'rachelg@gmail.com', '1104 Spinosa Drive, Mountain View CA, 94040', 'Mastercard', 1246),
	(234, 'Joey Tribianni', 'joeyrocks@yahoo.com', '587 Alvarado, Redwood City CA, 94063', 'Mastercard', 1234),
	(567, 'Chandler Bing', 'cbing@gmail.com',   '7345 Ross Blvd., Sunnyvale CA, 94086', 'Visa', 1567),
	(987, 'Monica Geller', 'monicag@gmail.com', '3199 Sterling Court, Sunnyvale CA,94085', 'American Express', 1987);
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`Orders`;
CREATE TABLE `MCS2`.`Orders` (
  `Order_num` INT NOT NULL,
  `Order_date` VARCHAR(45) NOT NULL,
  `Total_price` VARCHAR(45) NOT NULL,
  `customer_customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_num`, `customer_customer_id`),
  INDEX `fk_Orders_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `MCS2`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

LOCK TABLES `Orders` WRITE;
INSERT INTO `MCS2`.`Orders` VALUES  
	(1027, '2022-01-05', '$50.00', 123),
	(1029, '2022-02-03', '$20.00', 135),
	(1030, '2022-03-20', '$15.00', 345),
	(1032, '2022-05-30', '$40.00', 456),
	(1033, '2022-06-01', '$35.00', 678),
	(1040, '2022-06-13', '$60.00', 789),
	(1041, '2022-09-28', '$25.00', 246),
	(1042, '2022-10-31','$110.00', 234),
	(1044, '2022-11-25', '$85.00', 567),
	(1045, '2022-12-03', '$70.00', 987);
UNLOCK TABLES;

-- -----------------------------------------------------
-- Table `MCS2`.`Clothing_Brand_has_Tops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MCS2`.`Clothing_Brand_has_Tops` (
  `Clothing_Brand_Brand_id` INT NOT NULL,
  `Tops_top_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Clothing_Brand_Brand_id`, `Tops_top_desc`),
  INDEX `fk_Clothing_Brand_has_Tops_Tops1_idx` (`Tops_top_desc` ASC) VISIBLE,
  INDEX `fk_Clothing_Brand_has_Tops_Clothing_Brand1_idx` (`Clothing_Brand_Brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clothing_Brand_has_Tops_Clothing_Brand1`
    FOREIGN KEY (`Clothing_Brand_Brand_id`)
    REFERENCES `MCS2`.`Clothing_Brand` (`Brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clothing_Brand_has_Tops_Tops1`
    FOREIGN KEY (`Tops_top_desc`)
    REFERENCES `MCS2`.`Tops` (`top_desc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MCS2`.`Clothing_Brand_has_Bottoms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MCS2`.`Clothing_Brand_has_Bottoms` (
  `Clothing_Brand_Brand_id` INT NOT NULL,
  `Bottoms_bottoms_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Clothing_Brand_Brand_id`, `Bottoms_bottoms_desc`),
  INDEX `fk_Clothing_Brand_has_Bottoms_Bottoms1_idx` (`Bottoms_bottoms_desc` ASC) VISIBLE,
  INDEX `fk_Clothing_Brand_has_Bottoms_Clothing_Brand1_idx` (`Clothing_Brand_Brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clothing_Brand_has_Bottoms_Clothing_Brand1`
    FOREIGN KEY (`Clothing_Brand_Brand_id`)
    REFERENCES `MCS2`.`Clothing_Brand` (`Brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clothing_Brand_has_Bottoms_Bottoms1`
    FOREIGN KEY (`Bottoms_bottoms_desc`)
    REFERENCES `MCS2`.`Bottoms` (`bottoms_desc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MCS2`.`Clothing_Brand_has_Jackets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MCS2`.`Clothing_Brand_has_Jackets` (
  `Clothing_Brand_Brand_id` INT NOT NULL,
  `Jackets_jackets_desc` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Clothing_Brand_Brand_id`, `Jackets_jackets_desc`),
  INDEX `fk_Clothing_Brand_has_Jackets_Jackets1_idx` (`Jackets_jackets_desc` ASC) VISIBLE,
  INDEX `fk_Clothing_Brand_has_Jackets_Clothing_Brand1_idx` (`Clothing_Brand_Brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clothing_Brand_has_Jackets_Clothing_Brand1`
    FOREIGN KEY (`Clothing_Brand_Brand_id`)
    REFERENCES `MCS2`.`Clothing_Brand` (`Brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clothing_Brand_has_Jackets_Jackets1`
    FOREIGN KEY (`Jackets_jackets_desc`)
    REFERENCES `MCS2`.`Jackets` (`jackets_desc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `MCS2` ;

-- -----------------------------------------------------
-- Placeholder table for view `MCS2`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MCS2`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `MCS2`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MCS2`.`view1`;
USE `MCS2`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
