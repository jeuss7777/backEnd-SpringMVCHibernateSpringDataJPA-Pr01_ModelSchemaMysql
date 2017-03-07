/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cu_customer_id` int(8) NOT NULL,
  `cu_first_name` varchar(40) DEFAULT NULL,
  `cu_last_name` varchar(40) DEFAULT NULL,
  `cu_address` varchar(255) DEFAULT NULL,
  `cu_city` varchar(16) DEFAULT NULL,
  `cu_state` varchar(2) DEFAULT NULL,
  `cu_zip_code` int(9) DEFAULT NULL,
  `cu_telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`cu_customer_id`),
  KEY `cu_state` (`cu_state`),
  CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`cu_state`) REFERENCES `Tax` (`ta_state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `in_location` varchar(12) NOT NULL,
  `in_sku_number` int(8) DEFAULT NULL,
  `in_quantity_on_hand` int(11) DEFAULT NULL,
  PRIMARY KEY (`in_location`),
  KEY `in_sku_number` (`in_sku_number`),
  CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`in_sku_number`) REFERENCES `Part` (`pa_sku_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Part` (
  `pa_sku_number` int(8) NOT NULL,
  `pa_part_number` varchar(12) DEFAULT NULL,
  `pa_description` varchar(255) DEFAULT NULL,
  `pa_vendor_number` int(11) DEFAULT NULL,
  `pa_cost_amt` decimal(6,2) DEFAULT NULL,
  `pa_price_amt` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`pa_sku_number`),
  KEY `pa_vendor_number` (`pa_vendor_number`),
  CONSTRAINT `Part_ibfk_1` FOREIGN KEY (`pa_vendor_number`) REFERENCES `Vendor` (`ve_vendor_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sale` (
  `sa_invoice_number` int(8) NOT NULL,
  `sa_sku_number` int(8) DEFAULT NULL,
  `sa_quantity_sold` int(5) DEFAULT NULL,
  `sa_customer_id` int(8) DEFAULT NULL,
  `sa_price_amount` decimal(6,2) DEFAULT NULL,
  `tax` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`sa_invoice_number`),
  KEY `sa_sku_number` (`sa_sku_number`),
  KEY `sa_customer_id` (`sa_customer_id`),
  CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`sa_sku_number`) REFERENCES `Part` (`pa_sku_number`),
  CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`sa_customer_id`) REFERENCES `Customer` (`cu_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tax` (
  `ta_state_code` varchar(2) NOT NULL,
  `ta_category` varchar(12) DEFAULT NULL,
  `ta_tax_pct` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ta_state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ve_vendor_number` int(8) NOT NULL,
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
CREATE TABLE `language` (
  `languageId` int(11) NOT NULL,
  `languageName` varchar(20) NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
