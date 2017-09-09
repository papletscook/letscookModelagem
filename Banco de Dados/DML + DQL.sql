CREATE DATABASE  IF NOT EXISTS `letscook` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `letscook`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: letscook
-- ------------------------------------------------------
-- Server version	5.6.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avalicao_usuario_receita`
--

DROP TABLE IF EXISTS `avalicao_usuario_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avalicao_usuario_receita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `usuario_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira do Usuário',
  `receita_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira da Receita',
  `valor` bigint(20) NOT NULL COMMENT 'Valor da Avaliação (1-5)',
  `data_avaliacao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avalicao_usuario_receita_usuario1_idx` (`usuario_id`),
  KEY `fk_avalicao_usuario_receita_receita1_idx` (`receita_id`),
  CONSTRAINT `fk_avalicao_usuario_receita_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_avalicao_usuario_receita_receita1` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avalicao_usuario_receita`
--

LOCK TABLES `avalicao_usuario_receita` WRITE;
/*!40000 ALTER TABLE `avalicao_usuario_receita` DISABLE KEYS */;
/*!40000 ALTER TABLE `avalicao_usuario_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_receita`
--

DROP TABLE IF EXISTS `categoria_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_receita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `nome` varchar(255) NOT NULL COMMENT 'Nome da Receita',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_receita`
--

LOCK TABLES `categoria_receita` WRITE;
/*!40000 ALTER TABLE `categoria_receita` DISABLE KEYS */;
INSERT INTO `categoria_receita` VALUES (1,'Bolos');
/*!40000 ALTER TABLE `categoria_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario_usuario_receita`
--

DROP TABLE IF EXISTS `comentario_usuario_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario_usuario_receita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `receita_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira da Receita',
  `usuario_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira do Usuário',
  `conteudo` mediumtext NOT NULL COMMENT 'Conteúdo do Comentário',
  `status` varchar(255) NOT NULL COMMENT 'Estado do comentário (Enumerado)',
  `data_comentario` datetime NOT NULL COMMENT 'Data do Comentário',
  PRIMARY KEY (`id`),
  KEY `fk_receita_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_receita_has_usuario_receita1_idx` (`receita_id`),
  CONSTRAINT `fk_receita_has_usuario_receita1` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario_usuario_receita`
--

LOCK TABLES `comentario_usuario_receita` WRITE;
/*!40000 ALTER TABLE `comentario_usuario_receita` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario_usuario_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despensa_usuario`
--

DROP TABLE IF EXISTS `despensa_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despensa_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dispensa_usuario_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_dispensa_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despensa_usuario`
--

