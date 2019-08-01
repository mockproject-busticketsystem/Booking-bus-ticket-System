-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 01, 2019 lúc 09:10 PM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookingbusticketsystem`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyendi`
--

CREATE TABLE `chuyendi` (
  `id` int(10) NOT NULL,
  `MaTuyen` varchar(20) NOT NULL,
  `NgayDi` date NOT NULL,
  `Gio` time NOT NULL,
  `DonGia` decimal(10,0) DEFAULT NULL,
  `BienSoXe` varchar(10) DEFAULT NULL,
  `SoGheTrong` int(11) DEFAULT NULL,
  `SoGheDat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ghe`
--

CREATE TABLE `ghe` (
  `Maghe` varchar(5) NOT NULL,
  `MaXe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `CMND` varchar(11) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `NgaySinh` date NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `Id` int(10) NOT NULL,
  `HoTen` varchar(30) NOT NULL,
  `NgaySinh` date NOT NULL,
  `SDT` varchar(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Chucvu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudatcho`
--

CREATE TABLE `phieudatcho` (
  `CMND` varchar(11) NOT NULL,
  `MaTuyen` varchar(20) NOT NULL,
  `NgayDi` date NOT NULL,
  `Gio` time NOT NULL,
  `Maghe` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `Email` varchar(50) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuyendi`
--

CREATE TABLE `tuyendi` (
  `Id` varchar(20) NOT NULL,
  `DiaDiemDi` varchar(30) NOT NULL,
  `DiaDienDen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vexe`
--

CREATE TABLE `vexe` (
  `CMND` varchar(11) NOT NULL,
  `IdChuyen` int(10) NOT NULL,
  `MaGhe` varchar(5) NOT NULL,
  `DonGia` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xe`
--

CREATE TABLE `xe` (
  `BienSo` varchar(10) NOT NULL,
  `TaiXe1` varchar(30) NOT NULL,
  `TaiXe2` varchar(30) NOT NULL,
  `SoGhe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chuyendi`
--
ALTER TABLE `chuyendi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MaTuyen` (`MaTuyen`),
  ADD KEY `BienSoXe` (`BienSoXe`);

--
-- Chỉ mục cho bảng `ghe`
--
ALTER TABLE `ghe`
  ADD PRIMARY KEY (`Maghe`,`MaXe`),
  ADD KEY `MaXe` (`MaXe`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`CMND`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `phieudatcho`
--
ALTER TABLE `phieudatcho`
  ADD PRIMARY KEY (`CMND`,`MaTuyen`,`NgayDi`,`Gio`,`Maghe`),
  ADD KEY `CMND` (`CMND`),
  ADD KEY `MaTuyen` (`MaTuyen`),
  ADD KEY `Maghe` (`Maghe`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `Email` (`Email`);

--
-- Chỉ mục cho bảng `tuyendi`
--
ALTER TABLE `tuyendi`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `vexe`
--
ALTER TABLE `vexe`
  ADD PRIMARY KEY (`CMND`,`IdChuyen`,`MaGhe`),
  ADD KEY `CMND` (`CMND`),
  ADD KEY `IdChuyen` (`IdChuyen`),
  ADD KEY `MaGhe` (`MaGhe`);

--
-- Chỉ mục cho bảng `xe`
--
ALTER TABLE `xe`
  ADD PRIMARY KEY (`BienSo`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chuyendi`
--
ALTER TABLE `chuyendi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chuyendi`
--
ALTER TABLE `chuyendi`
  ADD CONSTRAINT `Foreign_key_CD_TD` FOREIGN KEY (`MaTuyen`) REFERENCES `tuyendi` (`Id`),
  ADD CONSTRAINT `Foreign_key_CD_Xe` FOREIGN KEY (`BienSoXe`) REFERENCES `xe` (`BienSo`);

--
-- Các ràng buộc cho bảng `ghe`
--
ALTER TABLE `ghe`
  ADD CONSTRAINT `Foreign_key_Ghe_Xe` FOREIGN KEY (`MaXe`) REFERENCES `xe` (`BienSo`);

--
-- Các ràng buộc cho bảng `phieudatcho`
--
ALTER TABLE `phieudatcho`
  ADD CONSTRAINT `Foreign_key_PDC_Ghe` FOREIGN KEY (`Maghe`) REFERENCES `ghe` (`Maghe`),
  ADD CONSTRAINT `Foreign_key_PDC_KH` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`),
  ADD CONSTRAINT `Foreign_key_PDC_TD` FOREIGN KEY (`MaTuyen`) REFERENCES `tuyendi` (`Id`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `Foreign_key_Tk_KH` FOREIGN KEY (`Email`) REFERENCES `khachhang` (`Email`),
  ADD CONSTRAINT `Foreign_key_Tk_NV` FOREIGN KEY (`Email`) REFERENCES `nhanvien` (`Email`);

--
-- Các ràng buộc cho bảng `vexe`
--
ALTER TABLE `vexe`
  ADD CONSTRAINT `Foreign_key_CD_Ghe` FOREIGN KEY (`MaGhe`) REFERENCES `ghe` (`Maghe`),
  ADD CONSTRAINT `Foreign_key_VX_CD` FOREIGN KEY (`IdChuyen`) REFERENCES `chuyendi` (`id`),
  ADD CONSTRAINT `Foreign_key_VX_KH` FOREIGN KEY (`CMND`) REFERENCES `khachhang` (`CMND`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
