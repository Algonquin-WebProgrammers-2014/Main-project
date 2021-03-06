
--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_CUSTOMER_USER1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1peip8n342fegc6',NULL,'Jenny','Liu','asdf','55555555'),('1pk70ru5dhogt77',NULL,'D','D','D','D'),('3rt7tu7021lr0f7',NULL,'poldz','google','s','6333546'),('7vh2dhi2nn2pec1',NULL,'r','r','r','r'),('ah7fh4pde2mpivq',NULL,'poldz','google','r','6333546'),('dibb584kdni0me9',NULL,'r','r','r','r'),('e5n6nemmf6n6744',NULL,'poldz','google','s','6333546'),('eh1uls2feai6b5f',NULL,'r','r','r','r'),('fh9rvcb253pga3i',NULL,'r','r','r','r'),('gv91f8am6efth60',NULL,'r','r','r','r'),('jnbviafagauurq6',NULL,'r','r','r','r'),('l8fjtv2u1ii15d2',NULL,'Douglas','King','asdfsadfasfd','123455'),('rlg2vhnebveg531',NULL,'r','r','r','r'),('sbbe60mqf885gcs',NULL,'a','a','a','a'),('sjvf9hnl0u2660a',NULL,'s','ss','s','s'),('t3koj7v14ostctt',NULL,'r','r','r','r');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_history_order`
--

