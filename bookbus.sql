/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 5.7.25-log : Database - bookbus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `bookbus`;

USE `bookbus`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `chuyendi` */

DROP TABLE IF EXISTS `chuyendi`;

CREATE TABLE `chuyendi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MaTuyen` varchar(20) NOT NULL,
  `Gio` time NOT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MaTuyen` (`MaTuyen`),
  CONSTRAINT `Foreign_key_CD_TD` FOREIGN KEY (`MaTuyen`) REFERENCES `tuyendi` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `chuyendi` */

LOCK TABLES `chuyendi` WRITE;

insert  into `chuyendi`(`id`,`MaTuyen`,`Gio`,`DonGia`) values (1,'HCM-HN','07:00:00','900'),(2,'HCM-HN','07:30:00','900'),(3,'HCM-HN','09:00:00','900'),(4,'HCM-HN','14:00:00','900'),(5,'HCM-VT','05:00:00','70'),(6,'HCM-VT','07:00:00','70');

UNLOCK TABLES;

/*Table structure for table `khachhang` */

DROP TABLE IF EXISTS `khachhang`;

CREATE TABLE `khachhang` (
  `CMND` varchar(11) NOT NULL,
  `HoTen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `Email` varchar(30) NOT NULL,
  PRIMARY KEY (`CMND`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `khachhang` */

LOCK TABLES `khachhang` WRITE;

insert  into `khachhang`(`CMND`,`HoTen`,`SDT`,`Email`) values ('1116646','ggjhhgj','44541','huyet@gmail.com'),('12121212','Nguyen Thi Dieu Huyen','212121212','fgfgf@gmail.com'),('1223425456','fsaag','423121','rty@gmail.com'),('12324','ewweg','1231','ddsgf@gmail.com'),('1234','fhgfgfjfjfjfh','1234','dsgfdis@gmail.com'),('123456','fjsdfgd','123456','twq@gmail.com'),('123456789','ggjhjfj','12345678','hfgffu@gmail.com'),('13166','gertrh','1465646','Huyenj@gmail.com'),('13323446478','hsdfhfdj','0122346797','huy@gmail.com'),('133443534','huyjdfjsd','0123456','dgsiufd@gmail.com'),('2145678','á»«ddwwyge','456123','huye@gmail.com'),('21457963','huyen','123','huyen56@gmail.com'),('2214567879','fsdjjksdj','01234','dsgsgdsa@gmail.com'),('221462795','Nguyen Thi Dieu Trinh','012345689','trinhnguyen@email.com'),('2221666646','dfefhio','2155454','bsasg@gmail.com'),('2231779','hhwhuhw','123','huyefwho@gmail.com'),('3145789','vvjj','0123456789','ngygy@gmail.com'),('3311131313','hfjhfhdjkh','012244469','huyenwe@gmail.com'),('45656646','huyent','012345','yter@gmail.com'),('56898974','huyen','4666','Huy3n@gmail.com'),('5692958','hfhfdihuhger','123','dgsds@gmail.com'),('78894454645','huyen','0123456','huyen@gmail.com');

UNLOCK TABLES;

/*Table structure for table `nhanvien` */

DROP TABLE IF EXISTS `nhanvien`;

CREATE TABLE `nhanvien` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Chucvu` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `nhanvien` */

LOCK TABLES `nhanvien` WRITE;

insert  into `nhanvien`(`Id`,`HoTen`,`SDT`,`Email`,`Chucvu`) values (1,'Nguyen Huyen','0123456789','nguyenthidieuhuyenpy@gmail.com','Ticketseller');

UNLOCK TABLES;

/*Table structure for table `taikhoan` */

DROP TABLE IF EXISTS `taikhoan`;

CREATE TABLE `taikhoan` (
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `taikhoan` */

LOCK TABLES `taikhoan` WRITE;

insert  into `taikhoan`(`Email`,`Pass`,`Role`) values ('bsasg@gmail.com','123','khachhang'),('ddsgf@gmail.com','123','khachhang'),('dgsds@gmail.com','123','khachhang'),('dgsiufd@gmail.com','12345','khachhang'),('dsgfdis@gmail.com','123','khachhang'),('dsgsgdsa@gmail.com','123','khachhang'),('fgfgf@gmail.com','123456789','khachhang'),('hfgffu@gmail.com','123','khachhang'),('Huy3n@gmail.com','123456','khachhang'),('huy@gmail.com','123','khachhang'),('huye@gmail.com','123456','khachhang'),('huyefwho@gmail.com','123','khachhang'),('huyen56@gmail.com','123','khachhang'),('huyen@gmail.com','123456','khachhang'),('Huyenj@gmail.com','123','khachhang'),('huyenwe@gmail.com','123','khachhang'),('huyet@gmail.com','123456','khachhang'),('nguyenthidieuhuyenpy@gmail.com','123456789','nhanvien'),('ngygy@gmail.com','123','khachhang'),('rty@gmail.com','123','khachhang'),('trinhnguyen@email.com','1234','khachhang'),('twq@gmail.com','123','khachhang'),('yter@gmail.com','123456','khachhang');

UNLOCK TABLES;

/*Table structure for table `tuyendi` */

DROP TABLE IF EXISTS `tuyendi`;

CREATE TABLE `tuyendi` (
  `Id` varchar(20) NOT NULL,
  `DiaDiemDi` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaDiemDen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tuyendi` */

LOCK TABLES `tuyendi` WRITE;

insert  into `tuyendi`(`Id`,`DiaDiemDi`,`DiaDiemDen`) values ('HCM-HN','Ho Chi Minh','Ha Noi'),('HCM-VT','Ho Chi Minh','Vung Tau'),('NT-HCM','Nha Trang','Ho Chi Minh'),('VT-HCM','Vung Tau','Ho Chi Minh');

UNLOCK TABLES;

/*Table structure for table `vexe` */

DROP TABLE IF EXISTS `vexe`;

CREATE TABLE `vexe` (
  `CMND` varchar(11) NOT NULL,
  `IdChuyen` int(10) NOT NULL,
  `NgayDi` date NOT NULL,
  `HangDoi` varchar(5) NOT NULL,
  `MaGhe` varchar(5) NOT NULL,
  `DonGia` decimal(10,0) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`CMND`,`IdChuyen`,`HangDoi`,`MaGhe`),
  KEY `CMND` (`CMND`),
  KEY `IdChuyen` (`IdChuyen`),
  CONSTRAINT `Foreign_key_VX_CD` FOREIGN KEY (`IdChuyen`) REFERENCES `chuyendi` (`id`),
  CONSTRAINT `Foreign_key_VX_KH` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vexe` */

LOCK TABLES `vexe` WRITE;

insert  into `vexe`(`CMND`,`IdChuyen`,`NgayDi`,`HangDoi`,`MaGhe`,`DonGia`,`status`) values ('12121212',1,'2019-08-15','HCM1','A3','900',''),('12121212',2,'2019-08-13','HCM2','A5','900','');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
