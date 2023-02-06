/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.3.9-MariaDB : Database - gobogota
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gobogota` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gobogota`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catNombre` varchar(200) DEFAULT NULL,
  `catEstado` char(1) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_categorias_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`catNombre`,`catEstado`,`create_at`,`update_at`,`idioma_id`) values (1,'TOURS GRUPALES','A','2023-02-05 17:53:11','2023-02-05 17:53:11',1),(2,'GROUP TOURS','A','2023-02-05 17:53:11','2023-02-05 17:53:11',2),(3,'PASSEIOS EM GRUPO','A','2023-02-05 17:53:11','2023-02-05 17:53:11',3),(4,'TOURS EN BOGOTA','A','2023-02-05 17:53:11','2023-02-05 17:53:11',1),(5,'TOURS IN BOGOTA','A','2023-02-05 17:53:11','2023-02-05 17:53:11',2),(6,'PASSEIOS EM BOGOTÁ','A','2023-02-05 17:53:11','2023-02-05 17:53:11',3),(7,'OTROS DESTINOS','A','2023-02-05 17:53:11','2023-02-05 17:53:11',1),(8,'OTHER DESTINATIONS','A','2023-02-05 17:53:11','2023-02-05 17:53:11',2),(9,'OUTROS DESTINOS','A','2023-02-05 17:53:11','2023-02-05 17:53:11',3);

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciuCodigo` varchar(45) DEFAULT NULL,
  `ciuNombre` varchar(200) DEFAULT NULL,
  `ciuEstado` char(1) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`ciuCodigo`,`ciuNombre`,`ciuEstado`,`create_at`,`update_at`) values (1,'BQ','BARRANQUILLA','A','2023-02-05 18:04:13','2023-02-05 18:04:13'),(2,'BG','BOGOTA','A','2023-02-05 18:04:13','2023-02-05 18:04:13'),(3,'CT','CARTAGENA','A','2023-02-05 18:04:13','2023-02-05 18:04:13');

/*Table structure for table `concepto` */

DROP TABLE IF EXISTS `concepto`;

