DROP DATABASE IF EXISTS `pythonDB`;
CREATE DATABASE IF NOT EXISTS `pythonDB` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pythonDB`;

DROP TABLE IF EXISTS `tbl_crawlingdata`;
CREATE TABLE IF NOT EXISTS `tbl_crawlingdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_keyword`;
CREATE TABLE IF NOT EXISTS `tbl_keyword` (
  `keyword` varchar(50) NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @@global.sql_mode= ‘’;

