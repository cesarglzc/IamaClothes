# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: iama_db
# Generation Time: 2013-04-03 02:31:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table shop_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_address`;

CREATE TABLE `shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table shop_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_category`;

CREATE TABLE `shop_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;

INSERT INTO `shop_category` (`category_id`, `parent_id`, `title`, `description`, `language`)
VALUES
	(1,0,'Primary Articles',NULL,NULL),
	(2,0,'Secondary Articles',NULL,NULL),
	(3,1,'Red Primary Articles',NULL,NULL),
	(4,1,'Green Primary Articles',NULL,NULL),
	(5,2,'Red Secondary Articles',NULL,NULL);

/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_customer`;

CREATE TABLE `shop_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table shop_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_image`;

CREATE TABLE `shop_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Image_Products` (`product_id`),
  CONSTRAINT `fk_Image_Products` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table shop_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_order`;

CREATE TABLE `shop_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `delivery_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `ordering_date` int(11) NOT NULL,
  `ordering_done` tinyint(1) DEFAULT NULL,
  `ordering_confirmed` tinyint(1) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `shipping_method` int(11) NOT NULL,
  `comment` text,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer` (`customer_id`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `shop_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table shop_order_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_order_position`;

CREATE TABLE `shop_order_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `specifications` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table shop_payment_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_payment_method`;

CREATE TABLE `shop_payment_method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `tax_id` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_payment_method` WRITE;
/*!40000 ALTER TABLE `shop_payment_method` DISABLE KEYS */;

INSERT INTO `shop_payment_method` (`id`, `title`, `description`, `tax_id`, `price`)
VALUES
	(1,'cash','You pay cash',1,0),
	(2,'advance Payment','You pay in advance, we deliver',1,0),
	(3,'cash on delivery','You pay when we deliver',1,0),
	(4,'invoice','We deliver and send a invoice',1,0),
	(5,'paypal','You pay by paypal',1,0);

/*!40000 ALTER TABLE `shop_payment_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_product_specification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_specification`;

CREATE TABLE `shop_product_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `is_user_input` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_product_specification` WRITE;
/*!40000 ALTER TABLE `shop_product_specification` DISABLE KEYS */;

INSERT INTO `shop_product_specification` (`id`, `title`, `is_user_input`, `required`)
VALUES
	(1,'Size',0,1),
	(2,'Color',0,0),
	(3,'Some random attribute',0,0),
	(4,'Material',0,1),
	(5,'Specific number',1,1);

/*!40000 ALTER TABLE `shop_product_specification` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_product_variation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_product_variation`;

CREATE TABLE `shop_product_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `specification_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price_adjustion` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_product_variation` WRITE;
/*!40000 ALTER TABLE `shop_product_variation` DISABLE KEYS */;

INSERT INTO `shop_product_variation` (`id`, `product_id`, `specification_id`, `position`, `title`, `price_adjustion`)
VALUES
	(1,1,1,2,'variation1',3),
	(2,1,1,3,'variation2',6),
	(3,1,2,4,'variation3',9),
	(4,1,5,1,'please enter a number here',0);

/*!40000 ALTER TABLE `shop_product_variation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_products`;

CREATE TABLE `shop_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text,
  `price` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `specifications` text,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_category` (`category_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;

INSERT INTO `shop_products` (`product_id`, `category_id`, `tax_id`, `title`, `description`, `price`, `language`, `specifications`)
VALUES
	(1,1,1,'Demonstration of Article with variations','Hello, World!','19.99',NULL,NULL),
	(2,1,2,'Another Demo Article with less Tax','!!','29.99',NULL,NULL),
	(3,2,1,'Demo3','','',NULL,NULL),
	(4,4,1,'Demo4','','7, 55',NULL,NULL);

/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_shipping_method
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_shipping_method`;

CREATE TABLE `shop_shipping_method` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `tax_id` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_shipping_method` WRITE;
/*!40000 ALTER TABLE `shop_shipping_method` DISABLE KEYS */;

INSERT INTO `shop_shipping_method` (`id`, `title`, `description`, `tax_id`, `price`)
VALUES
	(1,'Delivery by postal Service','We deliver by Postal Service. 2.99 units of money are charged for that',1,2.99);

/*!40000 ALTER TABLE `shop_shipping_method` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_tax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_tax`;

CREATE TABLE `shop_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `shop_tax` WRITE;
/*!40000 ALTER TABLE `shop_tax` DISABLE KEYS */;

INSERT INTO `shop_tax` (`id`, `title`, `percent`)
VALUES
	(1,'19%',19),
	(2,'7%',7);

/*!40000 ALTER TABLE `shop_tax` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_customer`;

CREATE TABLE `tbl_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rfc` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `lastName` varchar(64) NOT NULL DEFAULT '',
  `streetName` varchar(64) NOT NULL DEFAULT '',
  `streetName2` varchar(64) NOT NULL DEFAULT '',
  `zipcode` int(11) NOT NULL,
  `state` varchar(64) NOT NULL DEFAULT '',
  `city` varchar(64) NOT NULL DEFAULT '',
  `phoneNumber` int(11) NOT NULL,
  `customerType` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;

INSERT INTO `tbl_customer` (`id`, `rfc`, `name`, `lastName`, `streetName`, `streetName2`, `zipcode`, `state`, `city`, `phoneNumber`, `customerType`)
VALUES
	(1,12,'Mr.Pupid','Stupid','Lombardi','Moss',1213,'Wisconsin','GreenBay',112314,'VIP'),
	(5,11,'Cesarin','2','123','123',12313,'123','123',123123,'1'),
	(6,123,'Gaby','Castillo','No','Se',123123,'NL','San PEter',123414,'2');

/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_order`;

CREATE TABLE `tbl_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(11) unsigned NOT NULL,
  `date` date NOT NULL,
  `deliveryStreet` varchar(64) NOT NULL DEFAULT '',
  `deliveryStreet2` varchar(64) NOT NULL DEFAULT '',
  `deliveryZipcode` varchar(64) NOT NULL DEFAULT '',
  `deliveryCity` varchar(64) NOT NULL DEFAULT '',
  `deliveryState` varchar(64) NOT NULL DEFAULT '',
  `orderType` varchar(64) NOT NULL DEFAULT '',
  `payType` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tbl_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;

INSERT INTO `tbl_order` (`id`, `id_customer`, `date`, `deliveryStreet`, `deliveryStreet2`, `deliveryZipcode`, `deliveryCity`, `deliveryState`, `orderType`, `payType`)
VALUES
	(2,1,'0000-00-00','a','a','a','a','a','1','2'),
	(3,1,'0000-00-00','1','1','1','1','1','1','1'),
	(4,1,'0000-00-00','a','a','a','a','a','0','0');

/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_orderDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_orderDetail`;

CREATE TABLE `tbl_orderDetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `tbl_orderdetail_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id`),
  CONSTRAINT `tbl_orderdetail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tbl_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbl_orderDetail` WRITE;
/*!40000 ALTER TABLE `tbl_orderDetail` DISABLE KEYS */;

INSERT INTO `tbl_orderDetail` (`id`, `id_order`, `id_product`, `quantity`)
VALUES
	(2,2,1,0),
	(3,2,3,0);

/*!40000 ALTER TABLE `tbl_orderDetail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_product`;

CREATE TABLE `tbl_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `size` varchar(64) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `type` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;

INSERT INTO `tbl_product` (`id`, `name`, `size`, `price`, `description`, `type`, `image`)
VALUES
	(1,'nike shoe','12',12,'Really cool',2,'4.png'),
	(2,'Adidas','12',200,'LOLOLOLOL',0,'5.jpg'),
	(3,'hat','12',34,'LOL\n',1,'1.jpeg'),
	(4,'watch','10',12,'lolol\n',3,'3.jpeg'),
	(5,'lap','11',122,'COOL\n',2,'2.jpeg');

/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tbl_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(256) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `createTime` date NOT NULL,
  `lastLogin` date DEFAULT NULL,
  `id_customer` int(11) unsigned NOT NULL,
  `activation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tbl_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;

INSERT INTO `tbl_user` (`id`, `name`, `password`, `email`, `createTime`, `lastLogin`, `id_customer`, `activation`)
VALUES
	(9,'pupid','pupid','pupid@gmail.com','0000-00-00','0000-00-00',1,NULL),
	(10,'cesarin','b03bed2de2bf7323ec0b95d7f16aedcdfca84f2d972ae21f8387dfd670786d7b','cesarin@gmail.com','0000-00-00','0000-00-00',5,0);

/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
