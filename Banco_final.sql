-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestao_patrimonio
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
-- Table structure for table `_status`
--

DROP TABLE IF EXISTS `_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_status`
--

LOCK TABLES `_status` WRITE;
/*!40000 ALTER TABLE `_status` DISABLE KEYS */;
INSERT INTO `_status` VALUES (1,'Operacional / Ativo'),(2,'Em Manutenção'),(3,'Baixado / Sucata'),(4,'Em Trânsito'),(5,'Reservado');
/*!40000 ALTER TABLE `_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `data_vencimento` date NOT NULL,
  `mensagem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_alerta` int NOT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_tipo_alerta` (`id_tipo_alerta`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_tipo_alerta`) REFERENCES `tipo_alerta` (`id_tipo_alerta`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
INSERT INTO `alerta` VALUES (12,'2026-05-29','Aviso: O chamado #80 possui menos de 24 horas restantes de SLA.',1),(13,'2026-08-15','Alerta Financeiro: A garantia contratual do patrimônio 700 irá expirar em 90 dias.',2),(14,'2026-06-05','Aviso: O chamado #85 possui menos de 24 horas restantes de SLA.',1),(15,'2026-06-13','Alerta: O chamado #89 possui SLA crítico de 12 horas.',1),(16,'2026-12-31','Alerta Financeiro: A garantia do patrimônio 709 (Storage) irá expirar em 180 dias.',2),(17,'2026-11-01','Alerta Financeiro: A garantia do patrimônio 704 (Impressora) irá expirar em 120 dias.',2),(18,'2026-09-30','Aviso: A depreciação do patrimônio 711 ultrapassou 50% do valor original.',3),(19,'2026-10-15','Aviso: Estoque mínimo de suprimentos de impressão atingido.',4),(100,'2026-10-07','SLA do chamado #100 está próximo do vencimento.',1),(101,'2026-10-08','SLA do chamado #101 está próximo do vencimento.',1),(102,'2026-10-10','Garantia do Projetor Epson #800 expira em 5 dias.',2),(103,'2026-10-15','Garantia do Notebook Dell #801 expira em 10 dias.',2),(104,'2026-10-20','Garantia do Ar Condicionado #811 expira em 15 dias.',2),(105,'2026-10-25','Revisão anual dos extintores pendente.',2),(106,'2026-11-04','Renovação do contrato de manutenção vence em 30 dias.',2),(107,'2026-10-06','SLA do chamado #105 expira amanhã.',1),(108,'2026-10-12','Garantia do Microscópio #816 vence em 7 dias.',2),(109,'2026-11-19','Backup completo do sistema pendente.',2),(110,'2026-10-30','rtsrfdgfd',1);
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anexo`
--

DROP TABLE IF EXISTS `anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexo` (
  `id_anexo` int NOT NULL AUTO_INCREMENT,
  `caminho` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_upload` datetime DEFAULT CURRENT_TIMESTAMP,
  `comprovante` longblob,
  `id_tipo_anexo` int NOT NULL,
  `id_chamado` int NOT NULL,
  PRIMARY KEY (`id_anexo`),
  KEY `id_tipo_anexo` (`id_tipo_anexo`),
  KEY `id_chamado` (`id_chamado`),
  CONSTRAINT `anexo_ibfk_1` FOREIGN KEY (`id_tipo_anexo`) REFERENCES `tipo_anexo` (`id_tipo_anexo`),
  CONSTRAINT `anexo_ibfk_2` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anexo`
--

LOCK TABLES `anexo` WRITE;
/*!40000 ALTER TABLE `anexo` DISABLE KEYS */;
INSERT INTO `anexo` VALUES (95,'/armazenamento/chamados/vazamento.jpg','2026-05-28 09:02:00',NULL,1,80),(96,'/laudos/upgrade_servidor_assinado.pdf','2026-05-28 15:00:00',NULL,2,81),(97,'/armazenamento/chamados/impressora_atolamento.jpg','2026-06-02 09:10:00',NULL,1,84),(98,'/laudos/laudo_camera_corredor.pdf','2026-06-04 10:00:00',NULL,2,85),(99,'/armazenamento/chamados/switch_instalado.jpg','2026-06-10 15:30:00',NULL,1,86),(100,'/notas_fiscais/NF-99801.pdf','2026-06-03 08:30:00',NULL,3,84),(101,'/termos/termo_responsabilidade_711.pdf','2026-06-10 11:30:00',NULL,4,88),(102,'/laudos/laudo_storage_disco.pdf','2026-06-13 09:00:00',NULL,2,89);
/*!40000 ALTER TABLE `anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (5,'Climatização','Aparelhos de ar-condicionado e ventilação'),(6,'Hardware de Redes','Servidores, switches e roteadores'),(7,'Mobiliário','Cadeiras ergonômicas e mesas executivas'),(8,'1.2.3.1.1.01.18.05 - Monitores','Classificação CGE - Portaria 195/2016'),(9,'Impressoras','Impressoras laser e multifuncionais'),(10,'Telefonia','Aparelhos telefônicos e PABX'),(11,'Segurança Eletrônica','Câmeras, alarmes e controle de acesso'),(12,'1.2.3.1.1.02.07 - Servidores','Classificação CGE - Servidores e storage');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado` (
  `id_chamado` int NOT NULL AUTO_INCREMENT,
  `data_abertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `descricao_problema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioridade` enum('Baixa','Media','Alta') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_previsao_conclusao` datetime DEFAULT NULL,
  `id_tipo_chamado` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_status` int DEFAULT NULL,
  `id_patrimonio` int DEFAULT NULL,
  PRIMARY KEY (`id_chamado`),
  KEY `id_tipo_chamado` (`id_tipo_chamado`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_patrimonio` (`id_patrimonio`),
  CONSTRAINT `chamado_ibfk_1` FOREIGN KEY (`id_tipo_chamado`) REFERENCES `tipo_chamado` (`id_tipo_chamado`),
  CONSTRAINT `chamado_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `chamado_ibfk_3` FOREIGN KEY (`id_patrimonio`) REFERENCES `patrimonio` (`id_patrimonio`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
INSERT INTO `chamado` VALUES (80,'2026-05-28 09:00:00','Aparelho parou de esfriar e está vazando água.','Alta','2026-05-29 18:00:00',1,2,2,700),(81,'2026-05-28 14:00:00','Instalação de novos módulos de memória RAM no servidor.','Media','2026-06-02 12:00:00',2,3,2,701),(82,'2026-09-24 10:36:36','uryu3ryfu3yruy3','Alta','2026-09-30 00:00:00',1,1,3,700),(83,'2026-10-01 10:47:30','ytweugeytrgfgfjhhwgrywhe','Media','2026-10-17 00:00:00',1,4,2,703),(84,'2026-06-02 08:30:00','Impressora apresentando atolamento constante de papel.','Media','2026-06-05 18:00:00',1,2,2,704),(85,'2026-06-03 10:15:00','Câmera do corredor sem sinal de vídeo no DVR.','Alta','2026-06-04 12:00:00',1,1,2,706),(86,'2026-06-05 14:00:00','Solicitação de instalação de novo switch no laboratório.','Media','2026-06-10 18:00:00',4,3,2,707),(87,'2026-06-08 09:45:00','Manutenção preventiva do ar condicionado cassete.','Baixa','2026-06-20 18:00:00',3,14,2,710),(88,'2026-06-10 11:20:00','Notebook do gestor não conecta à VPN corporativa.','Media','2026-06-12 18:00:00',5,12,2,711),(89,'2026-06-12 16:00:00','Storage secundário com alerta de disco degradado.','Alta','2026-06-13 12:00:00',1,13,2,709),(90,'2026-06-15 08:00:00','Telefone IP da recepção sem áudio no handset.','Baixa','2026-06-18 18:00:00',5,2,3,705),(100,'2026-10-03 22:57:30','Projetor não liga mais, sem sinal de energia.','Alta','2026-10-07 22:57:30',1,10,3,800),(101,'2026-10-04 22:57:30','Notebook está travando muito, com tela azul.','Media','2026-10-08 22:57:30',1,11,1,801),(102,'2026-10-05 17:57:30','Impressora não puxa papel corretamente.','Media','2026-10-06 22:57:30',1,12,1,803),(103,'2026-10-05 14:57:30','Ar condicionado fazendo barulho alto.','Alta','2026-10-06 22:57:30',1,13,1,811),(104,'2026-10-02 22:57:30','Mouse e teclado não respondem.','Baixa','2026-10-09 22:57:30',1,14,1,807),(105,'2026-10-05 10:57:30','Switch reiniciando sozinho várias vezes.','Alta','2026-10-06 22:57:30',1,15,1,814),(106,'2026-09-27 22:57:30','Notebook Lenovo não carrega a bateria.','Media','2026-10-06 22:57:30',2,16,2,802),(107,'2026-09-25 22:57:30','Projetor com cores distorcidas.','Media','2026-10-07 22:57:30',2,17,2,819),(108,'2026-09-29 22:57:30','Impressora Multifuncional com erro de papel atolado.','Alta','2026-10-06 22:57:30',2,11,2,804),(109,'2026-09-23 22:57:30','Ar condicionado pingando água dentro da sala.','Alta','2026-10-06 22:57:30',1,12,2,813),(110,'2026-10-01 22:57:30','Microscópio com foco travado.','Media','2026-10-08 22:57:30',2,14,2,816),(111,'2026-10-02 22:57:30','Balança analítica com leitura errada.','Alta','2026-10-07 22:57:30',1,15,2,817),(112,'2026-09-28 22:57:30','Scanner com faixa na digitalização.','Baixa','2026-10-10 22:57:30',1,16,2,805),(113,'2026-09-26 22:57:30','Cadeira de escritório com pistão hidráulico quebrado.','Media','2026-10-08 22:57:30',2,17,2,806),(114,'2026-08-21 22:57:30','Notebook Dell com HD corrompido.','Alta','2026-08-26 22:57:30',1,10,3,801),(115,'2026-08-06 22:57:30','TV do auditório com listras verticais.','Alta','2026-08-11 22:57:30',1,11,3,820),(116,'2026-09-05 22:57:30','Impressora HP não imprime, luz vermelha piscando.','Media','2026-09-10 22:57:30',1,12,3,803),(117,'2026-07-07 22:57:30','Roteador Wi-Fi sem sinal.','Alta','2026-07-12 22:57:30',1,13,3,815),(118,'2026-07-22 22:57:30','Projetor com lâmpada queimada.','Media','2026-07-27 22:57:30',1,14,3,800),(119,'2026-08-16 22:57:30','Mesa de reunião com perna solta.','Baixa','2026-08-18 22:57:30',2,15,2,823),(120,'2026-09-15 22:57:30','Ar condicionado sem gelar.','Alta','2026-09-20 22:57:30',1,16,3,811),(121,'2026-06-07 22:57:30','Notebook Acer com tela trincada.','Alta','2026-06-12 22:57:30',1,17,3,821),(122,'2026-08-26 22:57:30','Chamado duplicado - já resolvido no #116.','Baixa',NULL,1,10,4,803),(123,'2026-09-20 22:57:30','Solicitação de troca de cadeira - cancelada pelo usuário.','Baixa',NULL,2,11,4,807),(124,'2026-10-11 20:44:29','TESTE_PYTEST_Chamado automático','Baixa',NULL,1,1,4,NULL);
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesa` (
  `id_despesa` int NOT NULL,
  `aprovacao` tinyint(1) DEFAULT '0',
  `valor` decimal(12,2) NOT NULL,
  `categoria` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lancamento` int DEFAULT NULL,
  `id_verba` int DEFAULT NULL,
  PRIMARY KEY (`id_despesa`),
  KEY `id_verba` (`id_verba`),
  CONSTRAINT `despesa_ibfk_1` FOREIGN KEY (`id_despesa`) REFERENCES `lancamento_caixa` (`id_lancamento`) ON DELETE CASCADE,
  CONSTRAINT `despesa_ibfk_2` FOREIGN KEY (`id_verba`) REFERENCES `verba` (`id_verba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (33,1,380.00,'Manutenção Corretiva Predial',9001,1),(34,1,1200.00,'Laboratório',9002,2),(1006,1,5600.00,'Equipamentos',1006,10),(1007,1,7000.00,'Equipamentos',1007,11),(1008,1,1800.00,'Equipamentos',1008,10),(1009,1,3200.00,'Manutenção',1009,10),(1010,1,4000.00,'Acessórios',1010,10),(1011,1,1650.00,'Acessórios',1011,12),(1012,1,1600.00,'Tecnologia',1012,11),(1013,1,3200.00,'Tecnologia',1013,11),(1014,1,650.00,'Manutenção',1014,10),(1015,1,480.00,'Manutenção',1015,10),(1016,1,4800.00,'Laboratório',1016,13),(1017,1,1800.00,'Laboratório',1017,13),(1018,1,850.00,'Tecnologia',1018,11),(1019,1,320.00,'Material de Escritório',1019,12),(1020,1,280.00,'Equipamentos',1020,10),(1021,1,450.00,'Manutenção',1021,14),(9005,1,80000.00,'Manutenção Corretiva Predial',9005,NULL),(9006,1,2.35,'Componentes de Tecnologia',9006,10),(9007,1,250.00,'Manutenção Corretiva Predial',9007,4),(9008,1,4200.00,'Hardware de Redes',9008,2),(9010,0,680.00,'Climatização',9010,6),(9011,0,1260.00,'Segurança Eletrônica',9011,4);
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario_caixa`
--

DROP TABLE IF EXISTS `formulario_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario_caixa` (
  `id_formulario` int NOT NULL AUTO_INCREMENT,
  `data_servico` date NOT NULL,
  `forma_pagamento` enum('Dinheiro','Cartao','Pix','Transferencia') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `objeto_servico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periodo_referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_geracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprovante_pagamento` longblob,
  `bimestre_referencia` int DEFAULT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario_caixa`
--

LOCK TABLES `formulario_caixa` WRITE;
/*!40000 ALTER TABLE `formulario_caixa` DISABLE KEYS */;
INSERT INTO `formulario_caixa` VALUES (6,'2026-05-28','Transferencia',NULL,'Mensal','2026-05-28 14:00:00','Aberto',NULL,3),(7,'2026-05-29','Transferencia',NULL,'Mensal','2026-05-29 08:00:00','Aberto',NULL,3),(8,'2026-10-01','Pix','Compra de pentes de memória RAM DDR4 Kingston','Mensal','2026-10-01 10:53:21','Aberto',NULL,5),(9,'2026-10-01','Pix','Compra de pentes de memória RAM DDR4 Kingston','Mensal','2026-10-01 10:54:17','Aberto',NULL,5),(10,'2026-10-01','Dinheiro','Rendimento de Fundo de Reserva Governamental','Mensal','2026-10-01 10:55:04','Aberto',NULL,5),(11,'2026-06-02','Transferencia','Manutenção corretiva da impressora HP','Mensal','2026-06-02 10:00:00','Fechado',NULL,3),(12,'2026-06-10','Pix','Compra de switch Cisco Catalyst 2960','Mensal','2026-06-10 15:00:00','Aberto',NULL,3),(13,'2026-06-15','Dinheiro','Rendimento de fundo de reserva','Mensal','2026-06-15 09:00:00','Aberto',NULL,3),(14,'2026-07-01','Transferencia','Manutenção preventiva do ar condicionado','Mensal','2026-07-01 08:00:00','Fechado',NULL,4),(15,'2026-07-10','Cartao','Compra de câmeras de segurança extras','Mensal','2026-07-10 14:00:00','Aberto',NULL,4),(100,'2026-07-07','Transferencia','Manutenção do laboratório 01','Mensal','2026-07-07 22:58:19','Fechado',NULL,1),(101,'2026-08-06','Pix','Compra de insumos','Mensal','2026-08-06 22:58:19','Fechado',NULL,2),(102,'2026-09-05','Transferencia','Reparo emergencial do ar-cond.','Mensal','2026-09-05 22:58:19','Fechado',NULL,3),(103,'2026-09-20','Pix','Reposição de peças','Mensal','2026-09-20 22:58:19','Aberto',NULL,3),(104,'2026-09-30','Dinheiro','Material de escritório','Mensal','2026-09-30 22:58:19','Aberto',NULL,3),(105,'2026-10-11','Pix','TESTE_PYTEST_Receita','Mensal','2026-10-11 20:44:30','Aberto',NULL,5),(106,'2026-10-11','Dinheiro','TESTE_PYTEST_Despesa','Mensal','2026-10-11 20:44:30','Aberto',NULL,5),(107,'2026-10-27','Pix','Repasse PDDE Federal 2º trimestre','Mensal','2026-10-27 17:54:46','Aberto',NULL,5);
/*!40000 ALTER TABLE `formulario_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `tipo_evento` enum('CRIACAO','ALTERACAO','EXCLUSAO','ENTRADA','SAIDA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_evento` datetime DEFAULT CURRENT_TIMESTAMP,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_chamado` int NOT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `id_chamado` (`id_chamado`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (400,NULL,'2026-05-28 09:15:00','Chamado visualizado pelo ADM e enviado para triagem externa.',80),(401,NULL,'2026-05-28 14:30:00','Módulos de memória retirados do almoxarifado técnico.',81),(402,NULL,'2026-09-24 10:37:22','Status do chamado #82 alterado para \"Concluido\"',82),(403,NULL,'2026-10-01 13:36:10','Prioridade alterada para \"Media\"',83),(404,NULL,'2026-10-01 13:36:54','Status do chamado #83 alterado para \"Em Atendimento\"',83),(405,'CRIACAO','2026-06-02 08:30:00','Chamado aberto pela recepção.',84),(406,'ALTERACAO','2026-06-02 09:00:00','Chamado encaminhado para manutenção externa.',84),(407,'CRIACAO','2026-06-03 10:15:00','Chamado aberto pelo administrador.',85),(408,'SAIDA','2026-06-04 08:00:00','Técnico deslocado para verificação in loco.',85),(409,'CRIACAO','2026-06-05 14:00:00','Chamado aberto pelo setor de TI.',86),(410,'ENTRADA','2026-06-10 09:00:00','Switch recebido do fornecedor.',86),(411,'CRIACAO','2026-06-08 09:45:00','Chamado preventivo aberto pelo técnico.',87),(412,'CRIACAO','2026-06-10 11:20:00','Chamado aberto pelo gestor financeiro.',88),(413,'ALTERACAO','2026-06-10 14:00:00','Prioridade ajustada para Media.',88),(414,'CRIACAO','2026-06-12 16:00:00','Chamado aberto pelo auditor.',89),(415,'ALTERACAO','2026-06-12 17:00:00','Status alterado para Em Atendimento.',89),(416,'CRIACAO','2026-06-15 08:00:00','Chamado aberto pela recepção.',90),(417,'ALTERACAO','2026-06-18 10:00:00','Status do chamado #90 alterado para \"Concluido\".',90),(500,NULL,'2026-09-27 22:57:49','Chamado #106 aberto pelo usuário.',106),(501,NULL,'2026-09-28 22:57:49','Chamado #106 visualizado pelo técnico.',106),(502,NULL,'2026-09-29 22:57:49','Chamado #106 movido para Em Atendimento.',106),(503,NULL,'2026-09-30 22:57:49','Manutenção finalizada com sucesso.',106),(504,NULL,'2026-09-25 22:57:49','Chamado #107 aberto pelo usuário.',107),(505,NULL,'2026-09-26 22:57:49','Chamado #107 visualizado.',107),(506,NULL,'2026-08-21 22:57:49','Chamado #114 aberto.',114),(507,NULL,'2026-08-26 22:57:49','Chamado #114 concluído.',114),(508,NULL,'2026-08-06 22:57:49','Chamado #115 aberto.',115),(509,NULL,'2026-08-11 22:57:49','Chamado #115 concluído com sucesso.',115),(510,NULL,'2026-10-03 22:57:49','Chamado #100 aberto pelo usuário.',100),(511,NULL,'2026-10-04 22:57:49','Chamado #101 aberto pelo usuário.',101),(512,NULL,'2026-10-05 17:57:49','Chamado #102 aberto - aguardando triagem.',102),(513,NULL,'2026-10-02 22:57:49','Chamado #104 aberto.',104),(516,NULL,'2026-10-19 05:08:04','Status do chamado #80 alterado para \"Concluido\"',80),(517,NULL,'2026-10-19 05:08:09','Status do chamado #80 alterado para \"Cancelado\"',80),(521,NULL,'2026-10-26 19:22:52','Status do chamado alterado para \"Aberto\" (reaberto)',119),(522,NULL,'2026-10-26 20:48:25','Status do chamado alterado para \"Aberto\" (reaberto)',121),(523,NULL,'2026-10-26 20:48:38','Prioridade alterada para \"Alta\"',121),(527,NULL,'2026-11-19 08:16:30','Status do chamado alterado para \"Cancelado\". Motivo: dWRGWERGRWTHERGR',124);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_compra_item`
--

DROP TABLE IF EXISTS `historico_compra_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_compra_item` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `data_compra` date NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL,
  `nota_fiscal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fornecedor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_entrega` enum('PENDENTE','EM_TRANSPORTE','ENTREGUE','CANCELADA') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_verba` int DEFAULT NULL,
  PRIMARY KEY (`id_historico`),
  KEY `id_verba` (`id_verba`),
  CONSTRAINT `historico_compra_item_ibfk_1` FOREIGN KEY (`id_verba`) REFERENCES `verba` (`id_verba`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_compra_item`
--

LOCK TABLES `historico_compra_item` WRITE;
/*!40000 ALTER TABLE `historico_compra_item` DISABLE KEYS */;
INSERT INTO `historico_compra_item` VALUES (50,'2026-01-15',1,4500.00,'NF-99441','ClimaFrio Distribuidora','Climatização','ENTREGUE',1),(51,'2026-02-10',1,35000.00,'NF-99500','Dell Technologies','Hardware de Redes','ENTREGUE',2),(52,'2026-03-05',1,1800.00,'NF-99801','HP Brasil','Impressoras','ENTREGUE',4),(53,'2026-03-12',3,950.00,'NF-99812','Cisco Systems','Telefonia','ENTREGUE',1),(54,'2026-04-01',4,420.00,'NF-99850','Intelbras','Segurança Eletrônica','ENTREGUE',4),(55,'2026-04-10',1,4200.00,'NF-99862','Cisco Systems','Hardware de Redes','ENTREGUE',2),(56,'2026-05-02',1,1500.00,'NF-99901','Móveis Silva','Mobiliário','ENTREGUE',4),(57,'2026-05-15',1,22000.00,'NF-99930','Dell Technologies','Hardware de Redes','ENTREGUE',2),(58,'2026-06-01',1,6800.00,'NF-99955','ClimaFrio Distribuidora','Climatização','ENTREGUE',6),(59,'2026-06-10',1,5200.00,'NF-99970','Dell Technologies','Hardware de Redes','ENTREGUE',5),(60,'2026-07-05',5,120.00,'NF-100012','Papelaria Central','Suprimentos','EM_TRANSPORTE',4),(61,'2026-07-12',2,2500.00,'NF-100045','Cisco Systems','Hardware de Redes','PENDENTE',2);
/*!40000 ALTER TABLE `historico_compra_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_movimentacao`
--

DROP TABLE IF EXISTS `item_movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_movimentacao` (
  `id_item_mov` int NOT NULL AUTO_INCREMENT,
  `id_movimentacao` int NOT NULL,
  `id_patrimonio` int NOT NULL,
  PRIMARY KEY (`id_item_mov`),
  KEY `id_movimentacao` (`id_movimentacao`),
  KEY `id_patrimonio` (`id_patrimonio`),
  CONSTRAINT `item_movimentacao_ibfk_1` FOREIGN KEY (`id_movimentacao`) REFERENCES `movimentacao` (`id_movimentacao`),
  CONSTRAINT `item_movimentacao_ibfk_2` FOREIGN KEY (`id_patrimonio`) REFERENCES `patrimonio` (`id_patrimonio`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_movimentacao`
--

LOCK TABLES `item_movimentacao` WRITE;
/*!40000 ALTER TABLE `item_movimentacao` DISABLE KEYS */;
INSERT INTO `item_movimentacao` VALUES (1,301,700),(2,302,701),(3,303,708),(4,304,707),(5,305,706),(6,306,705),(7,307,709),(400,400,800),(401,401,801),(402,402,810),(403,403,803),(404,404,821),(405,405,806),(406,406,819),(407,407,816),(408,408,817),(409,409,823),(410,410,809),(411,411,826);
/*!40000 ALTER TABLE `item_movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancamento_caixa`
--

DROP TABLE IF EXISTS `lancamento_caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lancamento_caixa` (
  `id_lancamento` int NOT NULL AUTO_INCREMENT,
  `data_lancamento` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo_movimento` enum('Receita','Despesa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valor` decimal(12,2) NOT NULL,
  `forma_pagamento` enum('Dinheiro','Cartao','Pix','Transferencia') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_documento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprovante` longblob,
  `bimestre` int DEFAULT NULL,
  `id_formulario` int NOT NULL,
  PRIMARY KEY (`id_lancamento`),
  KEY `id_formulario` (`id_formulario`),
  CONSTRAINT `lancamento_caixa_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formulario_caixa` (`id_formulario`)
) ENGINE=InnoDB AUTO_INCREMENT=9013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancamento_caixa`
--

LOCK TABLES `lancamento_caixa` WRITE;
/*!40000 ALTER TABLE `lancamento_caixa` DISABLE KEYS */;
INSERT INTO `lancamento_caixa` VALUES (1001,'2026-05-08 22:58:30','Receita','Verba CITI Faetec',15000.00,'Transferencia','DOC-2024-002',NULL,1,100),(1002,'2026-06-07 22:58:30','Receita','Recursos próprios APM',5000.00,'Pix','PIX-2024-010',NULL,2,101),(1003,'2026-07-07 22:58:30','Receita','Convênio pesquisa FAPERJ',12500.00,'Transferencia','DOC-2024-003',NULL,2,101),(1004,'2026-08-06 22:58:30','Receita','Doação empresa Alfa Tech',3000.00,'Pix','PIX-2024-020',NULL,3,102),(1005,'2026-09-05 22:58:30','Receita','Repasse PDDE Federal 2º trimestre',12500.00,'Transferencia','DOC-2024-004',NULL,3,102),(1006,'2026-04-18 22:58:30','Despesa','Compra de projetores (2 un.)',5600.00,'Transferencia','NF-1001',NULL,1,100),(1007,'2026-04-23 22:58:30','Despesa','Compra de notebooks Dell (2 un.)',7000.00,'Transferencia','NF-1002',NULL,1,100),(1008,'2026-05-03 22:58:30','Despesa','Impressora HP LaserJet',1800.00,'Transferencia','NF-1004',NULL,1,100),(1009,'2026-05-13 22:58:30','Despesa','Instalação de ar condicionado',3200.00,'Pix','PIX-2024-030',NULL,1,100),(1010,'2026-05-28 22:58:30','Despesa','Cadeiras escolares (20 un.)',4000.00,'Transferencia','NF-1008',NULL,2,101),(1011,'2026-06-12 22:58:30','Despesa','Armário de aço + estante',1650.00,'Pix','PIX-2024-040',NULL,2,101),(1012,'2026-06-27 22:58:30','Despesa','Switch Cisco 24 portas',1600.00,'Transferencia','NF-1015',NULL,2,101),(1013,'2026-07-12 22:58:30','Despesa','Notebook Acer + acessórios',3200.00,'Pix','PIX-2024-050',NULL,3,102),(1014,'2026-07-27 22:58:30','Despesa','Manutenção da TV do auditório',650.00,'Dinheiro','REC-2024-100',NULL,3,102),(1015,'2026-08-11 22:58:30','Despesa','Reparo do ar-condicionado lab. 01',480.00,'Pix','PIX-2024-060',NULL,3,102),(1016,'2026-08-26 22:58:30','Despesa','Microscópios (2 un.)',4800.00,'Transferencia','NF-1017',NULL,3,102),(1017,'2026-09-05 22:58:30','Despesa','Balança analítica digital',1800.00,'Transferencia','NF-1018',NULL,3,102),(1018,'2026-09-15 22:58:30','Despesa','Roteador Wi-Fi + cabeamento',850.00,'Pix','PIX-2024-070',NULL,3,102),(1019,'2026-09-20 22:58:30','Despesa','Material de escritório (lote)',320.00,'Dinheiro','REC-2024-110',NULL,3,103),(1020,'2026-09-25 22:58:30','Despesa','Lâmpada para projetor Epson',280.00,'Pix','PIX-2024-080',NULL,3,103),(1021,'2026-09-30 22:58:30','Despesa','Conserto de cadeiras (5 un.)',450.00,'Dinheiro','REC-2024-120',NULL,3,104),(9001,'2026-05-28 13:00:00','Despesa','Serviço de refrigeração chamado #80',380.00,'Transferencia','NF-SERVICO-881',NULL,3,6),(9002,'2026-05-28 15:45:00','Despesa','Compra de pentes de memória RAM DDR4 Kingston',1200.00,'Transferencia','NF-CHIP-442',NULL,3,6),(9003,'2026-05-20 09:00:00','Receita','Rendimento de Fundo de Reserva Governamental',5000.00,'Transferencia','DOC-BANCO-002',NULL,3,7),(9004,'2026-10-01 10:53:21','Receita','Compra de pentes de memória RAM DDR4 Kingston',5000.00,'Pix','NF-CHIP-442',NULL,NULL,8),(9005,'2026-10-01 10:54:17','Despesa','Compra de pentes de memória RAM DDR4 Kingston',80000.00,'Pix','NF-CHIP-442',NULL,NULL,9),(9006,'2026-10-01 10:55:04','Receita','Rendimento de Fundo de Reserva Governamental',60000.00,'Dinheiro','DOC-BANCO-002',NULL,NULL,10),(9007,'2026-06-02 10:00:00','Despesa','Manutenção corretiva da impressora HP M404dn',250.00,'Transferencia','NF-SERV-990',NULL,3,11),(9008,'2026-06-10 15:00:00','Despesa','Compra de switch Cisco Catalyst 2960',4200.00,'Pix','NF-99862',NULL,3,12),(9009,'2026-06-15 09:00:00','Receita','Rendimento de fundo de reserva',3500.00,'Dinheiro','DOC-BANCO-003',NULL,3,13),(9010,'2026-07-01 08:00:00','Despesa','Manutenção preventiva do ar condicionado cassete',680.00,'Transferencia','NF-SERV-991',NULL,4,14),(9011,'2026-07-10 14:00:00','Despesa','Compra de câmeras de segurança extras',1260.00,'Cartao','NF-99888',NULL,4,15),(9012,'2026-07-15 10:00:00','Receita','Repasse de verba de capacitação',8000.00,'Transferencia','DOC-BANCO-004',NULL,4,15);
/*!40000 ALTER TABLE `lancamento_caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `acao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_log`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `log_auditoria_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (100,'INSERT','2026-05-28 10:00:00','Cadastro do patrimônio ID 700 efetuado pelo ADM.',1),(101,'UPDATE','2026-05-28 11:15:00','Alteração de status do chamado #80 realizada por usuário comum.',2),(102,'DELETE','2026-05-28 14:00:00','Tentativa de exclusão de lançamento financeiro bloqueada.',1),(103,'UPDATE','2026-09-24 10:02:04','Perfil do usuário #4 alterado para Administrador',1),(104,'EXPORT','2026-09-24 10:02:32','Backup CSV da tabela \'usuario\' exportado: usuario_20260924_100229.csv',1),(105,'EXPORT','2026-09-24 10:40:17','Backup CSV da tabela \'perfil\' exportado: perfil_20260924_104016.csv',1),(106,'EXPORT','2026-09-24 10:44:40','Backup CSV da tabela \'usuario\' exportado: usuario_20260924_104440.csv',1),(107,'UPDATE','2026-09-29 07:44:51','Configuração SMTP atualizada',4),(108,'UPDATE','2026-09-29 07:45:31','Configuração SMTP atualizada',4),(109,'INSERT','2026-09-29 07:48:26','Notificação enviada (info) para 1 destinatário(s): rhbwehfbwrhfhwr',4),(110,'EXPORT','2026-09-29 10:41:30','Backup CSV: usuario_20260929_104128.csv',4),(111,'INSERT','2026-10-01 10:11:28','Notificação enviada (alerta) para 1 destinatário(s): blá-blá-blá',4),(112,'UPDATE','2026-10-01 10:28:57','Movimentação #9002 editada',4),(113,'UPDATE','2026-10-01 10:29:20','Movimentação #9003 editada',4),(114,'UPDATE','2026-10-01 10:29:55','Movimentação #9003 editada',4),(115,'UPDATE','2026-10-01 10:30:25','Movimentação #9002 editada',4),(116,'INSERT','2026-10-01 10:38:51','Bem Alugado: teclados (Nº 45736) - lenovo',4),(117,'UPDATE','2026-10-01 10:46:20','Movimentação #303: 1 item(ns). Obs: ',4),(118,'INSERT','2026-10-01 10:53:21','Receita cadastrada (Não informada): Compra de pentes de memória RAM DDR4 Kingston (R$ 5000.00)',4),(119,'INSERT','2026-10-01 10:54:17','Despesa cadastrada (Não informada): Compra de pentes de memória RAM DDR4 Kingston (R$ 80000.00)',4),(120,'INSERT','2026-10-01 10:55:04','Receita cadastrada (Não informada): Rendimento de Fundo de Reserva Governamental (R$ 60000.00)',4),(121,'DELETE','2026-10-01 13:25:56','Movimentação #303 excluída',11),(122,'INSERT','2026-06-02 09:00:00','Cadastro do patrimônio ID 704 efetuado pelo ADM.',1),(123,'UPDATE','2026-06-03 10:30:00','Status do chamado #85 alterado para Em Atendimento.',1),(124,'INSERT','2026-06-05 14:10:00','Chamado #86 aberto pelo setor de TI.',3),(125,'UPDATE','2026-06-10 09:00:00','Entrada de switch registrada no almoxarifado.',14),(126,'INSERT','2026-06-10 15:05:00','Despesa cadastrada: Compra de switch Cisco Catalyst 2960 (R$ 4200.00)',4),(127,'UPDATE','2026-06-12 17:05:00','Status do chamado #89 alterado para Em Atendimento.',13),(128,'INSERT','2026-06-15 09:05:00','Receita cadastrada: Rendimento de fundo de reserva (R$ 3500.00)',4),(129,'DELETE','2026-06-20 10:00:00','Tentativa de exclusão de patrimônio bloqueada (possui chamado ativo).',1),(130,'EXPORT','2026-07-01 08:30:00','Backup CSV da tabela \'patrimonio\' exportado: patrimonio_20260701.csv',1),(131,'UPDATE','2026-07-10 14:10:00','Despesa de câmeras de segurança registrada (aprovacao=0).',4),(132,'INSERT','2026-07-15 10:05:00','Receita de repasse de verba de capacitação cadastrada.',12),(133,'UPDATE','2026-07-20 11:00:00','Configuração SMTP atualizada pelo gestor.',12),(134,'UPDATE','2026-10-29 09:49:00','Senha redefinida via link de recuperação (usuário #11)',11),(200,'INSERT','2026-08-06 22:59:00','Cadastro do patrimônio #800 (Projetor Epson).',1),(201,'INSERT','2026-08-11 22:59:00','Cadastro do patrimônio #801 (Notebook Dell).',1),(202,'INSERT','2026-08-16 22:59:00','Cadastro do patrimônio #802 (Notebook Lenovo).',1),(203,'UPDATE','2026-08-21 22:59:00','Status do chamado #114 alterado para Concluído.',1),(204,'INSERT','2026-08-26 22:59:00','Chamado #115 criado por Maria Fernanda.',10),(205,'UPDATE','2026-08-31 22:59:00','Chamado #115 concluído.',1),(206,'INSERT','2026-09-05 22:59:00','Despesa lançada: Microscópios (R$ 4.800,00).',1),(207,'UPDATE','2026-09-10 22:59:00','Perfil do usuário #11 alterado para ADM.',1),(208,'DELETE','2026-09-15 22:59:00','Movimentação #399 excluída.',1),(210,'UPDATE','2026-09-25 22:59:00','Configuração SMTP atualizada.',1),(211,'INSERT','2026-09-30 22:59:00','Notificação enviada para 20 destinatários.',1),(212,'UPDATE','2026-10-03 22:59:00','Status do chamado #106 alterado.',1),(213,'INSERT','2026-10-04 22:59:00','Backup completo gerado (backup_2024.zip).',1),(214,'EXPORT','2026-10-11 20:44:28','Backup SQL: backup_ipe_20261011_204427.sql',1),(215,'EXPORT','2026-10-11 20:44:28','Backup CSV: usuario_20261011_204428.csv',1),(216,'INSERT','2026-10-11 20:44:30','Receita cadastrada (Não informada): TESTE_PYTEST_Receita (R$ 100.00)',1),(217,'DELETE','2026-10-11 20:44:30','Receita excluída: TESTE_PYTEST_Receita',1),(218,'INSERT','2026-10-11 20:44:30','Despesa cadastrada (Não informada): TESTE_PYTEST_Despesa (R$ 50.00)',1),(219,'DELETE','2026-10-11 20:44:30','Despesa excluída: TESTE_PYTEST_Despesa',1),(220,'EXPORT','2026-10-11 21:33:39','Backup JSON: backup_ipe_20261011_213337.json',1),(221,'EXPORT','2026-10-11 21:33:39','Backup ZIP: backup_ipe_20261011_213339.zip',1),(222,'UPDATE','2026-10-17 17:44:55','Movimentação #1005 editada',4),(223,'UPDATE','2026-10-17 17:45:08','Movimentação #1002 editada',4),(224,'UPDATE','2026-10-17 17:45:17','Movimentação #1005 editada',4),(225,'UPDATE','2026-10-17 17:45:55','Movimentação #1005 editada',4),(226,'UPDATE','2026-10-17 17:46:29','Perfil do usuário #1 alterado para Usuário Padrão',4),(227,'DELETE','2026-10-17 17:47:09','Movimentação #412 excluída',4),(228,'UPDATE','2026-10-18 17:38:36','Movimentação #1005 editada',4),(229,'EXPORT','2026-10-19 03:58:47','PDF do inventário gerado (34 itens). Filtros: Nenhum filtro aplicado',4),(231,'INSERT','2026-10-20 21:11:34','Alerta criado: rtsrfdgfd',4),(232,'UPDATE','2026-10-20 22:10:11','Perfil do usuário #19 alterado para Usuário Padrão',4),(233,'UPDATE','2026-10-20 22:17:24','Perfil do usuário #19 alterado para Direção',4),(234,'UPDATE','2026-10-20 22:17:31','Perfil do usuário #19 alterado para Patrimônio',4),(236,'UPDATE','2026-10-26 19:22:52','Chamado #119 reaberto',4),(237,'UPDATE','2026-10-26 20:48:25','Chamado #121 reaberto',4),(238,'MOVIMENTACAO','2026-10-26 22:46:48','Patrimônio movido da sala 10 para a sala 30',1),(239,'ALTERACAO_SALDO','2026-10-26 22:48:54','Verba \"Custeio Predial 2026\" alterada de R$ 39620.00 para R$ 39570.00',1),(240,'UPDATE','2026-10-27 17:52:30','BAIXA do patrimônio #703: Perdido - JYFMHFYYFJFUYFIUTG',4),(241,'DELETE','2026-10-27 17:53:21','Usuário #22 excluído',4),(242,'UPDATE','2026-10-27 17:53:32','Perfil do usuário #1 alterado para Patrimônio',4),(243,'INSERT','2026-10-27 17:54:46','Despesa cadastrada (Não informada): Repasse PDDE Federal 2º trimestre (R$ 2.35)',4),(244,'DELETE','2026-10-27 17:56:14','Chamado #126 excluído',4),(245,'UPDATE','2026-11-12 10:32:40','Perfil do usuário #2 alterado para Patrimônio',11),(246,'UPDATE','2026-11-12 10:34:42','Perfil do usuário #1 alterado para Usuário Padrão',11),(247,'UPDATE','2026-11-12 10:35:34','Perfil do usuário #1 alterado para Patrimônio',11),(248,'UPDATE','2026-11-12 11:01:47','Perfil do usuário #1 alterado para Usuário Padrão',11),(249,'UPDATE','2026-11-12 11:04:02','Perfil do usuário #1 alterado para Patrimônio',11),(250,'UPDATE','2026-11-12 11:04:46','Perfil do usuário #1 alterado para Usuário Padrão',11),(251,'UPDATE','2026-11-12 11:42:12','Perfil do usuário #1 alterado para Patrimônio',11),(252,'UPDATE','2026-11-19 08:15:25','Chamado #130 cancelado: 56urethrtrtjyjtkuyuidt',4),(253,'DELETE','2026-11-19 08:15:36','Chamado #130 excluído',4),(254,'DELETE','2026-11-19 08:15:45','Chamado #129 excluído',4),(255,'DELETE','2026-11-19 08:15:53','Chamado #128 excluído',4),(256,'UPDATE','2026-11-19 08:16:03','Chamado #125 cancelado: wedfwrfgaewrg',4),(257,'DELETE','2026-11-19 08:16:14','Chamado #125 excluído',4),(258,'UPDATE','2026-11-19 08:16:30','Chamado #124 cancelado: dWRGWERGRWTHERGR',4),(259,'DELETE','2026-11-19 08:17:23','Chamado #131 excluído',4);
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manutencao`
--

DROP TABLE IF EXISTS `manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencao` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `observacao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_tipo_manutencao` int NOT NULL,
  `id_chamado` int DEFAULT NULL,
  PRIMARY KEY (`id_manutencao`),
  KEY `id_tipo_manutencao` (`id_tipo_manutencao`),
  CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`id_tipo_manutencao`) REFERENCES `tipo_manutencao` (`id_tipo_manutencao`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencao`
--

LOCK TABLES `manutencao` WRITE;
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` VALUES (45,'2026-05-28','2026-05-28','Efetuada desobstrução de dreno e recarga de gás refrigerante.',1,80),(46,'2026-05-28','2026-05-28','Expansão concluída. Servidor reiniciado com 64GB de RAM adicionais.',2,81),(47,'2026-06-03','2026-06-03','Limpeza interna e troca do rolo de tração da impressora.',2,84),(48,'2026-06-04','2026-06-04','Substituição do cabo de rede e reconfiguração da câmera.',1,85),(49,'2026-06-10','2026-06-10','Instalação do switch Catalyst e configuração de VLANs.',2,86),(50,'2026-06-18','2026-06-18','Limpeza de filtros e verificação de gás refrigerante.',3,87),(51,'2026-06-12','2026-06-12','Reinstalação do cliente VPN e atualização de certificados.',2,88),(52,'2026-06-13','2026-06-13','Substituição do disco degradado do storage.',1,89),(100,'2026-09-29','2026-09-30','Diagnóstico inicial: fonte queimada. Substituída por fonte nova.',1,106),(101,'2026-09-27','2026-09-28','Limpeza óptica do projetor e ajuste de cores.',2,107),(102,'2026-10-01','2026-10-02','Desobstrução da impressora e troca do rolete.',1,108),(106,'2026-08-21','2026-08-26','Troca de HD e reinstalação do sistema.',1,114),(107,'2026-08-06','2026-08-11','Substituição do painel da TV.',1,115),(108,'2026-09-05','2026-09-10','Limpeza interna e troca do fusor.',1,116),(109,'2026-07-07','2026-07-12','Reinicialização do roteador e atualização de firmware.',2,117),(110,'2026-07-22','2026-07-27','Substituição da lâmpada do projetor.',1,118),(111,'2026-10-26','2026-08-18','Reaperto dos parafusos e reforço da estrutura.',2,119),(112,'2026-09-15','2026-09-20','Recarga de gás e limpeza dos filtros.',1,120),(113,'2026-10-26','2026-10-26','Troca da tela do notebook.',1,121);
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacao` (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `data_movimentacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_sala_origem` int DEFAULT NULL,
  `id_sala_destino` int DEFAULT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `id_sala_origem` (`id_sala_origem`),
  KEY `id_sala_destino` (`id_sala_destino`),
  CONSTRAINT `movimentacao_ibfk_1` FOREIGN KEY (`id_sala_origem`) REFERENCES `sala` (`id_sala`),
  CONSTRAINT `movimentacao_ibfk_2` FOREIGN KEY (`id_sala_destino`) REFERENCES `sala` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
INSERT INTO `movimentacao` VALUES (301,'2026-02-20 11:00:00',NULL,10),(302,'2026-04-05 15:30:00',NULL,20),(303,'2026-06-05 10:00:00',22,23),(304,'2026-06-12 14:00:00',25,27),(305,'2026-06-20 09:30:00',24,22),(306,'2026-07-01 11:00:00',10,26),(307,'2026-07-08 15:00:00',27,25),(400,'2026-04-08 22:58:01',10,30),(401,'2026-05-08 22:58:01',20,31),(402,'2026-06-07 22:58:01',NULL,34),(403,'2026-06-27 22:58:01',NULL,35),(404,'2026-07-07 22:58:01',NULL,36),(405,'2026-07-17 22:58:01',NULL,41),(406,'2026-07-27 22:58:01',NULL,38),(407,'2026-08-06 22:58:01',NULL,32),(408,'2026-08-16 22:58:01',NULL,33),(409,'2026-08-26 22:58:01',NULL,40),(410,'2026-09-05 22:58:01',NULL,39),(411,'2026-09-15 22:58:01',NULL,37),(417,'2026-10-26 22:26:39',10,20),(420,'2026-10-26 22:46:48',10,30);
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patrimonio`
--

DROP TABLE IF EXISTS `patrimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrimonio` (
  `id_patrimonio` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_atual` decimal(12,2) NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numero_patrimonio` int NOT NULL,
  `data_aquisicao` date NOT NULL,
  `nota_fiscal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processo_baixa` date DEFAULT NULL,
  `vida_util_anos` int DEFAULT NULL,
  `taxa_depreciacao` decimal(5,2) DEFAULT NULL,
  `valor_residual` decimal(12,2) DEFAULT NULL,
  `metodo_depreciacao` enum('Linear','Soma_Digitos','Unidades_Produzidas') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sala` int DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `id_verba` int DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id_patrimonio`),
  UNIQUE KEY `numero_patrimonio` (`numero_patrimonio`),
  KEY `id_sala` (`id_sala`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_verba` (`id_verba`),
  KEY `id_status` (`id_status`),
  CONSTRAINT `patrimonio_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id_sala`),
  CONSTRAINT `patrimonio_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `patrimonio_ibfk_3` FOREIGN KEY (`id_verba`) REFERENCES `verba` (`id_verba`),
  CONSTRAINT `patrimonio_ibfk_4` FOREIGN KEY (`id_status`) REFERENCES `_status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrimonio`
--

LOCK TABLES `patrimonio` WRITE;
/*!40000 ALTER TABLE `patrimonio` DISABLE KEYS */;
INSERT INTO `patrimonio` VALUES (700,'Ar Condicionado Split 24k BTUs',4500.00,'Aparelho da recepção',20260700,'2026-01-15','NF-99441',NULL,8,0.13,900.00,'Linear','Compra Direta',10,5,1,1),(701,'Servidor Blade Dell R740',35000.00,'Servidor de banco de dados principal',20260701,'2026-02-10','NF-99500',NULL,5,0.20,5000.00,'Linear','Importação',20,6,2,1),(702,'teclados',40.00,'[CONTRATO_ATE:2027-09-01]',45736,'2026-10-01','lenovo','2026-10-01',NULL,0.00,NULL,NULL,'Alugado',20,5,NULL,1),(703,'Monitor',2000.00,NULL,56775,'2026-10-28',NULL,NULL,NULL,10.00,NULL,NULL,NULL,20,8,NULL,1),(704,'Impressora Laser HP M404dn',1800.00,'Impressora de rede do setor administrativo',20260704,'2026-03-05','NF-99801',NULL,5,0.20,200.00,'Linear','Compra Direta',22,9,4,1),(705,'Telefone IP Cisco 8841',950.00,'Aparelho VoIP da recepção',20260705,'2026-03-12','NF-99812',NULL,6,0.17,100.00,'Linear','Licitação',10,10,1,1),(706,'Câmera IP Dome Intelbras',420.00,'Câmera de segurança corredor principal',20260706,'2026-04-01','NF-99850',NULL,4,0.25,50.00,'Linear','Compra Direta',24,11,4,1),(707,'Switch Cisco Catalyst 2960',4200.00,'Switch 24 portas do laboratório',20260707,'2026-04-10','NF-99862',NULL,7,0.14,600.00,'Linear','Importação',25,6,2,1),(708,'Mesa Executiva em L',1500.00,'Mesa da sala de reunião',20260708,'2026-05-02','NF-99901',NULL,10,0.10,150.00,'Linear','Compra Direta',23,7,4,1),(709,'Servidor Storage Dell PowerVault',22000.00,'Storage secundário do Data Center',20260709,'2026-05-15','NF-99930',NULL,6,0.17,3000.00,'Linear','Licitação',27,12,2,1),(710,'Ar Condicionado Cassete 36k BTUs',6800.00,'Climatização do laboratório de redes',20260710,'2026-06-01','NF-99955',NULL,8,0.13,800.00,'Linear','Compra Direta',25,5,6,1),(711,'Notebook Dell Latitude 5440',5200.00,'Notebook do gestor financeiro',20260711,'2026-06-10','NF-99970',NULL,3,0.33,500.00,'Linear','Compra Direta',22,6,5,1),(800,'Projetor Epson PowerLite X41+',2800.00,'Projetor da sala de aula',20260800,'2024-02-10','NF-1001',NULL,NULL,15.00,NULL,NULL,'PDDE Federal',30,10,NULL,1),(801,'Notebook Dell Inspiron 15 3000',3500.00,'Notebook do laboratório 01',20260801,'2024-03-05','NF-1002',NULL,NULL,20.00,NULL,NULL,'CITI Faetec',30,11,NULL,1),(802,'Notebook Lenovo IdeaPad 3',3200.00,'Notebook do laboratório 01',20260802,'2024-03-05','NF-1003',NULL,NULL,20.00,NULL,NULL,'CITI Faetec',30,11,NULL,1),(803,'Impressora HP LaserJet Pro M404',1800.00,'Impressora da secretaria',20260803,'2024-04-12','NF-1004',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',35,12,NULL,1),(804,'Impressora Multifuncional Brother',2200.00,'Impressora da coordenação',20260804,'2024-04-12','NF-1005',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',36,12,NULL,NULL),(805,'Scanner Epson V39',650.00,'Scanner da secretaria',20260805,'2024-04-20','NF-1006',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',35,12,NULL,1),(806,'Cadeira de Escritório Presidente',1200.00,'Cadeira da direção',20260806,'2024-01-15','NF-1007',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',41,13,NULL,1),(807,'Cadeira Giratória Escolar (x20)',4000.00,'Cadeiras do laboratório 01',20260807,'2024-02-01','NF-1008',NULL,NULL,10.00,NULL,NULL,'PDDE Federal',30,13,NULL,1),(808,'Mesa de Escritório em L',1500.00,'Mesa da direção',20260808,'2024-01-15','NF-1009',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',41,13,NULL,1),(809,'Armário de Aço 2 Portas',900.00,'Armário da secretaria',20260809,'2024-01-20','NF-1010',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',35,14,NULL,1),(810,'Estante de Madeira 5 Prateleiras',750.00,'Estante da biblioteca',20260810,'2024-02-15','NF-1011',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',34,14,NULL,1),(811,'Ar Condicionado Split 18000 BTUs',3200.00,'Ar condicionado do laboratório 01',20260811,'2024-03-10','NF-1012',NULL,NULL,12.00,NULL,NULL,'PDDE Federal',30,15,NULL,1),(812,'Ar Condicionado Split 24000 BTUs',4500.00,'Ar condicionado do auditório',20260812,'2024-03-10','NF-1013',NULL,NULL,12.00,NULL,NULL,'PDDE Federal',38,15,NULL,1),(813,'Ar Condicionado Split 12000 BTUs',2500.00,'Ar condicionado da coordenação',20260813,'2024-03-15','NF-1014',NULL,NULL,12.00,NULL,NULL,'PDDE Federal',36,15,NULL,2),(814,'Switch Cisco 24 Portas',1600.00,'Switch do laboratório 01',20260814,'2024-04-05','NF-1015',NULL,NULL,15.00,NULL,NULL,'CITI Faetec',30,16,NULL,1),(815,'Roteador Wi-Fi TP-Link AC1750',550.00,'Roteador da biblioteca',20260815,'2024-04-05','NF-1016',NULL,NULL,15.00,NULL,NULL,'CITI Faetec',34,16,NULL,1),(816,'Microscópio Binocular 1000x',2400.00,'Microscópio do laboratório de bio',20260816,'2024-02-20','NF-1017',NULL,NULL,8.00,NULL,NULL,'Convênio',32,17,NULL,1),(817,'Balança Analítica Digital',1800.00,'Balança do laboratório de química',20260817,'2024-02-20','NF-1018',NULL,NULL,8.00,NULL,NULL,'Convênio',32,17,NULL,1),(818,'Béquer de Vidro 500ml (kit 10un)',350.00,'Kit béquer do lab. química',20260818,'2024-02-25','NF-1019',NULL,NULL,5.00,NULL,NULL,'Convênio',32,17,NULL,1),(819,'Projetor BenQ MX535',2600.00,'Projetor do auditório',20260819,'2024-05-10','NF-1020',NULL,NULL,15.00,NULL,NULL,'PDDE Federal',38,10,NULL,1),(820,'TV LED 55\" Samsung',3200.00,'TV do auditório',20260820,'2024-05-10','NF-1021',NULL,NULL,15.00,NULL,NULL,'PDDE Federal',38,10,NULL,1),(821,'Notebook Acer Aspire 5',2900.00,'Notebook da coordenação',20260821,'2024-06-01','NF-1022',NULL,NULL,20.00,NULL,NULL,'CITI Faetec',36,11,NULL,1),(822,'Impressora Térmica de Cupom',380.00,'Impressora da cantina',20260822,'2024-06-15','NF-1023',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',39,12,NULL,1),(823,'Mesa Redonda de Reunião',980.00,'Mesa da sala de reuniões',20260823,'2024-05-20','NF-1024',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',40,13,NULL,1),(824,'Quadro Branco 2m x 1m',450.00,'Quadro do laboratório 02',20260824,'2024-04-25','NF-1025',NULL,NULL,10.00,NULL,NULL,'PDDE Federal',31,13,NULL,1),(825,'Projetor Epson PowerLite X41+',2800.00,'Projetor do laboratório 02',20260825,'2024-04-25','NF-1026',NULL,NULL,15.00,NULL,NULL,'PDDE Federal',31,10,NULL,1),(826,'Notebook Dell Latitude 3420',4200.00,'Notebook do professor',20260826,'2024-07-05','NF-1027',NULL,NULL,20.00,NULL,NULL,'CITI Faetec',37,11,NULL,1),(827,'Ar Condicionado Split 9000 BTUs',1900.00,'Ar condicionado da biblioteca',20260827,'2024-07-10','NF-1028',NULL,NULL,12.00,NULL,NULL,'PDDE Federal',34,15,NULL,1),(828,'Switch HP 8 Portas',320.00,'Switch da biblioteca',20260828,'2024-07-15','NF-1029',NULL,NULL,15.00,NULL,NULL,'CITI Faetec',34,16,NULL,1),(829,'Cadeira de Rodas Reforçada',680.00,'Cadeira da coordenação',20260829,'2024-08-01','NF-1030',NULL,NULL,10.00,NULL,NULL,'Recursos Próprios',36,13,NULL,1),(830,'TESTE_PYTEST_Cadastro',150.00,NULL,99204433,'2026-01-01',NULL,NULL,NULL,10.00,NULL,NULL,NULL,NULL,1,NULL,1),(838,'MULTIMETRO ',500.00,NULL,500,'2026-10-23',NULL,NULL,NULL,10.00,NULL,NULL,NULL,10,18,NULL,1);
/*!40000 ALTER TABLE `patrimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADM'),(2,'Funcionario/Setor'),(3,'Gestor Financeiro'),(4,'Auditor'),(5,'Técnico de Manutenção'),(7,'Direção');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `id_receita` int NOT NULL,
  `data_geracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `periodo` enum('Mensal','Bimestral','Semestral','Anual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lancamento` int DEFAULT NULL,
  PRIMARY KEY (`id_receita`),
  CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`id_receita`) REFERENCES `lancamento_caixa` (`id_lancamento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (15,'2026-05-20 09:00:00','Mensal',9003),(1000,'2026-04-08 22:58:36','Semestral',1000),(1001,'2026-05-08 22:58:36','Semestral',1001),(1002,'2026-06-07 22:58:36','Mensal',1002),(1003,'2026-07-07 22:58:36','Semestral',1003),(1004,'2026-08-06 22:58:36','Mensal',1004),(9004,'2026-10-01 10:53:21','Mensal',9004),(9006,'2026-10-01 10:55:04','Mensal',9006),(9009,'2026-06-15 09:00:00','Mensal',9009),(9012,'2026-07-15 10:00:00','Mensal',9012);
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `numero_sala` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bloco` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_sala` int NOT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `id_tipo_sala` (`id_tipo_sala`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_tipo_sala`) REFERENCES `tipo_sala` (`id_tipo_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (10,'Sala 101-A','Bloco Sul',1),(20,'Sala de Servidores 02','Bloco de TI',2),(21,'Sala 2','Bloco C',1),(22,'Sala 202-B','Bloco Sul',1),(23,'Sala de Reunião 01','Bloco Central',3),(24,'Almoxarifado Central','Bloco Norte',4),(25,'Laboratório de Redes','Bloco de TI',5),(26,'Sala 305-C','Bloco Leste',1),(27,'Data Center Secundário','Bloco de TI',2),(30,'Laboratório de Informática 01','Bloco A',2),(31,'Laboratório de Informática 02','Bloco A',2),(32,'Laboratório de Química','Bloco B',1),(33,'Laboratório de Física','Bloco B',1),(34,'Biblioteca','Bloco Central',1),(35,'Secretaria Acadêmica','Bloco Administrativo',1),(36,'Coordenação Pedagógica','Bloco Administrativo',1),(37,'Sala dos Professores','Bloco A',1),(38,'Auditório Principal','Bloco Central',1),(39,'Almoxarifado','Bloco de Serviços',1),(40,'Sala de Reuniões','Bloco Administrativo',1),(41,'Sala da Direção','Bloco Administrativo',1);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_alerta`
--

DROP TABLE IF EXISTS `tipo_alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_alerta` (
  `id_tipo_alerta` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_alerta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_alerta`
--

LOCK TABLES `tipo_alerta` WRITE;
/*!40000 ALTER TABLE `tipo_alerta` DISABLE KEYS */;
INSERT INTO `tipo_alerta` VALUES (1,'Prazo Limite (SLA) Expirando'),(2,'Vencimento de Garantia Comercial'),(3,'Depreciação Acelerada'),(4,'Estoque Mínimo Atingido');
/*!40000 ALTER TABLE `tipo_alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_anexo`
--

DROP TABLE IF EXISTS `tipo_anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_anexo` (
  `id_tipo_anexo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_anexo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_anexo`
--

LOCK TABLES `tipo_anexo` WRITE;
/*!40000 ALTER TABLE `tipo_anexo` DISABLE KEYS */;
INSERT INTO `tipo_anexo` VALUES (1,'Fotografia de Evidência Técnica'),(2,'Laudo Técnico em PDF'),(3,'Nota Fiscal Digital'),(4,'Termo de Responsabilidade');
/*!40000 ALTER TABLE `tipo_anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_chamado`
--

DROP TABLE IF EXISTS `tipo_chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_chamado` (
  `id_tipo_chamado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_chamado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_chamado`
--

LOCK TABLES `tipo_chamado` WRITE;
/*!40000 ALTER TABLE `tipo_chamado` DISABLE KEYS */;
INSERT INTO `tipo_chamado` VALUES (1,'Manutenção Corretiva Urgente'),(2,'Upgrade / Melhoria de Desempenho'),(3,'Manutenção Preventiva'),(4,'Instalação de Novo Equipamento'),(5,'Suporte a Usuário'),(6,'Troca de Equipamento');
/*!40000 ALTER TABLE `tipo_chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_manutencao`
--

DROP TABLE IF EXISTS `tipo_manutencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_manutencao` (
  `id_tipo_manutencao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_manutencao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_manutencao`
--

LOCK TABLES `tipo_manutencao` WRITE;
/*!40000 ALTER TABLE `tipo_manutencao` DISABLE KEYS */;
INSERT INTO `tipo_manutencao` VALUES (1,'Reparo Técnico Externo / Terceirizado'),(2,'Intervenção Lógica / Instalação Física Interna'),(3,'Manutenção Preventiva Programada'),(4,'Correção Emergencial');
/*!40000 ALTER TABLE `tipo_manutencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_sala`
--

DROP TABLE IF EXISTS `tipo_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_sala` (
  `id_tipo_sala` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_sala`
--

LOCK TABLES `tipo_sala` WRITE;
/*!40000 ALTER TABLE `tipo_sala` DISABLE KEYS */;
INSERT INTO `tipo_sala` VALUES (1,'Área Operacional / Atendimento'),(2,'Data Center / Servidores'),(3,'Sala de Reunião'),(4,'Almoxarifado'),(5,'Laboratório');
/*!40000 ALTER TABLE `tipo_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_verba`
--

DROP TABLE IF EXISTS `tipo_verba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_verba` (
  `id_tipo_verba` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `regra_calculo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo_verba`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_verba`
--

LOCK TABLES `tipo_verba` WRITE;
/*!40000 ALTER TABLE `tipo_verba` DISABLE KEYS */;
INSERT INTO `tipo_verba` VALUES (1,'Orçamento Geral de Infraestrutura','Dedução direta por Nota Fiscal'),(2,'Fundo Especial de Tecnologia','Cota Trimestral por Departamento'),(3,'Fundo de Manutenção Predial','Rateio mensal por área'),(4,'Verba de Capacitação','Anual por servidor');
/*!40000 ALTER TABLE `tipo_verba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_perfil` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `e_mail` (`e_mail`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos Administrador','carlos.adm@sistema.com','hash_seguro_adm',1),(2,'Ana Recepção (Setor)','ana.recepcao@sistema.com','hash_seguro_func1',1),(3,'Setor de TI Operacional','ti.operacional@sistema.com','hash_seguro_func2',2),(4,'Desyre','nascimentodesyre@gmail.com','scrypt:32768:8:1$uQIhTPvOjlAk32uw$cefbed528a45ecbceccceeb08acb04e3a68ac14d9976016c93f9235f0cf0aeadf7be570ed8200fd57c92b3f3fbb111e069fae1efc8da840989312a8a8d2d9090',1),(9,'Mariana Azevedo','mariana@gmail.com','scrypt:32768:8:1$xh8c0y0cvHh2omOH$35fea8d777d753d71264f164512adbc46991b20dd75cf47033908d41ab1e4d6bf1b464c27974eead7dcaa645c5b00afb35b2336fbf51c4fefe452d9ca3827d69',2),(11,'Mary Hellen','maryhellennsantos7@gmail.com','scrypt:32768:8:1$TkfvOGdH38OI12PA$3701474404976e70d7f49cd7330df79f8924b542f5e96ff79ff27196107058ea0a53fc6dfe2bef954310a22c71b2eb50ec95953623bdff13b603215131a77db0',1),(12,'Roberto Gestor','roberto.gestor@sistema.com','hash_seguro_gestor',3),(13,'Fernanda Auditora','fernanda.auditora@sistema.com','hash_seguro_auditor',4),(14,'João Técnico','joao.tecnico@sistema.com','hash_seguro_tec',5),(15,'Patrícia Financeiro','patricia.fin@sistema.com','hash_seguro_fin',3),(16,'Lucas Suporte','lucas.suporte@sistema.com','hash_seguro_sup',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verba`
--

DROP TABLE IF EXISTS `verba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verba` (
  `id_verba` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ano_referencia` int NOT NULL,
  `saldo_inicial` decimal(12,2) NOT NULL,
  `saldo_atual` decimal(12,2) NOT NULL,
  `num_alunos` int DEFAULT NULL,
  `saldo_bloqueado` decimal(12,2) DEFAULT '0.00',
  `id_tipo_verba` int NOT NULL,
  PRIMARY KEY (`id_verba`),
  KEY `id_tipo_verba` (`id_tipo_verba`),
  CONSTRAINT `verba_ibfk_1` FOREIGN KEY (`id_tipo_verba`) REFERENCES `tipo_verba` (`id_tipo_verba`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verba`
--

LOCK TABLES `verba` WRITE;
/*!40000 ALTER TABLE `verba` DISABLE KEYS */;
INSERT INTO `verba` VALUES (1,'Custeio Predial 2026','Fundo para manutenção de instalações',2026,40000.00,39620.00,0,0.00,1),(2,'Verba TI Upgrade','Fundo para renovação de servidores',2026,80000.00,80000.00,0,10000.00,2),(3,'Locação: teclados','Alugado - lenovo - R$ 40.00/mês',2026,0.00,0.00,NULL,0.00,1),(4,'Manutenção Predial 2026','Fundo para reparos estruturais',2026,60000.00,58500.00,NULL,0.00,3),(5,'Capacitação TI 2026','Treinamentos e certificações',2026,25000.00,22000.00,NULL,3000.00,4),(6,'Climatização Extra 2026','Verba emergencial para climatização',2026,15000.00,15000.00,NULL,0.00,1),(10,'[ORIGEM:PDDE] Custeio Federal 2024','Fundo PDDE Federal para manutenção',2024,50000.00,47200.00,450,2000.00,1),(11,'[ORIGEM:CITI] Verba TI 2024','Fundo CITI Faetec para tecnologia',2024,30000.00,28500.00,450,1500.00,2),(12,'[ORIGEM:PROPRIO] Caixa Escola 2024','Recursos próprios da APM',2024,15000.00,12400.00,450,0.00,1),(13,'[ORIGEM:CONVENIO] Convênio Pesquisa 2024','Recursos de convênio para laboratórios',2024,25000.00,25000.00,450,0.00,2),(14,'[ORIGEM:DOACAO] Doações 2024','Doações de empresas parceiras',2024,8000.00,7600.00,450,0.00,1);
/*!40000 ALTER TABLE `verba` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-26  9:11:43
