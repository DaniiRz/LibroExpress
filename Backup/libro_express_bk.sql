-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: libro_express
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_clientes` (
  `id_cliente` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES ('3abdf100-d693-11ee-9874-a8a159550bb4','John Doe','johndoe@example.com','1234567890'),('3abe448a-d693-11ee-9874-a8a159550bb4','Jane Smith','janesmith@example.com','9876543210'),('3abea3bd-d693-11ee-9874-a8a159550bb4','Michael Johnson','michaeljohnson@example.com','5551234567'),('3abef14d-d693-11ee-9874-a8a159550bb4','Emily Davis','emilydavis@example.com','7894561230'),('3abf3dae-d693-11ee-9874-a8a159550bb4','David Wilson','davidwilson@example.com','3216549870'),('3abf7d71-d693-11ee-9874-a8a159550bb4','Jessica Thompson','jessicathompson@example.com','9998887776'),('3abfbebb-d693-11ee-9874-a8a159550bb4','Daniel Garcia','danielgarcia@example.com','4445556667'),('3ac00215-d693-11ee-9874-a8a159550bb4','Sophia Rodriguez','sophiarodriguez@example.com','2223334445'),('3ac04e13-d693-11ee-9874-a8a159550bb4','Matthew Martinez','matthewmartinez@example.com','1112223334'),('3ac0a8f6-d693-11ee-9874-a8a159550bb4','Olivia Hernandez','oliviahernandez@example.com','7778889991'),('3ac0eb4e-d693-11ee-9874-a8a159550bb4','Andrew Lopez','andrewlopez@example.com','6665554442'),('3ac14398-d693-11ee-9874-a8a159550bb4','Isabella Gonzalez','isabellagonzalez@example.com','8889990003'),('3ac188c4-d693-11ee-9874-a8a159550bb4','Ethan Perez','ethanperez@example.com','4443332221'),('3ac1df79-d693-11ee-9874-a8a159550bb4','Ava Torres','avatorres@example.com','6667778889'),('3ac68088-d693-11ee-9874-a8a159550bb4','James Flores','jamesflores@example.com','1119998887');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_prestamos`
--

