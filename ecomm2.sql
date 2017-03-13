-- Enable client program to communicate with the server using utf8 character set
SET NAMES 'utf8';

DROP DATABASE IF EXISTS `ecommv2`;
CREATE DATABASE IF NOT EXISTS `ecommv2`;

USE `ecommv2`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `cat_id` BIGINT(14) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cat_catgry_nm` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `Tax` (
  `ta_tax_id` BIGINT(14) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ta_state_cd` varchar(2) NOT NULL,
  `ta_catgry_nm` varchar(15) NOT NULL,
  `ta_tax_pc` decimal(5,3) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ve_vendor_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `ve_vendor_nm` varchar(60) DEFAULT NULL,
  `ve_address` varchar(255) DEFAULT NULL,
  `ve_city` varchar(25) DEFAULT NULL,
  `ve_state` varchar(20) DEFAULT NULL,
  `ve_zip_code` int(9) DEFAULT NULL,
  `ve_country` varchar(25) DEFAULT NULL,
  `ve_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ve_vendor_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cu_email` VARCHAR(35) NOT NULL,
  `cu_password` VARCHAR(15) NOT NULL,
  `cu_first_nm` varchar(40) DEFAULT NULL,
  `cu_last_nm` varchar(40) DEFAULT NULL,
  `cu_dob` varchar(10) NOT NULL,
  `cu_gender` char(1) NOT NULL,
  `cu_address` varchar(255) DEFAULT NULL,
  `cu_city` varchar(25) DEFAULT NULL,
  `cu_state` varchar(2) DEFAULT NULL,
  `cu_zip_code` int(9) DEFAULT NULL,
  `cu_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cu_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `pa_sku_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `pa_part_nb` varchar(12) UNIQUE NOT NULL,
  `pa_description` varchar(255) DEFAULT NULL,
  `pa_catgry_nm` varchar(15) NOT NULL,
  `pa_vendor_nb` BIGINT(14) NOT NULL,
  `pa_cost_am` decimal(10,4) DEFAULT NULL,
  `pa_price_am` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`pa_sku_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_Header` (
  `ph_po_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `ph_vendor_nb` BIGINT(14) NOT NULL,
  `ph_po_dt` TIMESTAMP NOT NULL,
  `ph_total_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`ph_po_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- `ph_subtot_am` decimal(10,4) NOT NULL,
-- `ph_tax_am` decimal(10,4) NOT NULL,
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_Detail` (
  `pd_po_nb` BIGINT(14) NOT NULL,
  `pd_vendor_nb` BIGINT(14) NOT NULL,
  `pd_po_dt` TIMESTAMP NOT NULL,
  `pd_sku_nb` BIGINT(14) NOT NULL,
  `pd_catgry_nm` varchar(15) NOT NULL,
  `pd_po_qy` int(5) NOT NULL,
  `pd_cost_am` decimal(10,4) NOT NULL,
  `pd_subtot_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`pd_po_nb`,`pd_sku_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Invoice_Header` (
  `ih_inv_nb` BIGINT(14) NOT NULL AUTO_INCREMENT,
  `ih_inv_dt` TIMESTAMP NOT NULL,
  `ih_custmr_id` VARCHAR(40) NOT NULL,
  `ih_total_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`ih_inv_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Detail` (
  `id_inv_nb` BIGINT(14) NOT NULL,
  `id_inv_dt` TIMESTAMP NOT NULL,
  `id_custmr_id` VARCHAR(40) NOT NULL,
  `id_sku_nb` BIGINT(14) NOT NULL,
  `id_catgry_nm` varchar(15) NOT NULL,
  `id_sold_qy` int(5) NOT NULL,
  `id_price_am` decimal(10,4) NOT NULL,
  -- `id_tax_id` BIGINT(14) NULL,
  `id_tax_am` decimal(10,4) NOT NULL,
  `id_subtotal_am` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id_inv_nb`, `id_sku_nb`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `in_locat_cd` varchar(12) NOT NULL,
  `in_sku_nb` BIGINT(14) DEFAULT NULL,
  `pa_part_nb` varchar(12) DEFAULT NULL,
  `in_type_nm` varchar(20) DEFAULT NULL,
  `in_ref_cd` BIGINT(14) DEFAULT NULL,
  `in_moved_qy` int(8) DEFAULT NULL,
  `in_qoh_qy` int(8) DEFAULT NULL,
  PRIMARY KEY (`in_locat_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP PROCEDURE IF EXISTS PROC_DROP_FOREIGN_KEY;
    DELIMITER $$
    CREATE PROCEDURE PROC_DROP_FOREIGN_KEY(IN tableName VARCHAR(64), IN constraintName VARCHAR(64))
    BEGIN
        IF EXISTS(
            SELECT * FROM information_schema.table_constraints
            WHERE 
                table_schema    = DATABASE()     AND
                table_name      = tableName      AND
                constraint_name = constraintName AND
                constraint_type = 'FOREIGN KEY')
        THEN
            SET @query = CONCAT('ALTER TABLE ', tableName, ' DROP FOREIGN KEY ', constraintName, ';');
            PREPARE stmt FROM @query; 
            EXECUTE stmt; 
            DEALLOCATE PREPARE stmt; 
        END IF; 
    END$$
    DELIMITER ;


CALL PROC_DROP_FOREIGN_KEY('Inventory', 'Inventory_ibfk_1');



-- ALTER TABLE `Tax` 
-- ADD CONSTRAINT `Tax_ibfk_1` FOREIGN KEY (`ta_catgry_nm`) REFERENCES `Category` (`cat_catgry_nm`);

-- ALTER TABLE `Part` 
-- ADD CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`pa_catgry_nm`) REFERENCES `Category` (`cat_catgry_nm`);

ALTER TABLE `Part` 
ADD CONSTRAINT `Part_ibfk_2` FOREIGN KEY (`pa_vendor_nb`) REFERENCES `Vendor` (`ve_vendor_nb`);

ALTER TABLE `Inventory` 
ADD CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`in_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);

ALTER TABLE `PO_Header` 
ADD CONSTRAINT `PO_Header_ibfk_1` FOREIGN KEY (`ph_vendor_nb`) REFERENCES `Vendor` (`ve_vendor_nb`);

-- ALTER TABLE `PO_Detail` 
-- ADD CONSTRAINT `PO_Detail_ibfk_1` FOREIGN KEY (`pd_catgry_nm`) REFERENCES `Category` (`cat_catgry_nm`);

ALTER TABLE `PO_Detail` 
ADD CONSTRAINT `PO_Detail_ibfk_2` FOREIGN KEY (`pd_po_nb`) REFERENCES `PO_Header` (`ph_po_nb`);

ALTER TABLE `PO_Detail` 
ADD CONSTRAINT `PO_Detail_ibfk_3` FOREIGN KEY (`pd_vendor_nb`) REFERENCES `Vendor` (`ve_vendor_nb`);

ALTER TABLE `PO_Detail` 
ADD CONSTRAINT `PO_Detail_ibfk_4` FOREIGN KEY (`pd_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);

ALTER TABLE `Invoice_Header` 
ADD CONSTRAINT `Invoice_Header_ibfk_1` FOREIGN KEY (`ih_custmr_id`) REFERENCES `Customer` (`cu_email`);

ALTER TABLE `Invoice_Detail` 
ADD CONSTRAINT `Invoice_Detail_ibfk_1` FOREIGN KEY (`id_inv_nb`) REFERENCES `Invoice_Header` (`ih_inv_nb`);

ALTER TABLE `Invoice_Detail` 
ADD CONSTRAINT `Invoice_Detail_ibfk_2` FOREIGN KEY (`id_custmr_id`) REFERENCES `Customer` (`cu_email`);

ALTER TABLE `Invoice_Detail` 
ADD CONSTRAINT `Invoice_Detail_ibfk_3` FOREIGN KEY (`id_sku_nb`) REFERENCES `Part` (`pa_sku_nb`);

-- ALTER TABLE `Invoice_Detail` 
-- ADD CONSTRAINT `Invoice_Detail_ibfk_4` FOREIGN KEY (`id_catgry_nm`) REFERENCES `Category` (`cat_catgry_nm`);

-- ALTER TABLE `Invoice_Detail` 
-- ADD CONSTRAINT `Invoice_Detail_ibfk_4` FOREIGN KEY (`id_tax_id`) REFERENCES `Tax` (`ta_tax_id`);

USE ecommv2;
source Tax.sql;

LOAD DATA LOCAL INFILE 'data/Vendor.csv' INTO TABLE `Vendor`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/Customer.csv' INTO TABLE `Customer`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/Part.csv' INTO TABLE `Part`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/PO_Header.csv' INTO TABLE `PO_Header`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/PO_Detail.csv' INTO TABLE `PO_Detail`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/Invoice_Header.csv' INTO TABLE `Invoice_Header`
fields terminated BY ","
lines terminated BY "\n";

LOAD DATA LOCAL INFILE 'data/Invoice_Detail.csv' INTO TABLE `Invoice_Detail`
fields terminated BY ","
lines terminated BY "\n";

SHOW WARNINGS;

LOAD DATA LOCAL INFILE 'data/Inventory.csv' INTO TABLE `Inventory`
fields terminated BY ","
lines terminated BY "\n";

SHOW WARNINGS;