LOCK TABLES `despensa_usuario` WRITE;
/*!40000 ALTER TABLE `despensa_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `despensa_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa_receita`
--

DROP TABLE IF EXISTS `etapa_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapa_receita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `nome` varchar(255) NOT NULL COMMENT 'Nome da etapa',
  `ordem` bigint(20) NOT NULL COMMENT 'Ordem de execução da Etapa',
  `receita_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira da Receita',
  PRIMARY KEY (`id`),
  KEY `fk_receita_etapa` (`receita_id`),
  CONSTRAINT `fk_receita` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa_receita`
--

LOCK TABLES `etapa_receita` WRITE;
/*!40000 ALTER TABLE `etapa_receita` DISABLE KEYS */;
INSERT INTO `etapa_receita` VALUES (1,'MASSA',1,0),(2,'COBERTURA',2,0);
/*!40000 ALTER TABLE `etapa_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingrediente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `nome` varchar(255) NOT NULL COMMENT 'Nome do Ingrediente',
  `foto` mediumtext NOT NULL COMMENT 'Base64 da Foto do Ingrediente',
  `tipo` varchar(255) NOT NULL COMMENT 'Tipo Ingrediente Enumerado (Sólido/Líquido);',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Pão','imagem','SOLIDO'),(2,'Óleo','foto','LIQUIDO'),(3,'Cenoura','','SOLIDO');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente_despensa`
--

DROP TABLE IF EXISTS `ingrediente_despensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingrediente_despensa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `despensa_usuario_id` bigint(20) NOT NULL,
  `ingrediente_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingrediente_despensa_usuario` (`despensa_usuario_id`),
  KEY `fk_ingrediente_idx` (`ingrediente_id`),
  CONSTRAINT `fk_despensa_usuario` FOREIGN KEY (`despensa_usuario_id`) REFERENCES `despensa_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_fk` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingrediente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_despensa`
--

LOCK TABLES `ingrediente_despensa` WRITE;
/*!40000 ALTER TABLE `ingrediente_despensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingrediente_despensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente_receita`
--

DROP TABLE IF EXISTS `ingrediente_receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingrediente_receita` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quant` double NOT NULL COMMENT 'Quantidade do Ingrediente',
  `unidade_medida` varchar(45) NOT NULL COMMENT 'Unidade de Medida',
  `receita_id` bigint(20) NOT NULL,
  `ingrediente_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingrediente_receita_receita1_idx` (`receita_id`),
  KEY `fk_ingrediente_receita_ingrediente1_idx` (`ingrediente_id`),
  CONSTRAINT `fk_ingrediente_receita_receita1` FOREIGN KEY (`receita_id`) REFERENCES `receita` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_receita_ingrediente1` FOREIGN KEY (`ingrediente_id`) REFERENCES `ingrediente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_receita`
--

LOCK TABLES `ingrediente_receita` WRITE;
/*!40000 ALTER TABLE `ingrediente_receita` DISABLE KEYS */;
INSERT INTO `ingrediente_receita` VALUES (0,3,'UNIDADE',0,3),(1,0.5,'XICARA',0,2);
/*!40000 ALTER TABLE `ingrediente_receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_lista`
--

DROP TABLE IF EXISTS `item_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_lista` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `nome` varchar(255) NOT NULL COMMENT 'Nome do Item',
  `checked` tinyint(4) NOT NULL COMMENT 'Controle de execução do Item',
  `lista_compras_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira da Lista de Compras',
  PRIMARY KEY (`id`),
  KEY `fk_item_lista_lista_compras1_idx` (`lista_compras_id`),
  CONSTRAINT `fk_item_lista_lista_compras1` FOREIGN KEY (`lista_compras_id`) REFERENCES `lista_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_lista`
--

LOCK TABLES `item_lista` WRITE;
/*!40000 ALTER TABLE `item_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_compras`
--

DROP TABLE IF EXISTS `lista_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_compras` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `data_criacao` datetime NOT NULL COMMENT 'Data da criação da lista de compras',
  `usuario_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira do Usuário',
  PRIMARY KEY (`id`),
  KEY `fk_lista_compras_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_lista_compras_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_compras`
--

LOCK TABLES `lista_compras` WRITE;
/*!40000 ALTER TABLE `lista_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passo_etapa`
--

DROP TABLE IF EXISTS `passo_etapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passo_etapa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `desc` mediumtext NOT NULL COMMENT 'Descrição do Passo',
  `tipo` varchar(45) NOT NULL COMMENT 'Tipo do passo (Normal/Temporal)',
  `ordem` bigint(20) NOT NULL COMMENT 'Ordem de execução do passo',
  `etapa_id` bigint(20) NOT NULL COMMENT 'Chave estrangeira da Etapa',
  `minPasso` double DEFAULT NULL COMMENT 'Minutos de duração para o passo',
  `dica` mediumtext COMMENT 'Dica para realizar o passo.',
  PRIMARY KEY (`id`),
  KEY `fk_etapa` (`etapa_id`),
  CONSTRAINT `fk_etapa` FOREIGN KEY (`etapa_id`) REFERENCES `etapa_receita` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passo_etapa`
--

LOCK TABLES `passo_etapa` WRITE;
/*!40000 ALTER TABLE `passo_etapa` DISABLE KEYS */;
INSERT INTO `passo_etapa` VALUES (1,'Em um liquidificador, adicione a cenoura, os ovos e o óleo, depois misture','NORMAL',1,1,1,NULL),(2,'Acrescente o açúcar e bata.','TEMPORAL',2,1,1,NULL),(3,'Em uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente.','NORMAL',3,1,1,NULL),(4,'Acrescente o fermento e misture lentamente com uma colher','NORMAL',4,1,1,NULL),(5,'Asse em um forno preaquecido a 180° C','TEMPORAL',4,1,1,NULL),(6,'Despeje em uma tigela a manteiga, o chocolate em pó, o açúcar e o leite, depois misture','NORMAL',5,2,0,NULL),(7,'Leve a mistura ao fogo e continue misturando até obter uma consistência cremosa, depois despeje a calda por cima do bolo','NORMAL',6,2,0,NULL);
/*!40000 ALTER TABLE `passo_etapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receita` (
  `id` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `foto` mediumtext NOT NULL,
  `minsPreparo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `criador_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria_receita` (`categoria_id`),
  KEY `fk_criador` (`criador_id`),
  CONSTRAINT `fk_categoria_receita` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_receita` (`id`),
  CONSTRAINT `fk_criador` FOREIGN KEY (`criador_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (0,'desc','foto',40,'BOLO DE CENOURA','PENDENTE',1,1);
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Chave primária',
  `dataNasc` datetime NOT NULL COMMENT 'Data de Nascimento do Usuário',
  `email` varchar(255) NOT NULL COMMENT 'E-mail do Usuário',
  `senha` varchar(255) NOT NULL COMMENT 'MD5 da senha do Usuário',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'2017-09-08 17:14:02','henmerlin@gmail.com','e8d95a51f3af4a3b134bf6bb680a213a');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-09 19:05:44
