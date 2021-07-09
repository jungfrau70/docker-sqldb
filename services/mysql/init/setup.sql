DROP DATABASE IF EXISTS `INVESTAR`;
CREATE DATABASE IF NOT EXISTS `INVESTAR` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `INVESTAR`;

DROP TABLE IF EXISTS `company_info`;
CREATE TABLE IF NOT EXISTS company_info (
    code VARCHAR(20),
    company VARCHAR(80),
    industry VARCHAR(80),
    industryCode VARCHAR(10),
    last_update DATE,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `daily_price`;
CREATE TABLE IF NOT EXISTS daily_price (
    code VARCHAR(20),
    date DATE,
    open BIGINT(20),
    high BIGINT(20),
    low BIGINT(20),
    close BIGINT(20),
    diff BIGINT(20),
    volume BIGINT(20),
    PRIMARY KEY (code, date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @@global.sql_mode= ‘’;
SET GLOBAL local_infile = 1;

