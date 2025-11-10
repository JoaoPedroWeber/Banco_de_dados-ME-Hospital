CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `fk_cirurgia_internacao` int NOT NULL,
  `fk_cirurgia_medico` int NOT NULL,
  `fk_cirurgia_enfermeiro` int NOT NULL,
  `fk_cirurgia_agendamento` int NOT NULL,
  PRIMARY KEY (`id_cirurgia`),
  UNIQUE KEY `fk_cirurgia_internacao_UNIQUE` (`fk_cirurgia_internacao`),
  UNIQUE KEY `fk_cirurgia_agendamento_UNIQUE` (`fk_cirurgia_agendamento`),
  UNIQUE KEY `fk_cirurgia_medico_UNIQUE` (`fk_cirurgia_medico`),
  UNIQUE KEY `fk_cirurgia_enfermeiro_UNIQUE` (`fk_cirurgia_enfermeiro`)
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

-- Dump completed on 2025-10-13 21:10:09

DROP TABLE IF EXISTS `exame`;

CREATE TABLE `exame`(
  `id_exame` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `valor_exame` float DEFAULT NULL,
  `fk_exame_paciente` int DEFAULT NULL,
  `fk_exame_medico` int DEFAULT NULL,
  `fk_exame_agendamento` int DEFAULT NULL,
  PRIMARY KEY (`id_exame`),
  UNIQUE KEY `fk_exame_paciente_UNIQUE` (`fk_exame_paciente`),
  UNIQUE KEY `fk_exame_medico_UNIQUE` (`fk_exame_medico`),
  UNIQUE KEY `fk_exame_agendamento_UNIQUE` (`fk_exame_agendamento`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `exame` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `medicamento`;

CREATE TABLE `medicamento`(
  `id_medicamento` int NOT NULL AUTO_INCREMENT,
  `nome_comercial` varchar(45) NOT NULL,
  `nome_generico` varchar(45) DEFAULT NULL,
  `validade` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `unidade_medica` varchar(45) DEFAULT NULL,
  `fk_medicamento_paciente` int DEFAULT NULL,
  `fk_medicamento_medico` int DEFAULT NULL,
  PRIMARY KEY(`id_medicamento`),
  UNIQUE `nome_comercial_UNIQUE` (`nome_comercial`),
  UNIQUE `fk_medicamento_paciente_UNIQUE` (`fk_medicamento_paciente`),
  UNIQUE `fk_medicamento_medico_UNIQUE` (`fk_medicamento_medico`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `medicamento` WRITE; 

UNLOCK TABLES;

DROP TABLE IF EXISTS `quarto`;

CREATE TABLE `quarto`(
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `capacidade` int DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fk_quarto_departamento` int DEFAULT NULL,
  PRIMARY KEY(`id_quarto`),
  UNIQUE `fk_quarto_departamento_UNIQUE` (`fk_quarto_departamento`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `quarto` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento`(
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `chefe_departamento` varchar(45) DEFAULT NULL,
  `localizacao` int DEFAULT NULL,
  `fk_departamento_id_hospital` int DEFAULT NULL,
  UNIQUE `telefone_UNIQUE` (`telefone`),
  UNIQUE `chefe_departamento` (`chefe_departamento`),
  UNIQUE `fk_departamento_id_hospital_UNIQUE` (`id_hospital`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `departamento` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario`(
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(45) DEFAULT NULL,
  `sexo_funcionario` char DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `cpf_fucionario` varchar(45) DEFAULT NULL,
  `carga_horaria_semanal` int DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `fk_funcionario_id_departamento` int DEFAULT NULL,
  UNIQUE `cpf_funcionario_UNIQUE` (`cpf_funcionario`),
  UNIQUE `telefone_UNIQUE` (`telefone`),
  UNIQUE `fk_funcionario_id_departamento_UNIQUE` (`fk_funcionario_id_departamento`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `funcionario` WRITE;

UNLOCK TABLES;

DROP TABLE IF EXISTS `enfermeiro`;

CREATE TABLE `enfermeiro`(

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