DROP TABLE IF EXISTS `customer_history_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_history_order` (
  `order_id` varchar(30) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_history_order`
--

LOCK TABLES `customer_history_order` WRITE;
/*!40000 ALTER TABLE `customer_history_order` DISABLE KEYS */;
INSERT INTO `customer_history_order` VALUES ('1peip8n342fegc6'),('1pk70ru5dhogt77'),('3rt7tu7021lr0f7'),('7vh2dhi2nn2pec1'),('ah7fh4pde2mpivq'),('e5n6nemmf6n6744'),('eh1uls2feai6b5f'),('l8fjtv2u1ii15d2'),('sbbe60mqf885gcs'),('sjvf9hnl0u2660a');
/*!40000 ALTER TABLE `customer_history_order` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `customer_history_pizza`
--

DROP TABLE IF EXISTS `customer_history_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_history_pizza` (
  `idcustomer_history_pizza` int(11) NOT NULL AUTO_INCREMENT,
  `size` char(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  `special_pizza_list_idspecial_pizza_list` varchar(5) DEFAULT NULL,
  `order_id` varchar(30) NOT NULL,
  PRIMARY KEY (`idcustomer_history_pizza`),
  KEY `fk_customer_history_pizza_customer_history_order1_idx` (`order_id`),
  CONSTRAINT `fk_customer_history_pizza_customer_history_order1` FOREIGN KEY (`order_id`) REFERENCES `customer_history_order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_history_pizza`
--

LOCK TABLES `customer_history_pizza` WRITE;
/*!40000 ALTER TABLE `customer_history_pizza` DISABLE KEYS */;
INSERT INTO `customer_history_pizza` VALUES (2,'0',12,'BL','7vh2dhi2nn2pec1'),(3,'3',12,'HS','eh1uls2feai6b5f'),(4,'0',1,'HS','ah7fh4pde2mpivq'),(5,'1',1,'HS','ah7fh4pde2mpivq'),(6,'2',1,'HS','ah7fh4pde2mpivq'),(7,'3',1,'HS','ah7fh4pde2mpivq'),(8,'2',1,'HS','sbbe60mqf885gcs'),(9,'1',3,'VG','1peip8n342fegc6'),(10,'0',1,'BL','1peip8n342fegc6'),(11,'2',2,'BL','1peip8n342fegc6'),(12,'2',5,'HS','1pk70ru5dhogt77'),(13,'1',3,'VG','l8fjtv2u1ii15d2'),(14,'0',100,'BL','l8fjtv2u1ii15d2'),(15,'1',23,'BL','l8fjtv2u1ii15d2'),(16,'2',33,'BL','l8fjtv2u1ii15d2'),(17,'3',13,'BL','l8fjtv2u1ii15d2'),(18,'0',1,'BL','e5n6nemmf6n6744'),(19,'0',1,'BL','sjvf9hnl0u2660a'),(20,'0',1,'BL','3rt7tu7021lr0f7');
/*!40000 ALTER TABLE `customer_history_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` varchar(30) NOT NULL,
  `delivery_by` date NOT NULL,
  `total` double NOT NULL,
  `status` int(11) DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `customer_id` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_ORDER_CUSTOMER1_idx` (`customer_id`),
  CONSTRAINT `fk_ORDER_CUSTOMER1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `pizza_id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_order_id` varchar(30) NOT NULL,
  `special_pizza_list_idspecial_pizza_list` varchar(5) NOT NULL,
  PRIMARY KEY (`pizza_id`),
  KEY `fk_pizza_order1_idx` (`order_order_id`),
  KEY `fk_pizza_special_pizza_list1_idx` (`special_pizza_list_idspecial_pizza_list`),
  CONSTRAINT `fk_pizza_order1` FOREIGN KEY (`order_order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `special_pizza_price`
--

DROP TABLE IF EXISTS `special_pizza_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_pizza_price` (
  `idspecial_pizza_price` int(11) NOT NULL,
  `small` double NOT NULL,
  `medium` double NOT NULL,
  `large` double NOT NULL,
  `xlarge` double NOT NULL,
  PRIMARY KEY (`idspecial_pizza_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_pizza_price`
--

LOCK TABLES `special_pizza_price` WRITE;
/*!40000 ALTER TABLE `special_pizza_price` DISABLE KEYS */;
INSERT INTO `special_pizza_price` VALUES (0,12.34,17.75,21.75,28.75),(1,12.95,17.5,22.5,27.5),(2,12.75,16.25,22.25,26.75),(3,12.75,16.75,22.5,26.5),(4,13.25,16.25,22.25,26.25),(5,12.5,16.5,22.5,26.5),(6,12.75,16.75,21.75,26.75),(7,12.5,16.5,22.5,26.5),(8,13.25,16.25,22.25,26.25),(9,12.5,16.5,15,26.5),(10,13.25,17.95,29.95,28.5),(11,13.5,16.5,22.5,26.5);
/*!40000 ALTER TABLE `special_pizza_price` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `special_pizza_list`
--

DROP TABLE IF EXISTS `special_pizza_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_pizza_list` (
  `idspecial_pizza_list` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `special_pizza_price_idspecial_pizza_price` int(11) NOT NULL,
  `initial` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idspecial_pizza_list`),
  KEY `fk_special_pizza_list_special_pizza_price_idx` (`special_pizza_price_idspecial_pizza_price`),
  CONSTRAINT `fk_special_pizza_list_special_pizza_price` FOREIGN KEY (`special_pizza_price_idspecial_pizza_price`) REFERENCES `special_pizza_price` (`idspecial_pizza_price`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_pizza_list`
--

LOCK TABLES `special_pizza_list` WRITE;
/*!40000 ALTER TABLE `special_pizza_list` DISABLE KEYS */;
INSERT INTO `special_pizza_list` VALUES (1,'House','Ham, Pepperoni, Mushroom, Shrimp, Green Pepper & Black Olive',0,'HS'),(2,'Bill\'s','Back Bacon, Ham, Pepperoni, Salami, Beef, Onion & Tomato',1,'BL'),(3,'Vegetarian','Mushroom, Green Pepper, Onion, Tomato & Black Olive',2,'VG'),(4,'All Meat','Ham, Pepperoni, Salami, Beef & Sausage',3,'AM'),(5,'Mexican','Pepperoni, Salami, Beef & Banana Pepper',4,'MX'),(6,'Greek','Ham, Pepperoni, Onion, Tomato, Feta & Black Olive',5,'GK'),(7,'Italian','Pepperoni, Salami, Sausage & Green Pepper',6,'ITL'),(8,'Mediterranean','Chicken, Spinach, Feta & Onion',7,'MDN'),(9,'Hawiian','Ham & Pineapple',8,'HWN'),(10,'Cheese Burger','Beef, Onions, Tomato, Pickle & Cheddar',9,'CB'),(11,'Four Cheese','Cheddar, Parmesan, Feta & Mozzarella',10,'FC'),(12,'Summer BBQ','Grilled Chicken, Pineapple, Onion & BBQ Sauce',11,'SB');
/*!40000 ALTER TABLE `special_pizza_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeid` varchar(45) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'1234','2483:581e84606a417cca836ec6e5cabba84513efa8854ba900cf:bb6051ec36287da3dd550cc304d8824acd49f75e9cfb0ba8'),(2,'12345','6953:d5ccc3c313276100892fd6cbe9f13e5858e8567a0dddedd4:86a5d787d624e79a8ba185cdc31bc7b6d48caa802d3a0584');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(130) NOT NULL,
  `email` varchar(45) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rod','3211:1dfd2e28a2b7bd0b1ca06b23c9316a04dc0c87c2fdda2260:4f646d2ed6458b196d4d97f45f5b49b2e54636910dbd4b05','r@admin.com',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;