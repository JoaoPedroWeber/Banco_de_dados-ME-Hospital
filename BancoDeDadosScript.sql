CREATE DATABASE IF NOT EXISTS `hospital`;
USE `hospital`;


DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `id_hospital` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) DEFAULT NULL,
  `endereco` VARCHAR(45) DEFAULT NULL,
  `telefone` VARCHAR(45) DEFAULT NULL,
  `horario_funcionamento` VARCHAR(45) DEFAULT NULL,
  `cnpj` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id_hospital`),
  UNIQUE KEY `endereco_UNIQUE` (`endereco`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `hospital` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) DEFAULT NULL,
  `telefone` VARCHAR(45) DEFAULT NULL,
  `chefe_departamento` VARCHAR(45) DEFAULT NULL,
  `localizacao` VARCHAR(45) DEFAULT NULL,
  `fk_departamento_id_hospital` INT DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `chefe_departamento_UNIQUE` (`chefe_departamento`),
  CONSTRAINT `fk_departamento_hospital` FOREIGN KEY (`fk_departamento_id_hospital`) REFERENCES `hospital` (`id_hospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `departamento` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `quarto`;

CREATE TABLE `quarto` (
  `id_quarto` INT NOT NULL AUTO_INCREMENT,
  `capacidade` INT DEFAULT NULL,
  `tipo` VARCHAR(45) DEFAULT NULL,
  `fk_quarto_departamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_quarto`),
  CONSTRAINT `fk_quarto_departamento` FOREIGN KEY (`fk_quarto_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `quarto` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `agendamento`;

CREATE TABLE `agendamento` (
  `id_agendamento` INT NOT NULL AUTO_INCREMENT,
  `data_agendada` DATE DEFAULT NULL,
  `status` VARCHAR(45) DEFAULT NULL,
  `motivo_cancelamento` VARCHAR(45) DEFAULT NULL,
  `prioridade` VARCHAR(45) DEFAULT NULL,
  `fk_agendamento_id_quarto` INT DEFAULT NULL,
  PRIMARY KEY (`id_agendamento`),
  CONSTRAINT `fk_agendamento_quarto` FOREIGN KEY (`fk_agendamento_id_quarto`) REFERENCES `quarto` (`id_quarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `agendamento` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `nome_paciente` VARCHAR(45) NOT NULL,
  `cpf_paciente` VARCHAR(45) DEFAULT NULL,
  `sexo` VARCHAR(45) DEFAULT NULL,
  `telefone` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `cpf_paciente_UNIQUE` (`cpf_paciente`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `paciente` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `funcionario`;

CREATE TABLE `funcionario` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome_funcionario` VARCHAR(45) DEFAULT NULL,
  `sexo_funcionario` CHAR(1) DEFAULT NULL,
  `salario` FLOAT DEFAULT NULL,
  `cpf_funcionario` VARCHAR(45) DEFAULT NULL,
  `carga_horaria_semanal` INT DEFAULT NULL,
  `telefone` VARCHAR(45) DEFAULT NULL,
  `fk_funcionario_id_departamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `cpf_funcionario_UNIQUE` (`cpf_funcionario`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  CONSTRAINT `fk_funcionario_departamento` FOREIGN KEY (`fk_funcionario_id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `funcionario` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `enfermeiro`;

CREATE TABLE `enfermeiro` (
  `id_enfermeiro` INT NOT NULL AUTO_INCREMENT,
  `nome_enfermeiro` VARCHAR(45) DEFAULT NULL,
  `coren` INT DEFAULT NULL,
  `estado_coren` VARCHAR(45) DEFAULT NULL,
  `cargo` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id_enfermeiro`),
  UNIQUE KEY `coren_UNIQUE` (`coren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `enfermeiro` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `medico`;

CREATE TABLE `medico` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `nome_medico` VARCHAR(45) DEFAULT NULL,
  `crm` INT DEFAULT NULL,
  `estado_crm` VARCHAR(45) DEFAULT NULL,
  `especialidade` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `crm_UNIQUE` (`crm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `medico` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cirurgia`;

CREATE TABLE `cirurgia` (
  `id_cirurgia` INT NOT NULL AUTO_INCREMENT,
  `data_cirurgia` DATE DEFAULT NULL,
  `duracao` VARCHAR(45) DEFAULT NULL,
  `status` VARCHAR(45) DEFAULT NULL,
  `fk_cirurgia_internacao` INT DEFAULT NULL,
  `fk_cirurgia_medico` INT DEFAULT NULL,
  `fk_cirurgia_enfermeiro` INT DEFAULT NULL,
  `fk_cirurgia_agendamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_cirurgia`),
  CONSTRAINT `fk_cirurgia_medico` FOREIGN KEY (`fk_cirurgia_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `fk_cirurgia_enfermeiro` FOREIGN KEY (`fk_cirurgia_enfermeiro`) REFERENCES `enfermeiro` (`id_enfermeiro`),
  CONSTRAINT `fk_cirurgia_agendamento` FOREIGN KEY (`fk_cirurgia_agendamento`) REFERENCES `agendamento` (`id_agendamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `cirurgia` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `internacao`;

CREATE TABLE `internacao` (
  `id_internacao` INT NOT NULL AUTO_INCREMENT,
  `data_inicio` DATE DEFAULT NULL,
  `data_fim` DATE DEFAULT NULL,
  `fk_internacao_quarto` INT DEFAULT NULL,
  `motivo` VARCHAR(45) DEFAULT NULL,
  `fk_internacao_paciente` INT DEFAULT NULL,
  `fk_internacao_cirurgia` INT DEFAULT NULL,
  PRIMARY KEY (`id_internacao`),
  CONSTRAINT `fk_internacao_quarto` FOREIGN KEY (`fk_internacao_quarto`) REFERENCES `quarto` (`id_quarto`),
  CONSTRAINT `fk_internacao_paciente` FOREIGN KEY (`fk_internacao_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_internacao_cirurgia` FOREIGN KEY (`fk_internacao_cirurgia`) REFERENCES `cirurgia` (`id_cirurgia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `internacao` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `consulta`;

CREATE TABLE `consulta` (
  `id_consulta` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) DEFAULT NULL,
  `status` VARCHAR(45) DEFAULT NULL,
  `fk_consulta_id_paciente` INT DEFAULT NULL,
  `fk_consulta_id_medico` INT DEFAULT NULL,
  `fk_consulta_id_agendamento` INT DEFAULT NULL,
  `fk_consulta_id_departamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_consulta`),
  CONSTRAINT `fk_consulta_paciente` FOREIGN KEY (`fk_consulta_id_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_consulta_medico` FOREIGN KEY (`fk_consulta_id_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `fk_consulta_agendamento` FOREIGN KEY (`fk_consulta_id_agendamento`) REFERENCES `agendamento` (`id_agendamento`),
  CONSTRAINT `fk_consulta_departamento` FOREIGN KEY (`fk_consulta_id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `consulta` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `seguro`;

CREATE TABLE `seguro` (
  `id_seguro` INT NOT NULL AUTO_INCREMENT,
  `valor_mensal` FLOAT NOT NULL,
  `valor_cobertura` FLOAT DEFAULT NULL,
  `data_inicio` DATE DEFAULT NULL,
  `data_fim` DATE DEFAULT NULL,
  `status` VARCHAR(45) DEFAULT NULL,
  `fk_seguro_paciente` INT DEFAULT NULL,
  PRIMARY KEY (`id_seguro`),
  CONSTRAINT `fk_seguro_paciente` FOREIGN KEY (`fk_seguro_paciente`) REFERENCES `paciente` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `seguro` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `exame`;

CREATE TABLE `exame` (
  `id_exame` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) DEFAULT NULL,
  `valor_exame` FLOAT DEFAULT NULL,
  `fk_exame_paciente` INT DEFAULT NULL,
  `fk_exame_medico` INT DEFAULT NULL,
  `fk_exame_agendamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_exame`),
  CONSTRAINT `fk_exame_paciente` FOREIGN KEY (`fk_exame_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_exame_medico` FOREIGN KEY (`fk_exame_medico`) REFERENCES `medico` (`id_medico`),
  CONSTRAINT `fk_exame_agendamento` FOREIGN KEY (`fk_exame_agendamento`) REFERENCES `agendamento` (`id_agendamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `exame` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `medicamento`;

CREATE TABLE `medicamento` (
  `id_medicamento` INT NOT NULL AUTO_INCREMENT,
  `nome_comercial` VARCHAR(45) NOT NULL,
  `nome_generico` VARCHAR(45) DEFAULT NULL,
  `validade` INT DEFAULT NULL,
  `quantidade` INT DEFAULT NULL,
  `unidade_medica` VARCHAR(45) DEFAULT NULL,
  `fk_medicamento_paciente` INT DEFAULT NULL,
  `fk_medicamento_medico` INT DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`),
  UNIQUE KEY `nome_comercial_UNIQUE` (`nome_comercial`),
  CONSTRAINT `fk_medicamento_paciente` FOREIGN KEY (`fk_medicamento_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `fk_medicamento_medico` FOREIGN KEY (`fk_medicamento_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `medicamento` WRITE;
UNLOCK TABLES;

DROP TABLE IF EXISTS `fornecedor`;

CREATE TABLE `fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) DEFAULT NULL,
  `telefone` VARCHAR(45) DEFAULT NULL,
  `endereco` VARCHAR(45) DEFAULT NULL,
  `cnpj` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `endereco_UNIQUE` (`endereco`),
  UNIQUE KEY `cnpj_UNIQUE` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `fornecedor` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `equipamento`;

CREATE TABLE `equipamento` (
  `id_equipamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) DEFAULT NULL,
  `tipo` VARCHAR(45) DEFAULT NULL,
  `preco` FLOAT DEFAULT NULL,
  `fabricante` VARCHAR(45) DEFAULT NULL,
  `vida_util_anos` VARCHAR(45) DEFAULT NULL,
  `fk_equipamento_id_fornecedor` INT DEFAULT NULL,
  `fk_equipamento_id_departamento` INT DEFAULT NULL,
  PRIMARY KEY (`id_equipamento`),
  CONSTRAINT `fk_equipamento_fornecedor` FOREIGN KEY (`fk_equipamento_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_equipamento_departamento` FOREIGN KEY (`fk_equipamento_id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `equipamento` WRITE;
UNLOCK TABLES;
