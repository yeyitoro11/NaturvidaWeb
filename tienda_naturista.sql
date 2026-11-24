CREATE DATABASE  IF NOT EXISTS `tienda_naturista` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda_naturista`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_naturista
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `tblcliente`
--

DROP TABLE IF EXISTS `tblcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcliente` (
  `CliId_Cliente` int NOT NULL AUTO_INCREMENT,
  `CliNombre` varchar(50) DEFAULT NULL,
  `CliApellido` varchar(50) DEFAULT NULL,
  `CliDireccion` varchar(150) DEFAULT NULL,
  `CliTelefono` varchar(15) DEFAULT NULL,
  `CliCorreo` varchar(100) DEFAULT NULL,
  `CliFecha_Registro` date DEFAULT NULL,
  PRIMARY KEY (`CliId_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcliente`
--

LOCK TABLES `tblcliente` WRITE;
/*!40000 ALTER TABLE `tblcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducto`
--

DROP TABLE IF EXISTS `tblproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblproducto` (
  `ProId_Producto` int NOT NULL AUTO_INCREMENT,
  `ProNombre` varchar(100) DEFAULT NULL,
  `ProCategoria` varchar(50) DEFAULT NULL,
  `ProPrecio` decimal(10,2) DEFAULT NULL,
  `ProStock` int DEFAULT NULL,
  PRIMARY KEY (`ProId_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproducto`
--

LOCK TABLES `tblproducto` WRITE;
/*!40000 ALTER TABLE `tblproducto` DISABLE KEYS */;
INSERT INTO `tblproducto` VALUES (1,'Miel de abeja','Alimentos',25000.00,30),(2,'Avena en hojuelas','Cereales',12000.00,50),(3,'Té de manzanilla','Infusiones',8000.00,40),(4,'Vitamina C','Vitaminas',18000.00,25),(5,'Aceite de coco','Aceites',35000.00,15),(6,'Jengibre','Plantas medicinales',12000.00,25),(8,'Té verde','Infusiones ',15000.00,20),(9,'Aloe vera','Plantas medicinales',10000.00,15);
/*!40000 ALTER TABLE `tblproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproveedor`
--

DROP TABLE IF EXISTS `tblproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblproveedor` (
  `ProveedorId` int NOT NULL AUTO_INCREMENT,
  `ProveedorNombre` varchar(100) DEFAULT NULL,
  `ProveedorDireccion` varchar(200) DEFAULT NULL,
  `ProveedorTelefono` varchar(20) DEFAULT NULL,
  `ProveedorCorreo` varchar(100) DEFAULT NULL,
  `ProveedorEstado` varchar(50) DEFAULT NULL,
  `ProveedorFecha_Registro` date DEFAULT NULL,
  PRIMARY KEY (`ProveedorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproveedor`
--

LOCK TABLES `tblproveedor` WRITE;
/*!40000 ALTER TABLE `tblproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusuario`
--

DROP TABLE IF EXISTS `tblusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblusuario` (
  `UsuId_Usuario` int NOT NULL AUTO_INCREMENT,
  `UsuNombre` varchar(50) DEFAULT NULL,
  `UsuApellido` varchar(50) DEFAULT NULL,
  `UsuCorreo` varchar(100) DEFAULT NULL,
  `UsuContraseña` varchar(255) DEFAULT NULL,
  `UsuRol` varchar(30) DEFAULT NULL,
  `UsuFecha_Registro` date DEFAULT NULL,
  PRIMARY KEY (`UsuId_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusuario`
--

LOCK TABLES `tblusuario` WRITE;
/*!40000 ALTER TABLE `tblusuario` DISABLE KEYS */;
INSERT INTO `tblusuario` VALUES (1,'Ana','Gómez','ana@naturvida.com','clave123','Administrador','2026-07-22');
/*!40000 ALTER TABLE `tblusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblventa`
--

DROP TABLE IF EXISTS `tblventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblventa` (
  `VenId_Venta` int NOT NULL AUTO_INCREMENT,
  `VenFecha` datetime DEFAULT NULL,
  `VenMetodo_Pago` varchar(50) DEFAULT NULL,
  `VenTotal` decimal(10,2) DEFAULT NULL,
  `TblUsuario_UsuId_Usuario` int NOT NULL,
  `TblCliente_CliId_Cliente` int NOT NULL,
  PRIMARY KEY (`VenId_Venta`),
  KEY `TblUsuario_UsuId_Usuario` (`TblUsuario_UsuId_Usuario`),
  KEY `TblCliente_CliId_Cliente` (`TblCliente_CliId_Cliente`),
  CONSTRAINT `tblventa_ibfk_1` FOREIGN KEY (`TblUsuario_UsuId_Usuario`) REFERENCES `tblusuario` (`UsuId_Usuario`),
  CONSTRAINT `tblventa_ibfk_2` FOREIGN KEY (`TblCliente_CliId_Cliente`) REFERENCES `tblcliente` (`CliId_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblventa`
--

LOCK TABLES `tblventa` WRITE;
/*!40000 ALTER TABLE `tblventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-23 14:04:31
