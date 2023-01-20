CREATE DATABASE IF NOT EXISTS `MyStore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `MyStore`;

CREATE TABLE IF NOT EXISTS `MyStore`.`Client` (
  `ID_client` INT(4) NOT NULL AUTO_INCREMENT,
  `Client_surname` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Client_name` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Client_patronymic` VARCHAR(50) COLLATE utf8mb4_unicode_ci NULL,
  `City` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Street` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `House` INT(4) NOT NULL,
  `Appartment` INT(4) NOT NULL,
  `Email` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone_number` VARCHAR(12)COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_client`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Staff` (
  `ID_Staff` INT(4) NOT NULL AUTO_INCREMENT,
  `Staff_surname` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Staff_name` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Staff_patronymic` VARCHAR(50) COLLATE utf8mb4_unicode_ci NULL,
  `Staff_number` VARCHAR(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Staff`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Pay` (
  `Pay_ID` INT(2) NOT NULL AUTO_INCREMENT,
  `Kind_of_pay` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Pay_ID`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Status` (
  `ID` INT(3) NOT NULL AUTO_INCREMENT,
  `Order_status` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Shipping` (
  `Shipping_ID` INT(2) NOT NULL AUTO_INCREMENT,
  `Kind_of_shipping` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Shipping_Price` INT(4) NOT NULL,
  PRIMARY KEY (`Shipping_ID`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Order` (
  `ID_order` INT(5) NOT NULL AUTO_INCREMENT,
  `Client_ID_client` INT(4) NOT NULL,
  `Staff_ID_Staff` INT(4) NOT NULL,
  `Date_order` DATETIME NOT NULL,
  `Final_price` INT(8) NOT NULL,
  `Pay_Pay_ID` INT(2) NOT NULL,
  `Shipping_Shipping_ID` INT(2) NOT NULL,
  `Status_ID` INT(3) NOT NULL,
  PRIMARY KEY (`ID_order`),
  INDEX `fk_Order_Client_idx` (`Client_ID_client` ASC) VISIBLE,
  INDEX `fk_Order_Staff1_idx` (`Staff_ID_Staff` ASC) VISIBLE,
  INDEX `fk_Order_Pay1_idx` (`Pay_Pay_ID` ASC) VISIBLE,
  INDEX `fk_Order_Shipping1_idx` (`Shipping_Shipping_ID` ASC) VISIBLE,
  INDEX `fk_Order_Status_idx` (`Status_ID` ASC) VISIBLE,
  FOREIGN KEY (`Client_ID_client`) REFERENCES `MyStore`.`Client` (`ID_client`)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  FOREIGN KEY (`Staff_ID_Staff`) REFERENCES `MyStore`.`Staff` (`ID_Staff`)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  FOREIGN KEY (`Pay_Pay_ID`) REFERENCES `MyStore`.`Pay` (`Pay_ID`)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  FOREIGN KEY (`Shipping_Shipping_ID`) REFERENCES `MyStore`.`Shipping` (`Shipping_ID`)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  FOREIGN KEY (`Status_ID`) REFERENCES `MyStore`.`Status` (`ID`)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
    )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Supplier` (
  `ID_Supplier` INT(4) NOT NULL AUTO_INCREMENT,
  `Name_Supplier` VARCHAR(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Web_Site` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_Supplier` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Supplier`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Supply` (
  `ID_Supply` INT(5) NOT NULL AUTO_INCREMENT,
  `Date_supply` DATE NOT NULL,
  `Supply_Price` INT(8) NOT NULL,
  `Supplier_ID_Supplier` INT(4) NOT NULL,
  PRIMARY KEY (`ID_Supply`, `Supplier_ID_Supplier`),
  INDEX `fk_Supply_Supplier1_idx` (`Supplier_ID_Supplier` ASC) VISIBLE,
    FOREIGN KEY (`Supplier_ID_Supplier`) REFERENCES `MyStore`.`Supplier` (`ID_Supplier`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION)
ENGINE = InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Characteristic` (
  `ID_Characteristic` INT(5) NOT NULL AUTO_INCREMENT,
  `Name_Characteristic` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Measure_Unit` VARCHAR(30) COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`ID_Characteristic`))
ENGINE = InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Category` (
  `ID_Category` INT(3) NOT NULL AUTO_INCREMENT,
  `Name_Category` VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price_incr(%)` INT(4) NOT NULL,
  PRIMARY KEY (`ID_Category`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `MyStore`.`Manufacturer` (
  `ID_Manufacturer` INT(4) NOT NULL AUTO_INCREMENT,
  `Name_Manufacturer` VARCHAR(50)  COLLATE utf8mb4_unicode_ci NOT NULL,
  `Web-site` VARCHAR(50)  COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Manufacturer`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  CREATE TABLE IF NOT EXISTS `MyStore`.`Product` (
    `ID_Product` INT(4) NOT NULL AUTO_INCREMENT,
    `Product_Name` VARCHAR(50)  COLLATE utf8mb4_unicode_ci NOT NULL,
    `Description` VARCHAR(1000)  COLLATE utf8mb4_unicode_ci NULL,
    `In_Store` INT(3) NOT NULL,
    `Category_ID_Category` INT(5) NOT NULL,
    `Manufacturer_ID_Manufacturer` INT(5) NOT NULL,
    PRIMARY KEY (`ID_Product`),
    INDEX `fk_Category_ID_Category_idx` (`Category_ID_Category` ASC) VISIBLE,
    INDEX `fk_Manufacturer_ID_Manufacturer_idx` (`Manufacturer_ID_Manufacturer` ASC) VISIBLE,
    FOREIGN KEY (`Category_ID_Category`) REFERENCES `MyStore`.`Category` (`ID_Category`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
    FOREIGN KEY (`Manufacturer_ID_Manufacturer`) REFERENCES `MyStore`.`Manufacturer` (`ID_Manufacturer`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION)
  ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  CREATE TABLE IF NOT EXISTS `MyStore`.`Product_Characteristics` (
  `Product_ID_Product` INT(4) NOT NULL AUTO_INCREMENT,
  `Characteristic_ID_Characteristic` INT(5) NOT NULL,
  `Value` VARCHAR(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Product_ID_Product`, `Characteristic_ID_Characteristic`),
    INDEX `fk_Product_Characteristics_Product1_idx` (`Product_ID_Product` ASC) VISIBLE,
    INDEX `fk_Product_Characteristics_Characteristic1_idx` (`Characteristic_ID_Characteristic` ASC) VISIBLE,
    FOREIGN KEY (`Product_ID_Product`) REFERENCES `MyStore`.`Product` (`ID_Product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Characteristic_ID_Characteristic`) REFERENCES `MyStore`.`Characteristic` (`ID_Characteristic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  CREATE TABLE IF NOT EXISTS `MyStore`.`Supply-Product` (
    `Supply_ID_Supply` INT(5) NOT NULL,
    `Product_ID_Product` INT(4) NOT NULL,
    `Supply_prod_amount` INT(5) NOT NULL,
    `Old_product_price` INT(6) NOT NULL,
    INDEX `fk_table1_Supply1_idx` (`Supply_ID_Supply` ASC) VISIBLE,
    INDEX `fk_table1_Product1_idx` (`Product_ID_Product` ASC) VISIBLE,
    PRIMARY KEY (`Product_ID_Product`, `Supply_ID_Supply`),
    FOREIGN KEY (`Supply_ID_Supply`) REFERENCES `MyStore`.`Supply` (`ID_Supply`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
      FOREIGN KEY (`Product_ID_Product`) REFERENCES `MyStore`.`Product` (`ID_Product`)
      ON UPDATE NO ACTION
      ON DELETE NO ACTION)
  ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  CREATE TABLE IF NOT EXISTS `MyStore`.`Order_List` (
    `Product_amount` INT(4) NOT NULL,
    `Order_ID_order` INT(5) NOT NULL,
    `Supply-Product_Product_ID_Product` INT(4) NOT NULL,
    `Supply-Product_Supply_ID_Supply` INT(5) NOT NULL,
    `New_product_price` INT(6) NOT NULL,
    INDEX `fk_Order-Product_Order1_idx` (`Order_ID_order` ASC) VISIBLE,
    PRIMARY KEY (`Order_ID_order`, `Supply-Product_Product_ID_Product`, `Supply-Product_Supply_ID_Supply`),
    INDEX `fk_Order_List_Supply-Product1_idx` (`Supply-Product_Product_ID_Product` ASC, `Supply-Product_Supply_ID_Supply` ASC) VISIBLE,
    FOREIGN KEY (`Order_ID_order`) REFERENCES `MyStore`.`Order` (`ID_order`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION,
    FOREIGN KEY (`Supply-Product_Product_ID_Product` , `Supply-Product_Supply_ID_Supply`) REFERENCES `MyStore`.`Supply-Product` (`Product_ID_Product` , `Supply_ID_Supply`)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION)
  ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

  DELIMITER //
  CREATE TRIGGER `negative_order`
  BEFORE INSERT ON `Order`
  FOR EACH ROW
  BEGIN
    IF NEW.`Final_Price` < 0
    THEN SIGNAL SQLSTATE '45000' SET message_text = 'Error! Wrong count.';
    END IF;
  END //
  DELIMITER ;

  DELIMITER //
  CREATE TRIGGER `negative_supply`
  BEFORE INSERT ON `Supply`
  FOR EACH ROW
  BEGIN
    IF NEW.`Supply_Price` < 0
    THEN SIGNAL SQLSTATE '45000' SET message_text = 'Error! Wrong count.';
    END IF;
  END //
  DELIMITER ;

  DELIMITER //
  CREATE TRIGGER `negative_product`
  BEFORE INSERT ON `Product`
  FOR EACH ROW
  BEGIN
    IF NEW.`In_Store` < 0
    THEN SIGNAL SQLSTATE '45000' SET message_text = 'Error! Wrong count.';
    END IF;
  END //
  DELIMITER ;

  DELIMITER //
  CREATE TRIGGER `negative_sup_prod`
  BEFORE INSERT ON `Supply-Product`
  FOR EACH ROW
  BEGIN
    IF (NEW.`Old_product_price` < 0) OR (NEW.`Supply_prod_amount` <= 0)
    THEN SIGNAL SQLSTATE '45000' SET message_text = 'Error! Wrong count.';
    END IF;
  END //
  DELIMITER ;

  DELIMITER //
  CREATE TRIGGER `negative_order_list`
  BEFORE INSERT ON `Order_List`
  FOR EACH ROW
  BEGIN
    IF (NEW.`New_product_price` < 0) OR (NEW.`Product_amount` <= 0)
    THEN SIGNAL SQLSTATE '45000' SET message_text = 'Error! Wrong count.';
    END IF;
  END //
  DELIMITER ;

  --Триггер для supply-Product

  DELIMITER //
  CREATE TRIGGER `prod_incr`
  AFTER INSERT ON `Supply-Product`
  FOR EACH ROW
  BEGIN
    UPDATE `Product`
    SET `Product`.`In_Store`=`Product`.`In_Store` + NEW.`Supply_prod_amount`
    WHERE `Product`.`ID_Product` = NEW.`Product_ID_Product` ;
  END//
  DELIMITER ;

  --Триггер для заполнения итоговой стоимости поставки
  DELIMITER //
  CREATE TRIGGER `supply_price_incr`
  AFTER INSERT ON `Supply-Product`
  FOR EACH ROW
  BEGIN
    UPDATE `Supply`
    SET `Supply`.`Supply_Price`=`Supply`.`Supply_Price` + (NEW.`Supply_prod_amount` * NEW.`Old_product_price`)
    WHERE `Supply`.`ID_Supply` = NEW.`Supply_ID_Supply` ;
  END//
  DELIMITER ;

  --Триггер для стартовой стоимости заказа
  DELIMITER //
  CREATE TRIGGER `start_order_price`
  BEFORE INSERT ON `Order`
  FOR EACH ROW
  BEGIN
  SET NEW.`Final_price`=(SELECT `Shipping_Price` FROM `Shipping` WHERE `Shipping`.`Shipping_ID`= NEW.`Shipping_Shipping_ID`);
  END//
  DELIMITER ;

  --Триггер для заполнения итоговой стоимости заказа
  DELIMITER //
  CREATE TRIGGER `order_price_incr`
  AFTER INSERT ON `Order_List`
  FOR EACH ROW
  BEGIN
    UPDATE `Order`
    SET `Order`.`Final_Price`=`Order`.`Final_Price` + (NEW.`Product_amount` * NEW.`New_product_price`)
    WHERE `Order`.`ID_order` = NEW.`Order_ID_order` ;
  END//
  DELIMITER ;

  --Триггер для проверки кол-ва товара на складе при заказе
  DELIMITER //
  CREATE TRIGGER `prod_check`
  BEFORE INSERT ON `Order_List`
  FOR EACH ROW
  BEGIN
    IF (SELECT `In_Store` FROM `Product` WHERE `Product`.`ID_Product` = NEW.`Supply-Product_Product_ID_Product`) >= NEW.`Product_amount` THEN
    UPDATE `Product` SET `Product`.`In_Store`= `Product`.`In_Store`- NEW.`Product_amount`
    WHERE `Product`.`ID_Product` = NEW.`Supply-Product_Product_ID_Product`;
  ELSE set @message_text = concat('На данный момент такого количества товара нет:', NEW.`Product_amount`);
  SIGNAL SQLSTATE '45000'
  set message_text = @message_text;
  END IF;
  END //
  DELIMITER ;

  --Триггер для получения новой цены
  DELIMITER //
  CREATE TRIGGER `get_new_price`
  BEFORE INSERT ON `Order_List`
  FOR EACH ROW
  BEGIN
    SET NEW.`New_product_price`=
    (
      SELECT `Supply-Product`.`Old_product_price` * `Category`.`Price_incr(%)` / 100
      FROM `Supply-Product` INNER JOIN `Product` ON `Product`.`ID_Product` = `Supply-Product`.`Product_ID_Product`
      INNER JOIN `Category` ON `Product`.`Category_ID_Category` = `Category`.`ID_Category`
      WHERE (`Product_ID_Product` = `ID_Product`) AND (`Category_ID_Category` = `ID_Category`) AND (NEW.`Supply-Product_Product_ID_Product` = `Product_ID_Product`) AND (NEW.`Supply-Product_Supply_ID_Supply` = `Supply_ID_Supply`)
    );
  END//
  DELIMITER ;

  --Процедура для создания нового заказа
  DELIMITER //
  CREATE PROCEDURE `Create_Order` (c_id INT(5), s_id INT(5), p_id INT(2), sh_id INT(2), st_ID INT(3))
    BEGIN
      INSERT INTO `Order` (`Client_ID_Client`, `Staff_ID_Staff`, `Date_order`, `Final_price`, `Pay_Pay_ID`, `Shipping_Shipping_ID`, `Status_ID` )
      VALUES (c_id, s_id, NOW(), 0, p_id, sh_id, st_ID);
      END //
  DELIMITER ;

  --Процедура для вывода всех незавершенных заказов сотрудника
  DELIMITER //
  CREATE PROCEDURE `Check_staff` (id INT(5))
    BEGIN
     SELECT DISTINCT `Order`.`ID_order` AS `ID`, `Order`.`Date_order` AS `Date`, `Order`.`Final_price` AS `Price`, `Client`.`Client_surname` AS `Client`, `Status`.`Order_status` AS `Status`
     FROM `Order`,`Client`, `Staff`, `Status`
     WHERE (`Order`.`Status_ID` != 7) AND (`Order`.`Staff_ID_Staff` = id) AND (`Order`.`Client_ID_client` = `Client`.`ID_client`) AND (`Order`.`Status_ID` = `Status`.`ID`)
     ;
     END //
    DELIMITER ;




  INSERT INTO `MyStore`.`Client` (`Client_surname`, `Client_name`, `Client_patronymic`, `City`,`Street`,`House`,`Appartment`, `Email`, `Phone_number`)  VALUES
    ('Андреев', 'Сергей', 'Семенович', 'Орел', 'Покровская',13 , 33, 'Andreev_Ivan94@mail.ru', '89107485050'),
    ('Ефремова', 'Елена', 'Алексеевна', 'Орел', 'Наугорское шоссе', 74, 143, 'Lenka64@mail.ru', '89152056677'),
    ('Покровский', 'Андрей', 'Олегович', 'Орел', 'Герцена', 46, 55, 'PoKrOV274@gmail.com', '89548348989'),
    ('Быков', 'Антон', 'Павлович', 'Орел', 'Наугорское шоссе', 74, 89, 'Toxa99@mail.ru', '89776541345'),
    ('Гаврилов', 'Сергей', 'Геннадьевич', 'Орел', 'Максима Горького', 33, 10, 'SeriyVolkD@gmail.com', '89158880974'),
    ('Петров', 'Олег', 'Анатольевич', 'Орел', 'Октябрьская', 65, 44, 'PetrovI@gmail.com', '89107482033'),
    ('Покровский', 'Данил', 'Олегович', 'Орел', 'Наугорское шоссе', 72, 99, 'VORKoP@mail.ru', '89996547848'),
    ('Данилова', 'Дарья', 'Борисовна', 'Орел', 'Ленина', 34, 78, 'Dashka78@mail.ru', '89996540983');

  INSERT INTO `MyStore`.`Staff` (`Staff_surname`, `Staff_name`, `Staff_patronymic`, `Staff_number`) VALUES
    ('Алексеев','Павел','Павлович','89990997878'),
    ('Борисов','Михаил','Денисович','89764561234'),
    ('Семенов','Дмитрий','Петрович','89567589779'),
    ('Польская','Варвара','Петровна','89876784565'),
    ('Быков','Сергей','Павлович','89999995678'),
    ('Норвежский','Антон','Игоревич','89770932323'),
    ('Иванов','Иван','Иванович','89991111919');

INSERT INTO `MyStore`.`Status` (`Order_status`) VALUES
  ('Ожидание оплаты'),
  ('Получена оплата'),
  ('Ожидание отправки'),
  ('Отправлено'),
  ('Ждет вас в пункте выдачи'),
  ('Ожидайте звонка от курьера'),
  ('Завершен');

  INSERT INTO `MyStore`.`Pay` (`Kind_of_pay`) VALUES
    ('Наличный рассчет'),
    ('Безналичный рассчет');

  INSERT INTO `MyStore`.`Shipping` (`Kind_of_shipping`, `Shipping_Price`) VALUES
    ('Доставка курьером', 500),
    ('Самовывоз', 200);

  INSERT INTO `MyStore`.`Supplier` (`Name_Supplier`, `Web_Site`, `Email_Supplier`) VALUES
    ('Восточная Звезда', 'www.eastStar.ru','eastStar@mail.ru'),
    ('Ясон', 'www.Yason135.ru','YAsoNcomp@mail.ru'),
    ('ОрелЦифромаркет', 'www.Orelsifro.com','SifromarK@mail.ru'),
    ('Багира', 'www.bagiracomp.ru','Bagiracomp@mail.ru');

  INSERT INTO `MyStore`.`Category` (`Name_Category`, `Price_incr(%)`) VALUES
    ('Материнская плата',120 ),
    ('Процессор',115 ),
    ('Опреативная память', 110),
    ('Видеокарта', 110),
    ('Корпус', 115),
    ('Винчестер', 110),
    ('Блок питания', 125),
    ('Система охлаждения', 120);

  INSERT INTO `MyStore`.`Characteristic` (`Name_Characteristic`, `Measure_Unit`) VALUES
    ('Сокет', '-'),
    ('Чипсет', '-'),
    ('Max кол-во процессоров', 'шт'),
    ('Формат платы', '-'),
    ('Max объем оперативной памяти', 'Гб'),
    ('Тактовая частота', 'ГГц'),
    ('Частота шины', 'Gt/s'),
    ('Кол-во ядер', 'шт'),
    ('Умножение', '-'),
    ('Объем модуля памяти', 'Гб'),
    ('Частота функционирования', 'МГц'),
    ('Пропускающая способность памяти', 'Гб/сек'),
    ('Частота GPU', 'МГц'),
    ('Видеопамять', 'Гб'),
    ('Тип видеопамяти', '-'),
    ('Разрядность шины видеопамяти', 'бит'),
    ('Частота видеопамяти', 'МГц'),
    ('Цвет', '-'),
    ('Емкость', 'Тб'),
    ('Тип', '-'),
    ('Скорость чтения', 'Мб/сек'),
    ('Скорость записи', 'Мб/сек'),
    ('Время доступа', 'мс'),
    ('Тип охлаждения', '-'),
    ('Кол-во вентиляторов', 'шт'),
    ('Скорость вращения', 'об/мин'),
    ('Мощность', 'Вт');

    INSERT INTO `MyStore`.`Supply` (`Date_supply`, `Supply_Price`, `Supplier_ID_Supplier`) VALUES
      ('2019-05-12', 0, 1),
      ('2019-05-15', 0, 3),
      ('2019-07-24', 0, 4),
      ('2019-09-07', 0, 2),
      ('2019-09-30', 0, 4),
      ('2019-11-11', 0, 3);

    INSERT INTO `MyStore`.`Manufacturer` (`Name_Manufacturer`, `Web-Site`) VALUES
      ('AsRock', 'www.AsRock.com'),
      ('GIGABYTE', 'www.GIGBYTE.com'),
      ('ASUS', 'www.ASUS.com'),
      ('Intel', 'www.Intel.com'),
      ('AMD', 'www.AMD.com'),
      ('ADATA', 'www.ADATA.com'),
      ('Crucial', 'www.Crucial.com'),
      ('MSI', 'www.MSI.com'),
      ('Powercool', 'www.Powercool.com'),
      ('ExeGate', 'www.ExeGate.com'),
      ('Powerman', 'www.Powerman.com'),
      ('Seagate', 'www.Seagate.com'),
      ('Toshiba', 'www.Toshiba.com'),
      ('HGST', 'www.HGST.com'),
      ('Aerocool', 'www.Aerocool.com'),
      ('Chieftec', 'www.Chieftec.com'),
      ('Akasa', 'www.Akasa.com'),
      ('Alphacool', 'www.Alphacool.com'),
      ('Aardwolf', 'www.Aardwolf.com');

      INSERT INTO `MyStore`.`Product` (`Product_Name`, `Description`, `In_Store`, `Category_ID_Category`, `Manufacturer_ID_Manufacturer`) VALUES
        ('B365', 'Материнская плата ASRock ...', 0, 1, 1),
        ('970 Pro3', 'Материнская плата ASRock ...', 0, 1, 1),
        ('M5A78L', 'Материнская плата ASUS ...', 0, 1, 3),
        ('GA-78LMT', 'Материнская плата GIGABYTE ...', 0, 1, 2),
        ('Core i5-4460', 'Процессор Intel ...', 0, 2, 4),
        ('Core i7-5820', 'Процессор Intel ...', 0, 2, 4),
        ('A10-7800', 'Процессор AMD ...', 0, 2, 5),
        ('FX-4350', 'Процессор AMD ...', 0, 2, 5),
        ('DDR3 DIMM', 'Модуль памяти ADATA...', 0, 3, 6),
        ( 'DDR4 DIMM CL17', 'Модуль памяти Crucial...', 0, 3, 7),
        ( 'DDR4 DIMM CL19', 'Модуль памяти Crucial...', 0, 3, 7),
        ( 'GeForce RTX 2080 Ti', 'Видеокарта GIGABYTE...', 0, 4, 2),
        ('GeForce GT 710', 'Видеокарта ASUS...', 0, 4, 3),
        ('GeForce GT 1030', 'Видеокарта MSI...', 0, 4, 8),
        ('GeForce GTX 1050', 'Видеокарта GIGABYTE...', 0, 4, 2),
        ('S602P', 'Корпус PowerCool...', 0, 5, 9),
        ('CP-604', 'Корпус ExeGate...', 0, 5, 10),
        ('DA812BK', 'Корпус Powerman...', 0, 5, 11),
        ('SATA', 'Винчестер GIGBYTE...', 0, 6, 2),
        ('Barracuda', 'Винчестер Seagate...', 0, 6, 12),
        ('P300', 'Винчестер Toshiba...', 0, 6, 13),
        ('TravelStar', 'Винчестер HGST...', 0, 6, 14),
        ('KCAS PLUS-400w', 'Блок питания Aerocool...', 0, 7, 15),
        ('VX-450', 'Блок питания Aerocool...', 0, 7, 15),
        ('Smart GPS-400A8', 'Блок питания Chieftec...', 0, 7, 16),
        ('Venom A10', 'Водяное охлаждение Akasa...', 0, 8, 17),
        ('Eisbaer LT360', 'Водяное охлаждение Alphacool', 0, 8, 18),
        ('Performa V120', 'Кулер Aardwolf...', 0, 8, 19);

        INSERT INTO `MyStore`.`Supply-Product` VALUES
        (1, 1, 30, 8000),
        (1, 8, 20, 3000),
        (1, 15, 30, 9000),
        (1, 22, 40, 4000),
        (1, 26, 20, 6000),
        (2, 2, 50, 5000),
        (2, 3, 40, 4000),
        (2, 17, 15, 2000),
        (2, 21, 50, 3000),
        (2, 24, 25, 2000),
        (3, 9, 50, 1500),
        (3, 12, 10, 86000),
        (3, 19, 20, 8000),
        (4, 5, 35, 14000),
        (4, 10, 30, 4500),
        (4, 13, 25, 3000),
        (4, 18, 20, 4000),
        (4, 25, 10, 2000),
        (4, 28, 15, 1500),
        (5, 4, 15, 14000),
        (5, 6, 20, 13000),
        (5, 16, 25, 3000),
        (5, 23, 10, 3000),
        (5, 27, 20, 10000),
        (6, 7, 40, 6500),
        (6, 11, 30, 5000),
        (6, 14, 35, 5000),
        (6, 20, 30, 9000);

      INSERT INTO `MyStore`.`Order` (`Client_ID_Client`, `Staff_ID_Staff`, `Date_order`, `Final_price`, `Pay_Pay_ID`, `Shipping_Shipping_ID`, `Status_ID`) VALUES
        (1, 1, '2019-10-15 01:29:31', 0, 1, 2, 7),
        (2, 2, '2019-11-21 05:44:01', 0, 2, 1, 7),
        (3, 2, '2019-11-29 12:11:24', 0, 1, 1, 7),
        (4, 6, '2019-12-05 07:55:44', 0, 2, 2, 5),
        (1, 2, '2019-12-08 19:08:42', 0, 2, 2, 3);

      INSERT INTO `MyStore`.`Order_List` VALUES
        (2, 1, 15, 1, 0),
        (5, 2, 10, 4, 0),
        (4, 2, 26, 1, 0),
        (10, 3, 19, 3, 0),
        (5, 3, 20, 6, 0),
        (1, 4, 12, 3, 0),
        (12, 5, 16, 5, 0),
        (1, 5, 6, 5, 0),
        (2, 5, 17, 2, 0);

        INSERT INTO `MyStore`.`Product_Characteristics` VALUES
          (1, 1, 'LGA1151'),
          (1, 2, 'Intel B365'),
          (1, 3, '1'),
          (1, 4, 'ATX'),
          (1, 5, '64'),
          (2, 1, 'AM3'),
          (2, 2, 'AMD 970'),
          (2, 3, '1'),
          (2, 4, 'ATX'),
          (2, 5, '32'),
          (3, 1, 'AM3'),
          (3, 2, 'AMD 760G'),
          (3, 3, '1'),
          (3, 4, 'microATX'),
          (3, 5, '32'),
          (4, 1, 'AM3'),
          (4, 2, 'AMD 760G'),
          (4, 3, '1'),
          (4, 4, 'microATX'),
          (4, 5, '16'),
          (5, 1, 'LGA1151'),
          (5, 5, '32'),
          (5, 6, '3.2'),
          (5, 7, '5'),
          (5, 8, '4'),
          (5, 9, '32'),
          (6, 1, 'LGA2011-3'),
          (6, 5, '64'),
          (6, 6, '3.3'),
          (6, 7, '5'),
          (6, 8, '6'),
          (6, 9, '33'),
          (7, 1, 'FM2 plus'),
          (7, 5, '64'),
          (7, 6, '3.5'),
          (7, 7, '5'),
          (7, 8, '4'),
          (7, 9, '35'),
          (8, 1, 'AM3'),
          (8, 5, '128'),
          (8, 6, '4.2'),
          (8, 7, '5.2'),
          (8, 8, '4'),
          (8, 9, '21'),
          (9, 10, '4'),
          (9, 11, '1600'),
          (9, 12, '12.5'),
          (10, 10, '16'),
          (10, 11, '2400'),
          (10, 12, '19'),
          (11, 10, '16'),
          (11, 11, '2666'),
          (11, 12, '21'),
          (12, 12, '616'),
          (12, 13, '1665'),
          (12, 14, '11'),
          (12, 15, 'GDDR6'),
          (12, 16, '352'),
          (12, 17, '3500'),
          (13, 12, '500'),
          (13, 13, '954'),
          (13, 14, '1'),
          (13, 15, 'GDDR5'),
          (13, 16, '32'),
          (13, 17, '1252'),
          (14, 12, '550'),
          (14, 13, '1430'),
          (14, 14, '2'),
          (14, 15, 'DDR4'),
          (14, 16, '64'),
          (14, 17, '2100'),
          (15, 12, '550'),
          (15, 13, '1493'),
          (15, 14, '2'),
          (15, 15, 'GDDR5'),
          (15, 16, '128'),
          (15, 17, '1752'),
          (16, 18, 'Черный'),
          (17, 18, 'Синий'),
          (18, 18, 'Черный'),
          (19, 19, '1'),
          (19, 20, 'SSD'),
          (19, 21, '560'),
          (19, 22, '520'),
          (19, 23, '-'),
          (20, 19, '1'),
          (20, 20, 'SSD'),
          (20, 21, '560'),
          (20, 22, '530'),
          (20, 23, '-'),
          (21, 19, '1'),
          (21, 20, 'HDD'),
          (21, 21, '-'),
          (21, 22, '-'),
          (21, 23, '4.2'),
          (22, 19, '1'),
          (22, 20, 'HDD'),
          (22, 21, '-'),
          (22, 22, '-'),
          (22, 23, '4.2'),
          (23, 27, '400'),
          (24, 27, '450'),
          (25, 27, '450'),
          (26, 24, 'Водяное охлаждение'),
          (26, 25, '1'),
          (26, 26, '1900'),
          (27, 24, 'Водяное охлаждение'),
          (27, 25, '2'),
          (27, 26, '1700'),
          (28, 24, 'Кулер для процессора'),
          (28, 25, '1'),
          (28, 26, '1500');

 -- Выручка за месяцы

SELECT MONTHNAME(`Order`.`Date_order`) AS `Month`, YEAR(`Order`.`Date_order`) AS `Year`,
SUM(`Order_List`.`Product_amount` * `Order_List`.`New_product_price`) AS `Total`
FROM `Order`, `Order_List`
WHERE (`Order`.`ID_Order` = `Order_List`.`Order_ID_Order`) AND (YEAR(`Order`.`Date_order`) = 2019)
GROUP BY MONTHNAME(`Order`.`Date_order`);

 --Пять производителей, продукции которых более всего в магазине
SELECT `Manufacturer`.`Name_Manufacturer` AS `Manufacturer`,
  COUNT(`Manufacturer`.`ID_Manufacturer`) AS `Amount`
  FROM `Product`, `Manufacturer`
  WHERE `Product`.`Manufacturer_ID_Manufacturer` = `Manufacturer`.`ID_Manufacturer`
  GROUP BY `Manufacturer`.`ID_Manufacturer`
  ORDER BY `Amount` DESC
  LIMIT 5;

 --Вывод всех характеристик всех товаров и их производителей
SELECT `Manufacturer`.`Name_Manufacturer` AS `Manufacturer`,`Product`.`Product_Name` AS `Product`, `Characteristic`.`Name_Characteristic` AS `Characteristic`, `Product_Characteristics`.`Value` AS `Value`,
`Characteristic`.`Measure_Unit` AS `Measure Unit`
FROM `Product`, `Product_Characteristics`, `Characteristic`, `Manufacturer`
WHERE (`Manufacturer`.`ID_Manufacturer` = `Product`.`Manufacturer_ID_Manufacturer`) AND
(`Product`.`ID_Product` = `Product_Characteristics`.`Product_ID_Product`) AND
(`Characteristic`.`ID_Characteristic` = `Product_Characteristics`.`Characteristic_ID_Characteristic`)
ORDER BY `Product`.`Product_Name`;

 --Три лучших клиента
SELECT `Client`.`Client_surname` AS `Surname`, `Client`.`Client_name` AS `Name`, `Client`.`Client_patronymic` AS `Patronymic`, SUM(`Order`.`Final_Price`) AS `MONEY`
FROM `Client`, `Order`
WHERE (`Client`.`ID_client` = `Order`.`Client_ID_Client`)
GROUP BY `Client`.`ID_Client`
ORDER BY `Money` DESC
LIMIT 3;

 --Ведущий работник(С наибольшим числов обработанных заказов)
SELECT `Staff`.`Staff_Surname` AS `Surname`, `Staff`.`Staff_name` AS `Name`, `Staff`.`Staff_patronymic` AS `Patronymic`, COUNT(`Staff`.`ID_Staff`) AS `Order_Amount`
FROM `Staff`, `Order`
WHERE (`Staff`.`ID_Staff` = `Order`.`Staff_ID_Staff`) AND (`Order`.`Status_ID` = 7)
GROUP BY `Staff`.`ID_Staff`
ORDER BY `Order_Amount` DESC
LIMIT 1;