CREATE TABLE `concepto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `con_nombre` varchar(100) NOT NULL,
  `con_estado` char(1) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_concepto_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_concepto_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `concepto` */

/*Table structure for table `detalle_tours` */

DROP TABLE IF EXISTS `detalle_tours`;

CREATE TABLE `detalle_tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detTouNombre` varchar(200) NOT NULL,
  `detTouDescipcion` text DEFAULT NULL,
  `detTouIcon` varchar(100) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `tours_id` int(11) NOT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_tours_tours1_idx` (`tours_id`),
  KEY `fk_detalle_tours_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_detalle_tours_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_tours_tours1` FOREIGN KEY (`tours_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `detalle_tours` */

insert  into `detalle_tours`(`id`,`detTouNombre`,`detTouDescipcion`,`detTouIcon`,`create_at`,`update_at`,`tours_id`,`idioma_id`) values (1,'Availability','Monday to Sunday','far fa-calendar-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,2),(2,'Disponibilidad','De lunes a domingo','far fa-calendar-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,1),(3,'Disponibilidade','De segunda a domingo','far fa-calendar-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,3),(4,'Languages','SPN - ENG - POR','far fa-translate-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,2),(5,'Idiomas','SPN - ENG - POR','far fa-translate-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,1),(6,'línguas','SPN - ENG - POR','far fa-translate-alt','2023-02-05 18:25:25','2023-02-05 18:25:28',1,3),(7,'Duration','4h, 6h, 8,h or 10h','fas fa-hourglass-half','2023-02-05 18:25:25','2023-02-05 18:25:28',1,2),(8,'Duracion','4h, 6h, 8,h or 10h','fas fa-hourglass-half','2023-02-05 18:25:25','2023-02-05 18:25:28',1,1),(9,'Duração','4h, 6h, 8,h or 10h','fas fa-hourglass-half','2023-02-05 18:25:25','2023-02-05 18:25:28',1,3);

/*Table structure for table `detalles_multimedias` */

DROP TABLE IF EXISTS `detalles_multimedias`;

CREATE TABLE `detalles_multimedias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detMulRuta` varchar(200) NOT NULL,
  `detMulEstado` char(1) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `tours_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalles_multimedias_tours1_idx` (`tours_id`),
  CONSTRAINT `fk_detalles_multimedias_tours1` FOREIGN KEY (`tours_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalles_multimedias` */

/*Table structure for table `faq` */

DROP TABLE IF EXISTS `faq`;

CREATE TABLE `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_pregunta` varchar(200) NOT NULL,
  `faq_respuesta` text NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_faq_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_faq_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `faq` */

/*Table structure for table `idioma` */

DROP TABLE IF EXISTS `idioma`;

CREATE TABLE `idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idiNombre` varchar(100) NOT NULL,
  `idiSigla` varchar(5) DEFAULT NULL,
  `idiEstado` char(1) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `idioma` */

insert  into `idioma`(`id`,`idiNombre`,`idiSigla`,`idiEstado`,`create_at`,`update_at`) values (1,'ESPAÑOL','ESP','A','2023-02-05 17:51:00','2023-02-05 17:51:02'),(2,'INGLES','ENG','A','2023-02-05 17:51:00','2023-02-05 17:51:00'),(3,'PORTUGUES','PRT','A','2023-02-05 17:51:00','2023-02-05 17:51:00');

/*Table structure for table `lista_precios` */

DROP TABLE IF EXISTS `lista_precios`;

CREATE TABLE `lista_precios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lisRreCantidad` varchar(45) NOT NULL,
  `lisPre_valor` int(11) NOT NULL,
  `lisPreMoneda` varchar(10) NOT NULL,
  `lisPreEstado` char(1) NOT NULL,
  `lispreTiempo` varchar(200) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `tours_id` int(11) NOT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lista_precios_tours1_idx` (`tours_id`),
  KEY `fk_lista_precios_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_lista_precios_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_precios_tours1` FOREIGN KEY (`tours_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `lista_precios` */

insert  into `lista_precios`(`id`,`lisRreCantidad`,`lisPre_valor`,`lisPreMoneda`,`lisPreEstado`,`lispreTiempo`,`create_at`,`update_at`,`tours_id`,`idioma_id`) values (1,'1-2 Personas',80000,'COP','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1),(2,'1-2 People',20,'USD','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,2),(3,'1-2 Pessoas',20,'USD','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,3),(4,'3-5 Pessoas',150000,'COP','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1),(5,'3-5 People',35,'USD','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1),(6,'3-5 Pessoas',35,'USD','A','2 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1),(7,'1-2 Personas',145000,'COP','A','4 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1),(8,'3-5 Personas',315000,'COP','A','4 Horas','2023-02-05 18:34:26','2023-02-05 18:34:28',1,1);

/*Table structure for table `maestro_include_highlights` */

DROP TABLE IF EXISTS `maestro_include_highlights`;

CREATE TABLE `maestro_include_highlights` (
  `id` int(10) unsigned NOT NULL,
  `maeIncHig_titulo` varchar(100) NOT NULL,
  `maeIncHig_estado` char(1) NOT NULL,
  `maeIncHig_activo` char(1) NOT NULL,
  `tours_id` int(11) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `concepto_id` int(11) NOT NULL,
  `idioma_id` int(11) NOT NULL,
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_maestro_include_Highlights_tours1_idx` (`tours_id`),
  KEY `fk_maestro_include_Highlights_concepto1_idx` (`concepto_id`),
  KEY `fk_maestro_include_Highlights_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_maestro_include_Highlights_concepto1` FOREIGN KEY (`concepto_id`) REFERENCES `concepto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maestro_include_Highlights_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_maestro_include_Highlights_tours1` FOREIGN KEY (`tours_id`) REFERENCES `tours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `maestro_include_highlights` */

/*Table structure for table `tours` */

DROP TABLE IF EXISTS `tours`;

CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touNombre` varchar(200) NOT NULL,
  `tou_desc_corta` varchar(100) NOT NULL,
  `touDescripcion` text NOT NULL,
  `touEstado` varchar(45) NOT NULL,
  `ciudades_id` int(11) NOT NULL,
  `categorias_id` int(11) NOT NULL,
  `idioma_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tour_ciudades_idx` (`ciudades_id`),
  KEY `fk_tours_categorias1_idx` (`categorias_id`),
  KEY `fk_tours_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_tour_ciudades` FOREIGN KEY (`ciudades_id`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tours_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tours_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tours` */

insert  into `tours`(`id`,`touNombre`,`tou_desc_corta`,`touDescripcion`,`touEstado`,`ciudades_id`,`categorias_id`,`idioma_id`,`create_at`,`update_at`) values (1,'Bogotá nocturna','Vive una experiencia hasta el amanecer','Vive las mejores experiencias con tus amigos y disfruta de sitios iconicos en la capital hasta el amaneces bla bla bla ...','A',2,1,1,'2023-02-05 18:10:07','2023-02-05 18:10:07'),(2,'Sitios iconicos en bogota','Visita los sitios que marcaron nuestra historia','Desde el museo de oro hasta la catedral de sal, disfruta de las mejores experiencias guiadas bla bla bla ...','A',2,1,1,'2023-02-05 18:13:12','2023-02-05 18:13:12'),(3,'Night Bogotá','Live an experience until dawn','Live the best experiences with your friends and enjoy iconic sites in the capital until dawn bla bla bla ...','A',2,1,2,'2023-02-05 18:10:07','2023-02-05 18:10:07'),(4,'Noite Bogotá','Viva uma experiência até o amanhecer','Viva as melhores experiências com seus amigos e desfrute de locais icônicos da capital até o amanhecer bla bla bla ...','A',2,1,3,'2023-02-05 18:10:07','2023-02-05 18:10:07'),(5,'Iconic sites in Bogota','Visit the sites that marked our history','From the gold museum to the salt cathedral, enjoy the best guided experiences blah blah blah...','A',2,1,2,'2023-02-05 18:13:12','2023-02-05 18:13:12'),(6,'Locais icônicos em Bogotá','Visite os locais que marcaram a nossa história','Do museu do ouro à catedral do sal, desfrute das melhores experiências guiadas blá blá blá...','A',2,1,3,'2023-02-05 18:13:12','2023-02-05 18:13:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
