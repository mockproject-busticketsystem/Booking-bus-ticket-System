/*
SQLyog Enterprise - MySQL GUI v6.15
MySQL - 8.0.17 : Database - bookbus
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
  `GioDen` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MaTuyen` (`MaTuyen`),
  CONSTRAINT `Foreign_key_CD_TD` FOREIGN KEY (`MaTuyen`) REFERENCES `tuyendi` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `chuyendi` */

insert  into `chuyendi`(`id`,`MaTuyen`,`Gio`,`DonGia`,`GioDen`) values (1,'NT-DN','07:00:00','250','13:00:00'),(2,'HCM-VT','07:00:00','80','09:30:00'),(3,'HCM-NT','17:00:00','350','03:00:00'),(4,'HCM-DL','07:00:00','250','15:00:00'),(5,'HCM-DL','09:00:00','250','17:00:00'),(6,'HCM-VT','08:00:00','80','10:30:00'),(7,'HCM-VT','09:00:00','80','11:30:00'),(8,'HCM-NT','18:00:00','350','03:00:00'),(9,'BD-BD','15:00:00','280','03:00:00'),(10,'DL-PY','13:00:00','200','17:00:00'),(11,'PY-QN','08:00:00','380','14:00:00'),(12,'NT-DN','14:00:00','220','01:00:00'),(13,'PY-VT','09:00:00','200','16:30:00'),(14,'PY-HCM','19:30:00',NULL,'05:30:00');

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

insert  into `khachhang`(`CMND`,`HoTen`,`SDT`,`Email`) values ('220634528','Tran Nguyen Hung ','0937756453','HungBc@email.com'),('220696835','Nguyen Le Anh Tuyet','0968522725','TuyetLe_bd@email.com'),('221405115','Pham Hoai phuc Hanh','0945041523','PhucHanh123@email.com'),('221429241','Truong The Vinh','01258641456','Vinhbest@email.com'),('221451386','Vo Dang','01668559360','DangBH@eamil.com'),('221458413','Tran Thanh Tuan','0975622418','TuanTT@email.com'),('221460248','Nguyen The Toan','0938585593','ToanVang@email.com'),('221460414','Nguyen Quoc Dong','0343625734','DongNguy@email.com'),('221460418','Nguyen Thi Kim Ngan','0978542356','NganLun@email.com'),('221460425','Đoan Kim Ngan ','01643625764','NganBH@email.com'),('221460489','Vo Thi Anh Tuyet','01298554789','TuyetVo1806@email.com'),('221460541','Bui Quoc Thanh ','01258318418','Thanh0440@email.com'),('221462795','Nguyen Trinh','012345689','trinhnguyen@email.com'),('221479351','Truong The Vi','0985621424','ViNgao123@email.com'),('221486059','Bui Nguyen Le Tuan Anh','0978565212','TuanAnh79@email.com'),('223441565','Nguyen Thi Bich ngoc ','01652532475','NgocNTB_1985@email.com'),('223586271','Thai Thi Thanh Hương','0988655240','HuongTTT@email.com'),('223596132','Tran TRong Hao','0968342145','TTHao_Sn@email.com'),('223596852','Tran Ngoc Le ','0985631221','LeNgoc@email.com'),('223641289','Nguyen Chi Thien','01696512482','ThienCNTT_1997@email.com'),('223648855','Le Thi Ngu','098214422','NguT44@email.com'),('223648962','Le Thi Lan','01685252145','LanLe479@email.com'),('223985674','Le Van Duy','01686548524','DuyDuy@email.com'),('224148023','Dinh Thi Ly Ly','0908130901','LyLy19@email.com'),('224614534','Vo Nguyen Ngan Thuy','0965433782','ThuyNganVo@email.com'),('224628952','Nguyen Thai Binh ','0976852582','BinhThai_sg@email.com'),('225355785','Le Tan Tien','0982504512','TanTien_L@email.com'),('225668958','Huynh Trung Tin','01685272824','TinAPT@email.com'),('226053248','Nguyen Thi Mong Vy ','0978654245','VyNg1998@email.com'),('226053482','Bach Van Nhon','0961985726','NhonDT_PY@email.com'),('226425874','Dang Tri Thong ','01656352892','TTTri_2000@email.com'),('226485225','Le Thi Ha ','01675624545','HaMN_py@email.com'),('226489604','Dao Nguyen Khoi','01685045524','KhoiNguyen_Gv@email.com'),('226755524','Tran Xuan My','0128252414','HanThienDi@email.com'),('226785485','Le Duc Tan','0976531422','TanBinhDuong@email.com'),('226842445','Do Thi Binh ','0898652142','BinhDT#@email.com'),('226845221','Nguyen Tan ','0963551114','TanN243@email.com'),('226895687','Duong Duy Hung ','0986224712','HungDD_na@email.com'),('228647152','Tran Le Bich Tin ','01685624852','TinTLB_1998@email.com'),('229678534','Nguyen Khoa','0976354125','KhoaNguyen602@email.com'),('229864247','Le Viet Vinh','01689657321','VinhViet_dhspkt@email.com');

