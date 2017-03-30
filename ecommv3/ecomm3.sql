-- Enable client program to communicate with the server using utf8 character set
SET NAMES 'utf8';

DROP DATABASE IF EXISTS `ecommv3`;
CREATE DATABASE IF NOT EXISTS `ecommv3`;

USE `ecommv3`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `cat_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cat_catgry_nm` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `State` (
  `st_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `st_nm` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `lo_locat_id` INT NOT NULL AUTO_INCREMENT,
  `lo_locat_cd` varchar(12) NOT NULL,
  PRIMARY KEY (`lo_locat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax` (
  `tax_tax_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tax_state_id` INT NOT NULL,
  `tax_catgry_id` INT NOT NULL,
  `tax_tax_pc` decimal(5,3) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ve_vendor_id` INT NOT NULL AUTO_INCREMENT,
  `ve_vendor_nb` BIGINT(14) NOT NULL,
  `ve_vendor_nm` varchar(60) DEFAULT NULL,
  `ve_address` varchar(255) DEFAULT NULL,
  `ve_city` varchar(25) DEFAULT NULL,
  `ve_state` varchar(20) DEFAULT NULL,
  `ve_zip_code` int(9) DEFAULT NULL,
  `ve_country` varchar(25) DEFAULT NULL,
  `ve_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ve_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cu_id` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `cu_user_id` VARCHAR(35) NOT NULL,
  `cu_email` VARCHAR(35) NOT NULL,
  `cu_password` VARCHAR(15) NOT NULL,
  `cu_first_nm` varchar(40) DEFAULT NULL,
  `cu_last_nm` varchar(40) DEFAULT NULL,
  `cu_dob` date NOT NULL,
  `cu_gender` char(1) NOT NULL,
  `cu_address` varchar(255) NOT NULL,
  `cu_city` varchar(25) NOT NULL,
  `cu_st_id` INT NOT NULL,
  `cu_zip_code` int(9) NOT NULL,
  `cu_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `pa_sku_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `pa_part_nb` varchar(12) UNIQUE NOT NULL,
  `pa_description` varchar(255) DEFAULT NULL,
  `pa_cat_id` INT NOT NULL,
  `pa_vendor_id` INT NOT NULL,
  `pa_cost_am` decimal(10,4) DEFAULT NULL,
  `pa_price_am` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`pa_sku_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_Header` (
  `ph_po_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `ph_vendor_id` INT NOT NULL,
  `ph_po_dt` TIMESTAMP NOT NULL,
  `ph_total_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`ph_po_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_Detail` (
  `pd_id` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `pd_po_nb` BIGINT(14) NOT NULL,
  `pd_sku_nb` BIGINT(14) NOT NULL,
  `pd_po_qy` int(5) NOT NULL,
  `pd_subtot_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`pd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Header` (
  `ih_invo_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `ih_cu_id` BIGINT(14) NOT NULL,
  `ih_invo_dt` TIMESTAMP NOT NULL,
  `ih_total_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`ih_invo_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Detail` (
  `id_invo_id` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `id_invo_nb` BIGINT(14) NOT NULL,
  `id_sku_nb` BIGINT(14) NOT NULL,
  `id_sold_qy` INT(5) NOT NULL,
  `id_tax_id` INT NOT NULL,
  `id_subtotal_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id_invo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Sku_Location` (
   `sl_id` INT NOT NULL AUTO_INCREMENT,
   `sl_sku_nb` BIGINT(14) NOT NULL,
   `sl_locat_id` INT NOT NULL,
   PRIMARY KEY (`sl_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory_Rotation` (
  `ir_id` BIGINT(14) NOT NULL AUTO_INCREMENT,
  --  `ir_sku_nb` BIGINT(14) NOT NULL,
  `ir_sl_id` INT NOT NULL,
  `ir_type_nm` varchar(20) DEFAULT NULL,
  `ir_ref_cd` BIGINT(14) DEFAULT NULL,
  `ir_moved_qy` int(8) NOT NULL,
  -- `ir_qy` int(8) DEFAULT NULL,            -- to remove
  PRIMARY KEY (`ir_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QOH` (
  `qoh_id` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `qoh_sl_id` INT NOT NULL,
  -- `qoh_sku_nb` BIGINT(14) NOT NULL,   
  -- `qoh_locat_id` INT NOT NULL,
  `qoh_qy` int(8) DEFAULT NULL,
  PRIMARY KEY (`qoh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- DROP PROCEDURE IF EXISTS PROC_DROP_FOREIGN_KEY;
--     DELIMITER $$
--     CREATE PROCEDURE PROC_DROP_FOREIGN_KEY(IN tableName VARCHAR(64), IN constraintName VARCHAR(64))
--     BEGIN
--         IF EXISTS(
--             SELECT * FROM information_schema.table_constraints
--             WHERE 
--                 table_schema    = DATABASE()     AND
--                 table_name      = tableName      AND
--                 constraint_name = constraintName AND
--                 constraint_type = 'FOREIGN KEY')
--         THEN
--             SET @query = CONCAT('ALTER TABLE ', tableName, ' DROP FOREIGN KEY ', constraintName, ';');
--             PREPARE stmt FROM @query; 
--             EXECUTE stmt; 
--             DEALLOCATE PREPARE stmt; 
--         END IF; 
--     END$$
--     DELIMITER ;


-- CALL PROC_DROP_FOREIGN_KEY('Inventory', 'Inventory_ibfk_1');

ALTER TABLE `Category` ADD UNIQUE `Category_index1`(`cat_catgry_nm`);

ALTER TABLE `Tax` 
ADD CONSTRAINT `Tax_ibfk_1` FOREIGN KEY (`tax_state_id`) REFERENCES `State` (`st_id`);

ALTER TABLE `Tax` 
ADD CONSTRAINT `Tax_ibfk_2` FOREIGN KEY (`tax_catgry_id`) REFERENCES `Category` (`cat_id`);


ALTER TABLE `Tax` ADD UNIQUE `Tax_index1`(`tax_state_id`,`tax_catgry_id`);


ALTER TABLE `Customer` 
ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`cu_st_id`) REFERENCES `State` (`st_id`);



ALTER TABLE `Part` 
ADD CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`pa_cat_id`) REFERENCES `Category` (`cat_id`);

ALTER TABLE `Part` 
ADD CONSTRAINT `Part_ibfk_2` FOREIGN KEY (`pa_vendor_id`) REFERENCES `Vendor` (`ve_vendor_id`);



ALTER TABLE `PO_Header` 
ADD CONSTRAINT `PO_Header_ibfk_1` FOREIGN KEY (`ph_vendor_id`) REFERENCES `Vendor` (`ve_vendor_id`);





ALTER TABLE `PO_Detail` 
ADD CONSTRAINT `PO_Detail_ibfk_1` FOREIGN KEY (`pd_po_nb`) REFERENCES `PO_Header` (`ph_po_nb`);


ALTER TABLE `PO_Detail` 
ADD CONSTRAINT `PO_Detail_ibfk_2` FOREIGN KEY (`pd_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);


ALTER TABLE `PO_Detail` ADD UNIQUE `PO_Detail_index1`(`pd_po_nb`, `pd_sku_nb`);


ALTER TABLE `Invoice_Header` 
ADD CONSTRAINT `Invoice_Header_ibfk_1` FOREIGN KEY (`ih_cu_id`) REFERENCES `Customer` (`cu_id`);





ALTER TABLE `Invoice_Detail` 
ADD CONSTRAINT `Invoice_Detail_ibfk_1` FOREIGN KEY (`id_invo_nb`) REFERENCES `Invoice_Header` (`ih_invo_nb`);


ALTER TABLE `Invoice_Detail` 
ADD CONSTRAINT `Invoice_Detail_ibfk_2` FOREIGN KEY (`id_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);

ALTER TABLE `Invoice_Detail` ADD UNIQUE `Invoice_Detail_index1`(`id_invo_nb`, `id_sku_nb`);

ALTER TABLE `Sku_Location` 
ADD CONSTRAINT `Sku_Location_ibfk_1` FOREIGN KEY (`sl_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);

ALTER TABLE `Sku_Location` 
ADD CONSTRAINT `Sku_Location_ibfk_2` FOREIGN KEY (`sl_locat_id`) REFERENCES `Location` (`lo_locat_id`);


ALTER TABLE `Sku_Location` ADD UNIQUE `Sku_Location`(`sl_sku_nb`, `sl_locat_id`);


-- ALTER TABLE `QOH` ADD UNIQUE `QOH_index1`(`qoh_sku_nb`, `qoh_locat_id`);

ALTER TABLE `Inventory_Rotation` 
ADD CONSTRAINT `Inventory_Rotation_ibfk_1` FOREIGN KEY (`ir_sl_id`) REFERENCES `Sku_Location` (`sl_id`);

ALTER TABLE `QOH` 
ADD CONSTRAINT `QOH_ibfk_1` FOREIGN KEY (`qoh_sl_id`) REFERENCES `Sku_Location` (`sl_id`);






LOAD DATA LOCAL INFILE 'Category_ecommv3.csv' INTO TABLE `Category`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'State_ecommv3.csv' INTO TABLE `State`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Tax_ecommv3.csv' INTO TABLE `Tax`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Vendor_ecommv3.csv' INTO TABLE `Vendor`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Location_ecommv3.csv' INTO TABLE `Location`
fields terminated BY ","
lines terminated BY "\n";


LOAD DATA LOCAL INFILE 'Customer_ecommv3.csv' INTO TABLE `Customer`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Part_ecommv3.csv' INTO TABLE `Part`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'PO_Header_ecommv3.csv' INTO TABLE `PO_Header`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'PO_Detail_ecommv3.csv' INTO TABLE `PO_Detail`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Invoice_Header_ecommv3.csv' INTO TABLE `Invoice_Header`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Invoice_Detail_ecommv3.csv' INTO TABLE `Invoice_Detail`
fields terminated BY ","
lines terminated BY "\n";


LOAD DATA LOCAL INFILE 'Sku_Location_ecommv3.csv' INTO TABLE `Sku_Location`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Inventory_Rotation_INV_03_ecommv3.csv' INTO TABLE `Inventory_Rotation`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'Inventory_Rotation_PO_03_ecommv3.csv' INTO TABLE `Inventory_Rotation`
fields terminated BY ","
lines terminated BY "\n";

-- LOAD DATA LOCAL INFILE 'QOH_ecommv3.csv' INTO TABLE `QOH`
-- fields terminated BY ","
-- lines terminated BY "\n";




SHOW WARNINGS;