DROP TABLE IF EXISTS `tb_detalles_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_detalles_prestamos` (
  `id_detalle_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_prestamo` varchar(36) NOT NULL,
  `id_libro` varchar(36) NOT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  KEY `fk_detalle_prestamo` (`id_prestamo`),
  KEY `fk_detalle_libro` (`id_libro`),
  CONSTRAINT `fk_detalle_libro` FOREIGN KEY (`id_libro`) REFERENCES `tb_libros` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `tb_prestamos` (`id_prestamo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_prestamos`
--

LOCK TABLES `tb_detalles_prestamos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_prestamos` DISABLE KEYS */;
INSERT INTO `tb_detalles_prestamos` VALUES ('3ade5e93-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad31dad-d693-11ee-9874-a8a159550bb4'),('3adeb160-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad3c032-d693-11ee-9874-a8a159550bb4'),('3adf251a-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad4c275-d693-11ee-9874-a8a159550bb4'),('3adf6d73-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad5c4d3-d693-11ee-9874-a8a159550bb4'),('3adfb60e-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3adc44d4-d693-11ee-9874-a8a159550bb4'),('3ae0015d-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3adc87c4-d693-11ee-9874-a8a159550bb4'),('3ae051bc-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3add192f-d693-11ee-9874-a8a159550bb4'),('3ae09dc8-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3adcd26c-d693-11ee-9874-a8a159550bb4'),('3ae0e3ec-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3add5e90-d693-11ee-9874-a8a159550bb4'),('3ae12dd8-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad3734e-d693-11ee-9874-a8a159550bb4'),('3ae18152-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad40e9c-d693-11ee-9874-a8a159550bb4'),('3ae1d0b2-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad51078-d693-11ee-9874-a8a159550bb4'),('3ae21a1a-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad56ddb-d693-11ee-9874-a8a159550bb4'),('3ae25dc8-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3ad617ab-d693-11ee-9874-a8a159550bb4'),('3ae2a41b-d693-11ee-9874-a8a159550bb4','3ac7a05b-d693-11ee-9874-a8a159550bb4','3add5e90-d693-11ee-9874-a8a159550bb4');
/*!40000 ALTER TABLE `tb_detalles_prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_estado_libro
AFTER INSERT ON tb_detalles_prestamos
FOR EACH ROW
BEGIN
    UPDATE tb_libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_generos_libros`
--

DROP TABLE IF EXISTS `tb_generos_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_generos_libros` (
  `id_genero_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_genero_libro` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_generos_libros`
--

LOCK TABLES `tb_generos_libros` WRITE;
/*!40000 ALTER TABLE `tb_generos_libros` DISABLE KEYS */;
INSERT INTO `tb_generos_libros` VALUES ('3acda9aa-d693-11ee-9874-a8a159550bb4','Ciencia ficción'),('3acdfa87-d693-11ee-9874-a8a159550bb4','Romance'),('3ace46a4-d693-11ee-9874-a8a159550bb4','Misterio'),('3aceb50c-d693-11ee-9874-a8a159550bb4','Aventura'),('3acf04b2-d693-11ee-9874-a8a159550bb4','Fantasía'),('3acf4b65-d693-11ee-9874-a8a159550bb4','Drama'),('3acf9e68-d693-11ee-9874-a8a159550bb4','Thriller'),('3acff2ab-d693-11ee-9874-a8a159550bb4','Suspenso'),('3ad0487d-d693-11ee-9874-a8a159550bb4','Comedia'),('3ad095d7-d693-11ee-9874-a8a159550bb4','Histórico'),('3ad0e2c7-d693-11ee-9874-a8a159550bb4','Biografía'),('3ad12c6e-d693-11ee-9874-a8a159550bb4','No ficción'),('3ad18683-d693-11ee-9874-a8a159550bb4','Poesía'),('3ad1d6f1-d693-11ee-9874-a8a159550bb4','Terror'),('3ad22460-d693-11ee-9874-a8a159550bb4','Autoayuda');
/*!40000 ALTER TABLE `tb_generos_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_libros`
--

DROP TABLE IF EXISTS `tb_libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_libros` (
  `id_libro` varchar(36) NOT NULL DEFAULT uuid(),
  `titulo_libro` varchar(50) NOT NULL,
  `anio_publicacion` int(11) NOT NULL,
  `id_genero_libro` varchar(36) NOT NULL,
  `estado` enum('Disponible','Prestado') NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_libro_genero` (`id_genero_libro`),
  CONSTRAINT `fk_libro_genero` FOREIGN KEY (`id_genero_libro`) REFERENCES `tb_generos_libros` (`id_genero_libro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_libros`
--

LOCK TABLES `tb_libros` WRITE;
/*!40000 ALTER TABLE `tb_libros` DISABLE KEYS */;
INSERT INTO `tb_libros` VALUES ('3ad31dad-d693-11ee-9874-a8a159550bb4','1984',1949,'3acda9aa-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad3734e-d693-11ee-9874-a8a159550bb4','Orgullo y prejuicio',1813,'3acdfa87-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad3c032-d693-11ee-9874-a8a159550bb4','El código Da Vinci',2003,'3ace46a4-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad40e9c-d693-11ee-9874-a8a159550bb4','La odisea',0,'3aceb50c-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad476c6-d693-11ee-9874-a8a159550bb4','El señor de los anillos',1954,'3acf04b2-d693-11ee-9874-a8a159550bb4','Disponible'),('3ad4c275-d693-11ee-9874-a8a159550bb4','Romeo y Julieta',1597,'3acf4b65-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad51078-d693-11ee-9874-a8a159550bb4','El silencio de los corderos',1988,'3acf9e68-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad56ddb-d693-11ee-9874-a8a159550bb4','Los juegos del hambre',2008,'3aceb50c-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad5c4d3-d693-11ee-9874-a8a159550bb4','El gran Gatsby',1925,'3acf4b65-d693-11ee-9874-a8a159550bb4','Prestado'),('3ad617ab-d693-11ee-9874-a8a159550bb4','Crónica de una muerte anunciada',1981,'3ace46a4-d693-11ee-9874-a8a159550bb4','Prestado'),('3adc44d4-d693-11ee-9874-a8a159550bb4','Cien años de soledad',1967,'3acf4b65-d693-11ee-9874-a8a159550bb4','Prestado'),('3adc87c4-d693-11ee-9874-a8a159550bb4','El principito',1943,'3acf04b2-d693-11ee-9874-a8a159550bb4','Prestado'),('3adcd26c-d693-11ee-9874-a8a159550bb4','Drácula',1897,'3ad1d6f1-d693-11ee-9874-a8a159550bb4','Prestado'),('3add192f-d693-11ee-9874-a8a159550bb4','El alquimista',1988,'3acf04b2-d693-11ee-9874-a8a159550bb4','Prestado'),('3add5e90-d693-11ee-9874-a8a159550bb4','El retrato de Dorian Gray',1890,'3acf4b65-d693-11ee-9874-a8a159550bb4','Prestado');
/*!40000 ALTER TABLE `tb_libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prestamos`
--

DROP TABLE IF EXISTS `tb_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prestamos` (
  `id_prestamo` varchar(36) NOT NULL DEFAULT uuid(),
  `id_cliente` varchar(36) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_cliente` (`id_cliente`),
  CONSTRAINT `fk_prestamo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prestamos`
--

LOCK TABLES `tb_prestamos` WRITE;
/*!40000 ALTER TABLE `tb_prestamos` DISABLE KEYS */;
INSERT INTO `tb_prestamos` VALUES ('3ac7a05b-d693-11ee-9874-a8a159550bb4','3abdf100-d693-11ee-9874-a8a159550bb4','2024-02-01','2024-03-01','Activo'),('3ac7fb1e-d693-11ee-9874-a8a159550bb4','3abe448a-d693-11ee-9874-a8a159550bb4','2024-02-15','2024-03-15','Activo'),('3ac850e9-d693-11ee-9874-a8a159550bb4','3abea3bd-d693-11ee-9874-a8a159550bb4','2024-03-01','2024-04-01','Activo'),('3ac89556-d693-11ee-9874-a8a159550bb4','3abef14d-d693-11ee-9874-a8a159550bb4','2024-02-10','2024-03-10','Activo'),('3ac8e011-d693-11ee-9874-a8a159550bb4','3abf3dae-d693-11ee-9874-a8a159550bb4','2024-02-20','2024-03-20','Activo'),('3ac93905-d693-11ee-9874-a8a159550bb4','3abf7d71-d693-11ee-9874-a8a159550bb4','2024-02-05','2024-03-05','Activo'),('3ac97bf0-d693-11ee-9874-a8a159550bb4','3abfbebb-d693-11ee-9874-a8a159550bb4','2024-02-25','2024-03-25','Activo'),('3ac9c796-d693-11ee-9874-a8a159550bb4','3ac00215-d693-11ee-9874-a8a159550bb4','2024-02-08','2024-03-08','Activo'),('3aca09e0-d693-11ee-9874-a8a159550bb4','3ac04e13-d693-11ee-9874-a8a159550bb4','2024-02-18','2024-03-18','Activo'),('3aca644a-d693-11ee-9874-a8a159550bb4','3ac0a8f6-d693-11ee-9874-a8a159550bb4','2024-02-03','2024-03-03','Activo'),('3acac0e0-d693-11ee-9874-a8a159550bb4','3ac0eb4e-d693-11ee-9874-a8a159550bb4','2024-02-28','2024-03-28','Activo'),('3acb267e-d693-11ee-9874-a8a159550bb4','3ac14398-d693-11ee-9874-a8a159550bb4','2024-02-12','2024-03-12','Activo'),('3acb957d-d693-11ee-9874-a8a159550bb4','3ac188c4-d693-11ee-9874-a8a159550bb4','2024-02-07','2024-03-07','Activo'),('3acbff9e-d693-11ee-9874-a8a159550bb4','3ac1df79-d693-11ee-9874-a8a159550bb4','2024-02-27','2024-03-27','Activo'),('3acc8117-d693-11ee-9874-a8a159550bb4','3ac68088-d693-11ee-9874-a8a159550bb4','2024-02-14','2024-03-14','Activo');
/*!40000 ALTER TABLE `tb_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'libro_express'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_cliente`(nombre_cliente VARCHAR(50), email_cliente VARCHAR(100), telefono VARCHAR(10))
BEGIN
 
    INSERT INTO tb_clientes(nombre_cliente, email_cliente, telefono) VALUES (nombre_cliente, email_cliente, telefono);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_detalles_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_detalles_prestamo`(nombre_cliente VARCHAR(50), tituloLibro VARCHAR(100))
BEGIN
	DECLARE cliente_id BINARY(36);
	DECLARE prestamo_id BINARY(36);
	DECLARE libros_id BINARY(36);
   SET cliente_id = (SELECT id_cliente FROM tb_clientes WHERE nombre_cliente = nombre_cliente LIMIT 1);
   SET prestamo_id = (SELECT id_prestamo FROM tb_prestamos WHERE id_cliente = cliente_id LIMIT 1);
   SET libros_id = (SELECT id_libro FROM tb_libros WHERE titulo_libro = tituloLibro LIMIT 1);

 
   INSERT INTO tb_detalles_prestamos(id_prestamo, id_libro) VALUES (prestamo_id, libros_id);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_genero_libro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_genero_libro`(nombre_genero_libro VARCHAR(50))
BEGIN
    INSERT INTO tb_generos_libros(nombre_genero_libro) VALUES (nombre_genero_libro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_libro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_libro`(titulo_libro VARCHAR(50), anio_publicacion INT, NombreGenero VARCHAR(50), estado ENUM('Disponible','Prestado'))
BEGIN
	DECLARE generoLibro_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
   SET generoLibro_id = (SELECT id_genero_libro FROM tb_generos_libros WHERE nombre_genero_libro = NombreGenero);
 
   INSERT INTO tb_libros(titulo_libro, anio_publicacion, id_genero_libro, estado) VALUES (titulo_libro, anio_publicacion, generoLibro_id, estado);
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_prestamo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_prestamo`(nombreCliente VARCHAR(50), fecha_inicio DATE, fecha_devolucion DATE, estado ENUM('Activo','Inactivo'))
BEGIN
    DECLARE cliente_id BINARY(36);
    -- Encierra la consulta SELECT entre paréntesis
    SET cliente_id = (SELECT id_cliente FROM tb_clientes WHERE nombre_cliente = nombreCliente);
    INSERT INTO tb_prestamos(id_cliente, fecha_inicio, fecha_devolucion, estado) VALUES (cliente_id, fecha_inicio, fecha_devolucion, estado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 18:04:31
