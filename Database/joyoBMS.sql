/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.6.17 : Database - joyo_bms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`joyo_bms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `joyo_bms`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `typeid` int(9) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` text,
  `content` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_typeId` (`typeid`),
  CONSTRAINT `fk_typeId` FOREIGN KEY (`typeId`) REFERENCES `articletype` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`typeid`,`title`,`intro`,`content`,`date`) values 
(2,1,'写一篇来删','# 通过markdow显示的文章','# 通过markdow显示的文章','2017-08-04 11:39:56'),
(3,2,'通过新分类发布','通过新分类发布通过新分类发布通过新分类发布','通过新分类发布通过新分类发布通过新分类发布','2017-08-04 11:39:18');

/*Table structure for table `articletype` */

DROP TABLE IF EXISTS `articletype`;

CREATE TABLE `articletype` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `articletype` */

insert  into `articletype`(`id`,`typename`) values 
(1,'PHP'),
(2,'Java'),
(34,'新分类修改');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values 
(1,'wellch4n','well1995');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
