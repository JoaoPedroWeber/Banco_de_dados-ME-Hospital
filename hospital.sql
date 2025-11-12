CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id_agendamento` int NOT NULL,
  `data_agendada` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `motivo_cancelamento` varchar(45) DEFAULT NULL,
  `prioridade` varchar(45) DEFAULT NULL,
  `Agendamentocol` varchar(45) DEFAULT NULL,
  `id_quarto` int DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`),
  KEY `fk_agendamento_quarto` (`id_quarto`),
  CONSTRAINT `fk_agendamento_quarto` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cirurgia`
--

DROP TABLE IF EXISTS `cirurgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirurgia` (
  `id_cirurgia` int NOT NULL,
  `data_cirurgia` date DEFAULT NULL,
  `duracao` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `id_internacao` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  `id_enfermeiro` int DEFAULT NULL,
  `id_agendamento` int DEFAULT NULL,
  PRIMARY KEY (`id_cirurgia`),
  KEY `fk_cirurgia_internacao` (`id_internacao`),
  KEY `fk_cirurgia_medico` (`id_medico`),
  KEY `fk_cirurgia_enfermeiro` (`id_enfermeiro`),
  KEY `fk_cirurgia_agendamento` (`id_agendamento`),
  CONSTRAINT `fk_cirurgia_agendamento` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamento` (`id_agendamento`),
  CONSTRAINT `fk_cirurgia_enfermeiro` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`),
  CONSTRAINT `fk_cirurgia_internacao` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id_internacao`),
  CONSTRAINT `fk_cirurgia_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirurgia`
--

LOCK TABLES `cirurgia` WRITE;
/*!40000 ALTER TABLE `cirurgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cirurgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `chefe_departamento` varchar(45) DEFAULT NULL,
  `localizacao` varchar(45) DEFAULT NULL,
  `id_hospital` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int NOT NULL AUTO_INCREMENT,
  `coren` int DEFAULT NULL,
  `estado_coren` varchar(10) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `id_cirurgia` int DEFAULT NULL,
  PRIMARY KEY (`id_enfermeiro`),
  KEY `fk_enfermeiro_cirurgia` (`id_cirurgia`),
  CONSTRAINT `fk_enfermeiro_cirurgia` FOREIGN KEY (`id_cirurgia`) REFERENCES `cirurgia` (`id_cirurgia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `id_internacao` int NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `fk_internacao_quarto` int NOT NULL,
  `moivo` varchar(45) DEFAULT NULL,
  `fk_internacao_paciente` int NOT NULL,
  `fk_internacao_cirurgia` int NOT NULL,
  PRIMARY KEY (`id_internacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `id_medicamento` int NOT NULL,
  `nome_comercial` varchar(45) DEFAULT NULL,
  `nome_generico` varchar(45) DEFAULT NULL,
  `validade` date DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `unidade_medida` varchar(10) DEFAULT NULL,
  `id_paciente` int DEFAULT NULL,
  `id_medico` int DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`),
  UNIQUE KEY `nome_comercial_UNIQUE` (`nome_comercial`),
  KEY `fk_medicamento_paciente` (`id_paciente`),
  KEY `fk_medicamento_medico` (`id_medico`),
  CONSTRAINT `fk_medicamento_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `fk_medicamento_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` int NOT NULL AUTO_INCREMENT,
  `crm` int DEFAULT NULL,
  `estado_crm` varchar(10) DEFAULT NULL,
  `especialidade` varchar(60) DEFAULT NULL,
  `id_exame` varchar(45) DEFAULT NULL,
  `id_cirurgia` int DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `crm_UNIQUE` (`crm`),
  KEY `fk_medico_cirurgia` (`id_cirurgia`),
  CONSTRAINT `fk_medico_cirurgia` FOREIGN KEY (`id_cirurgia`) REFERENCES `cirurgia` (`id_cirurgia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nome_paciente` varchar(45) NOT NULL,
  `cpf_paciente` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `fk_paciente_seguro` int DEFAULT NULL,
  `fk_paciente_exame` int DEFAULT NULL,
  `fk_paciente_internacao` int DEFAULT NULL,
  `fk_paciente_consulta` int DEFAULT NULL,
  `fk_paciente_medicamento` int DEFAULT NULL,
  `pacientecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `cpf_paciente_UNIQUE` (`cpf_paciente`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `fk_paciente_seguro_UNIQUE` (`fk_paciente_seguro`),
  UNIQUE KEY `fk_paciente_exame_UNIQUE` (`fk_paciente_exame`),
  UNIQUE KEY `fk_paciente_internacao_UNIQUE` (`fk_paciente_internacao`),
  UNIQUE KEY `fk_paciente_consulta_UNIQUE` (`fk_paciente_consulta`),
  UNIQUE KEY `fk_paciente_medicamento_UNIQUE` (`fk_paciente_medicamento`),
  UNIQUE KEY `pacientecol_UNIQUE` (`pacientecol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id_quarto` int NOT NULL,
  `capacidade` int DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `id_departamento` int DEFAULT NULL,
  PRIMARY KEY (`id_quarto`),
  KEY `fk_quarto_departamento` (`id_departamento`),
  CONSTRAINT `fk_quarto_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `id_seguro` int NOT NULL AUTO_INCREMENT,
  `valor_mensal` float NOT NULL,
  `valor_cobertura` float DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `fk_seguro_paciente` int DEFAULT NULL,
  PRIMARY KEY (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-12  2:00:25