/*Table structure for table `nhanvien` */

DROP TABLE IF EXISTS `nhanvien`;

CREATE TABLE `nhanvien` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ChucVu` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `nhanvien` */

insert  into `nhanvien`(`Id`,`HoTen`,`SDT`,`Email`,`ChucVu`) values (1,'Nguyen Huyen','01234567893','nguyenthidieuhuyenpy@gmail.com',''),(2,'Truong Thai Tuan','01289782562','TuanTT_1998@gmail.com',''),(3,'Nguyen Duc Hau','098635328','HauNguyen-1998@gmail.com',''),(4,'Dinh Van Dung','0938585593','dungdinh870@gmail.com',''),(5,'Duong Thi Hoai Phuong','01649685239','phuongduong_1998@gmail.com',''),(6,'Nguyen Huu Toan','01689655235','ToanNG_1998@gmail.com','');

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

insert  into `taikhoan`(`Email`,`Pass`,`Role`) values ('BinhDT#@email.com','123456789','KhachHang'),('BinhThai_sg@email.com','123456789','KhachHang'),('DangBH@eamil.com','123456789','KhachHang'),('DongNguy@email.com','123456789','KhachHang'),('dungdinh870@gmail.com','123456789','NhanVien'),('DuyDuy@email.com','123456789','KhachHang'),('HaMN_py@email.com','123456789','KhachHang'),('HanThienDi@email.com','123456789','KhachHang'),('HauNguyen-1998@gmail.com','123456789','NhanVien'),('HungBc@email.com','123456789','KhachHang'),('HungDD_na@email.com','123456789','KhachHang'),('HuongTTT@email.com','123456789','KhachHang'),('KhoaNguyen602@email.com','123456789','KhachHang'),('KhoiNguyen_Gv@email.com','123456789','KhachHang'),('LanLe479@email.com','123456789','KhachHang'),('LeNgoc@email.com','123456789','KhachHang'),('LyLy19@email.com','123456789','KhachHang'),('NganLun@email.com','123456789','KhachHang'),('NgocNTB_1985@email.com','123456789','KhachHang'),('NguT44@email.com','123456789','KhachHang'),('nguyenthidieuhuyenpy@gmail.com','123456789','nhanvien'),('NhonDT_PY@email.com','123456789','KhachHang'),('PhucHanh123@email.com','123456789','KhachHang'),('phuongduong_1998@gmail.com','123456789','NhanVien'),('TanBinhDuong@email.com','123456789','KhachHang'),('TanN243@email.com','123456789','KhachHang'),('TanTien_L@email.com','123456789','KhachHang'),('Thanh0440@email.com','123456789','KhachHang'),('ThienCNTT_1997@email.com','123456789','KhachHang'),('ThuyNganVo@email.com','123456789','KhachHang'),('TinAPT@email.com','123456789','KhachHang'),('TinTLB_1998@email.com','123456789','KhachHang'),('ToanNG_1998@gmail.com','123456789','NhanVien'),('ToanVang@email.com','123456789','KhachHang'),('trinhnguyen@email.com','123456789','khachhang'),('TTHao_Sn@email.com','123456789','KhachHang'),('TTTri_2000@email.com','123456789','KhachHang'),('TuanAnh79@email.com','123456789','KhachHang'),('TuanTT@email.com','123456789','KhachHang'),('TuanTT_1998@gmail.com','123456789','NhanVien'),('TuyetLe_bd@email.com','123456789','KhachHang'),('TuyetVo1806@email.com','123456789','KhachHang'),('ViNgao123@email.com','123456789','KhachHang'),('Vinhbest@email.com','123456789','KhachHang'),('VinhViet_dhspkt@email.com','123456789','KhachHang'),('VyNg1998@email.com','123456789','KhachHang');

/*Table structure for table `tuyendi` */

DROP TABLE IF EXISTS `tuyendi`;

CREATE TABLE `tuyendi` (
  `Id` varchar(20) NOT NULL,
  `DiaDiemDi` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaDiemDen` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tuyendi` */

insert  into `tuyendi`(`Id`,`DiaDiemDi`,`DiaDiemDen`) values ('BD-BD','Binh Dinh ','Binh Duong'),('BD-NT','Binh Dinh ','Nha Trang '),('DL-HCM','Da Lat','Ho Chi Minh'),('DL-PY','DA Lat ','Phu Yen '),('HCM-BD','Ho Chi Minh ','Binh Dinh '),('HCM-CM','Ho Chi Minh ','Ca Mau'),('HCM-CR','Ho Chi Minh ','Cam Ranh '),('HCM-DL','Ho Chi Minh','Da Lat'),('HCM-NT','Ho Chi Minh','Nha Trang'),('HCM-VT','Ho Chi Minh','Vung Tau'),('NT-DN','Nha Trang','Da Nang'),('NT-HCM','Nha Trang','Ho Chi Minh'),('NT-TV','Nha Trang ','TRa Vinh '),('PY-HCM','Phu Yen ','Ho Chi Minh '),('PY-QN ','Phu Yen ','Quang Ngai '),('PY-TG','Phu Yen ','Tien Giang'),('PY-VT','Phu Yen ','Vung Tau '),('VT-HCM','Vung Tau','Ho Chi Minh');

/*Table structure for table `vexe` */

DROP TABLE IF EXISTS `vexe`;

CREATE TABLE `vexe` (
  `CMND` varchar(11) NOT NULL,
  `IdChuyen` int(10) NOT NULL,
  `NgayDi` date NOT NULL,
  `HangDoi` varchar(5) NOT NULL,
  `MaGhe` varchar(5) NOT NULL,
  `DonGia` decimal(10,0) NOT NULL,
  `NgayGioDat` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CMND`,`IdChuyen`,`HangDoi`,`MaGhe`),
  KEY `CMND` (`CMND`),
  KEY `IdChuyen` (`IdChuyen`),
  CONSTRAINT `Foreign_key_VX_CD` FOREIGN KEY (`IdChuyen`) REFERENCES `chuyendi` (`id`),
  CONSTRAINT `Foreign_key_VX_KH` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vexe` */

insert  into `vexe`(`CMND`,`IdChuyen`,`NgayDi`,`HangDoi`,`MaGhe`,`DonGia`,`NgayGioDat`,`status`) values ('221405115',14,'2019-08-16','HCM1','A1','250','2019-08-15 16:30:00',0),('221458413',14,'2019-08-17','HCM','A9','250','2019-08-17 08:00:00',1),('221460248',10,'2019-08-22','DL','B1','180','2019-08-20 16:00:00',0),('221460414',8,'2019-08-29','HCM1','B5','200','2019-08-22 08:00:00',0),('221460418',14,'2019-08-25','PY','C7','250','2019-08-16 16:20:00',0),('221462795',1,'2019-08-18','NT1','A50','250','2019-08-13 16:38:23',1),('221462795',3,'2019-08-19','HCM1','A7','350','2019-08-12 16:30:30',1),('223985674',2,'2019-08-21','HCM1','A3','170','2019-08-19 16:20:00',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
