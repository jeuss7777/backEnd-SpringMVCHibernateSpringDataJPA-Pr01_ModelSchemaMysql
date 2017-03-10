-- Enable client program to communicate with the server using utf8 character set
SET NAMES 'utf8';

DROP DATABASE IF EXISTS `ecomm5`;
CREATE DATABASE IF NOT EXISTS `ecomm5`;

USE `ecomm5`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cu_customer_id` int(10) NOT NULL,
  `cu_first_name` varchar(40) DEFAULT NULL,
  `cu_last_name` varchar(40) DEFAULT NULL,
  `cu_address` varchar(255) DEFAULT NULL,
  `cu_city` varchar(16) DEFAULT NULL,
  `cu_state` varchar(2) DEFAULT NULL,
  `cu_zip_code` int(9) DEFAULT NULL,
  `cu_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cu_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `in_location` varchar(12) NOT NULL,
  `in_sku_number` int(10) DEFAULT NULL,
  `in_quantity_on_hand` int(11) DEFAULT NULL,
  PRIMARY KEY (`in_location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `pa_sku_number` int(10) NOT NULL,
  `pa_part_number` varchar(12) NOT NULL,
  `pa_description` varchar(255) DEFAULT NULL,
  `pa_vendor_number` int(10) NOT NULL,
  `pa_cost_amt` decimal(6,2) DEFAULT NULL,
  `pa_price_amt` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`pa_sku_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Header` (
  `in_invoice_number` int(10) NOT NULL,
  `in_date` date NOT NULL,
  `in_customer_id` int(10) NOT NULL,
  `in_subtotal` decimal(6,2) NOT NULL,
  `in_tax` decimal(6,2) NOT NULL,
  `in_total` decimal(6,2) NOT NULL,
  PRIMARY KEY (`in_invoice_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice_Detail` (
  `id_invoice_number` int(10) NOT NULL,
  `id_date` date NOT NULL,
  `id_customer_id` int(10) NOT NULL,
  `id_category` varchar(12) NOT NULL,
  `id_sku_number` int(8) NOT NULL,
  `id_quantity_sold` int(5) NOT NULL,
  `id_price_amount` decimal(6,2) NOT NULL,
  `id_tax` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_invoice_number`, `id_sku_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax` (
  `ta_state_code` varchar(2) NOT NULL,
  `ta_category` varchar(12) NOT NULL,
  `ta_tax_pct` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ta_state_code`,`ta_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ve_vendor_number` int(10) NOT NULL,
  `ve_vendor_name` varchar(60) DEFAULT NULL,
  `ve_address` varchar(255) DEFAULT NULL,
  `ve_city` varchar(16) DEFAULT NULL,
  `ve_state` varchar(2) DEFAULT NULL,
  `ve_zip_code` int(9) DEFAULT NULL,
  `ve_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ve_vendor_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;


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

CALL PROC_DROP_FOREIGN_KEY('Customer', 'Customer_ibfk_1');

CALL PROC_DROP_FOREIGN_KEY('Inventory', 'Inventory_ibfk_1');

CALL PROC_DROP_FOREIGN_KEY('Part', 'Part_ibfk_1');

CALL PROC_DROP_FOREIGN_KEY('Invoice_Header', 'Invoice_Header_ibfk_1');

CALL PROC_DROP_FOREIGN_KEY('Invoice_Detail', 'Invoice_Detail_ibfk_1');

CALL PROC_DROP_FOREIGN_KEY('Invoice_Detail', 'Invoice_Detail_ibfk_2');


ALTER TABLE `Customer` 
ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`cu_state`) REFERENCES `Tax` (`ta_state_code`);


ALTER TABLE `Inventory` 
ADD CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`in_sku_number`) REFERENCES `Part` (`pa_sku_number`);


ALTER TABLE `Part` 
ADD CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`pa_vendor_number`) REFERENCES `Vendor` (`ve_vendor_number`);

ALTER TABLE `Invoice_Header` 
ADD CONSTRAINT `Invoice_Header_ibfk_1` FOREIGN KEY (`in_customer_id`) REFERENCES `Customer` (`cu_customer_id`);