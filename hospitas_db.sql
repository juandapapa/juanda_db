/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.3.13-MariaDB : Database - hospital_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hospital_db`;

/*Table structure for table `dokter` */

DROP TABLE IF EXISTS `dokter`;

CREATE TABLE `dokter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(64) NOT NULL,
  `spesialis` varchar(64) NOT NULL,
  `jenis_kelamin` char(12) DEFAULT NULL,
  `no_telepon` varchar(12) NOT NULL,
  `alamat` varchar(164) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `dokter` */

insert  into `dokter`(`id`,`nama`,`spesialis`,`jenis_kelamin`,`no_telepon`,`alamat`) values 
(1,'Juanda Pakpahan','hati','L','082466905701','Berangir'),
(3,'Juanda GG','THT','P','082366905744','Siantar'),
(4,'Juanda Antonius','Bagian dalam','P','082366905759','jakarta'),
(5,'Juanda Mantap','Jantung','P','082366905750','Bandung'),
(6,'Juanda Gop','Sakit Hati','L','082344580988',''),
(7,'Hohop Manullang','Sakit Hati','L','082466899001','Joggakarta'),
(9,'Juanda Gob','Sakit Hati','L','082466899001','Joggakarta');

/*Table structure for table `pasien` */

DROP TABLE IF EXISTS `pasien`;

CREATE TABLE `pasien` (
  `no_rekam_medis` int(12) NOT NULL AUTO_INCREMENT,
  `nama` varchar(64) NOT NULL,
  `jenis_kelamin` char(12) NOT NULL,
  `usia` int(2) NOT NULL,
  `agama` varchar(64) NOT NULL,
  `pekerjaan` varchar(64) NOT NULL,
  `alamat` varchar(164) NOT NULL,
  `golongan_darah` char(2) NOT NULL,
  `no_telepon` char(14) NOT NULL,
  PRIMARY KEY (`no_rekam_medis`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `pasien` */

insert  into `pasien`(`no_rekam_medis`,`nama`,`jenis_kelamin`,`usia`,`agama`,`pekerjaan`,`alamat`,`golongan_darah`,`no_telepon`) values 
(22,' Ruth','Famale',50,'Kristiani','Guru Biologi','Rantoprapat','O','082800112301'),
(23,'Juanda Antonius Pakpahan','P',20,'Kristiani','System Analis','Rantoprapat','O','082800112301');

/*Table structure for table `rawat_inap` */

DROP TABLE IF EXISTS `rawat_inap`;

CREATE TABLE `rawat_inap` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(12) NOT NULL,
  `id_dokter` int(12) NOT NULL,
  `tanggal_masuk` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tanggal_keluar` datetime NOT NULL,
  `diagnosa` varchar(64) NOT NULL,
  `kode_ruangan` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ID_Pasien` (`id_pasien`),
  KEY `ID_Dokter` (`id_dokter`),
  CONSTRAINT `ID_Dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`),
  CONSTRAINT `ID_Pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`no_rekam_medis`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `rawat_inap` */

insert  into `rawat_inap`(`id`,`id_pasien`,`id_dokter`,`tanggal_masuk`,`tanggal_keluar`,`diagnosa`,`kode_ruangan`) values 
(1,23,9,'2020-01-16 12:45:32','2020-09-12 00:00:00','Sakit Hati','A11'),
(4,23,1,'2020-01-18 04:42:43','2020-03-10 00:00:00','Sakit Perut','A15');

/*Table structure for table `rawat_jalan` */

DROP TABLE IF EXISTS `rawat_jalan`;

CREATE TABLE `rawat_jalan` (
  `no_antri` int(12) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(12) NOT NULL,
  `id_dokter` int(12) NOT NULL,
  `tgl_kunjungan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `poliklinik` varchar(64) NOT NULL,
  `diagnosia` varchar(64) NOT NULL,
  `penanganan` varchar(164) NOT NULL,
  `pembayaran` int(164) NOT NULL,
  PRIMARY KEY (`no_antri`),
  KEY `ID_P` (`id_pasien`),
  KEY `ID_D` (`id_dokter`),
  CONSTRAINT `ID_D` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`),
  CONSTRAINT `ID_P` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`no_rekam_medis`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `rawat_jalan` */

insert  into `rawat_jalan`(`no_antri`,`id_pasien`,`id_dokter`,`tgl_kunjungan`,`poliklinik`,`diagnosia`,`penanganan`,`pembayaran`) values 
(1,23,5,'2020-01-18 04:50:02','Rumah Sakit Juanda','Sakit Jiwa','Menggunakan Obat herbal',2000000000);

/*Table structure for table `ruangan` */

DROP TABLE IF EXISTS `ruangan`;

CREATE TABLE `ruangan` (
  `kode` varchar(12) NOT NULL,
  `klasifikasi` varchar(64) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ruangan` */

insert  into `ruangan`(`kode`,`klasifikasi`) values 
('A11','Ruangan Siti'),
('A12','Ruanga Mayat'),
('A13','Bangke'),
('A14','Ruang Perawat'),
('A15','Ruanga Tidur');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
