use winner;
--  Create Tables --
CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf` char(20) NOT NULL COMMENT 'Cpf do Cliente',
  `telefone` varchar(20) DEFAULT NULL COMMENT 'Telefone do cliente',
  `datainc` datetime NOT NULL COMMENT 'Data de Inclusão',
  `iduser` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `logradouro` varchar(60) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `renda` int(11) DEFAULT NULL,
  `escolaridade` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idsuer` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de Clientes';
CREATE TABLE clientesxempresas
(
	idclienteempresa INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Id do Cliente Empresa',
	cpf CHAR(20) NOT NULL COMMENT 'Cpf do Cliente',
	cnpj CHAR(20) NOT NULL COMMENT 'Cnpj da Empresa',
	PRIMARY KEY (idclienteempresa),
	KEY (cpf),
	KEY (cnpj)
) 
;
CREATE TABLE empresas
(
	cnpj CHAR(20) NOT NULL COMMENT 'Cnpj da Empresa',
	razaosocial VARCHAR(50) NOT NULL COMMENT 'Razão Social',
	nomefantasia VARCHAR(30) COMMENT 'Nome Fanstasia',
	logradouro VARCHAR(50) COMMENT 'Logradouro da Empresa',
	municipio VARCHAR(30) COMMENT 'Municipio do Logradouro',
	bairro VARCHAR(30) COMMENT 'Bairro do Logradouro',
	uf CHAR(2) COMMENT 'Unidade Federação',
	telefone VARCHAR(50) NOT NULL COMMENT 'Telefone da Empresa',
	contato VARCHAR(50) NOT NULL COMMENT 'Contato da Empresa',
	celular VARCHAR(20) COMMENT 'Celular do Contato',
	ramoatividade VARCHAR(30) COMMENT 'Ramo de Atividade',
	email VARCHAR(50) NOT NULL COMMENT 'Email da Empresa',
	cnpjmatriz CHAR(20) COMMENT 'Cnpj Matriz',
	datainc DATETIME NOT NULL COMMENT 'Data Inclusão',
	valorlimite NUMERIC(10,2) COMMENT 'Valor Limite de Atacado/Varejo',
	valorbasevarejo NUMERIC(10,2) COMMENT 'Valor Base Varejo',
	valorbaseatacado NUMERIC(10,2) COMMENT 'Valor Base Atacado',
	status SMALLINT NOT NULL COMMENT 'Status de Empresa Ativo',
	file VARCHAR(255),
	iduser INTEGER NOT NULL COMMENT 'Id do Usuário',
	PRIMARY KEY (cnpj)
)  COMMENT='Tabela de Empresas'
;
CREATE TABLE notas
(
	idnota INTEGER NOT NULL COMMENT 'Id Nota',
	sequencia NUMERIC(2) NOT NULL COMMENT 'Sequencia',
	coo NUMERIC(6) NOT NULL COMMENT 'Número do COO',
	idclienteempresa INTEGER NOT NULL COMMENT 'Id Cliente Empresa',
	nrsorte VARCHAR(10) NOT NULL COMMENT 'Numero da Sorte',
	nrsorteado VARCHAR(10) NOT NULL COMMENT 'Número Sorteado',
	nracertado VARCHAR(10) NOT NULL COMMENT 'Numero Acertado',
	pontos NUMERIC(10) NOT NULL COMMENT 'Número de Pontos',
	datainc DATETIME NOT NULL COMMENT 'Data de Inclusão',
	iduser INTEGER NOT NULL COMMENT 'Id do Usuário',
	PRIMARY KEY (idnota, sequencia),
	KEY (idclienteempresa)
)  COMMENT='Tabela de Notas'
;
CREATE TABLE parametros
(
	idparametro VARCHAR(30) NOT NULL COMMENT 'Id Parametro ( Cnpj + Torneio)',
	torneio NUMERIC(2) NOT NULL COMMENT 'Numero do Torneio',
	cnpj CHAR(20) NOT NULL COMMENT 'Cnpj da Empresa',
	digitos NUMERIC(1) NOT NULL COMMENT 'Numero de digitos a serem sorteados ( 4 ou 5)',
	premio1 NUMERIC(3) COMMENT 'Premio 1',
	premio2 NUMERIC(3) COMMENT 'Premio 2',
	premio3 NUMERIC(3) COMMENT 'Premio 3',
	premio4 NUMERIC(3) COMMENT 'Premio 4',
	premio5 NUMERIC(3) COMMENT 'Premio 5',
	premio6 NUMERIC(3) COMMENT 'Premio 6',
	premio7 NUMERIC(3) COMMENT 'Premio 7',
	premio8 NUMERIC(3) COMMENT 'Premio 8',
	premiomaximo NUMERIC(4) COMMENT 'Premio 9',
	espec1 VARCHAR(30) COMMENT 'Especie de premio 1',
	espec2 VARCHAR(30) COMMENT 'Especie de premio 2',
	espec3 VARCHAR(30) COMMENT 'Especie de premio 3',
	espec4 VARCHAR(30) COMMENT 'Especie de premio 4',
	espec5 VARCHAR(30) COMMENT 'Especie de premio 5',
	espec6 VARCHAR(30) COMMENT 'Especie de premio 6',
	espec7 VARCHAR(30) COMMENT 'Especie de premio 7',
	espec8 VARCHAR(30) COMMENT 'Especie de premio 8',
	especmax VARCHAR(30) COMMENT 'Especie de premio 9',
	imprime BOOL COMMENT 'Imprime cupom (s/n)',
	copia SMALLINT COMMENT 'Numero de Cópias',
	status NUMERIC(1) COMMENT 'Status do Torneio',
	PRIMARY KEY (idparametro),
	KEY (cnpj)
)  COMMENT='Tabela de Parametros'
;
CREATE TABLE pontos
(
	torneio NUMERIC(2) NOT NULL COMMENT 'Torneio',
	idclienteempresa INTEGER NOT NULL COMMENT 'Id Cliente Empresa',
	pontos NUMERIC(10) NOT NULL COMMENT 'Pontos Acumulados',
	residuo NUMERIC(10,2) NOT NULL COMMENT 'Residuo de Valor',
	datainc DATETIME NOT NULL COMMENT 'Data de Inclusão',
	iduser INTEGER NOT NULL COMMENT 'Id do Usuário',
	PRIMARY KEY (torneio, idclienteempresa),
	KEY (idclienteempresa)
)  COMMENT='Tabela de Pontos de Clientes'
;
CREATE TABLE premios
(
	idpremio INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Id do premio',
	torneio NUMERIC(1) NOT NULL COMMENT 'Torneio',
	idnota INTEGER NOT NULL COMMENT 'Id da Nota',
	sequencia NUMERIC(2) NOT NULL COMMENT 'Sequencia da Nota',
	faixapremio NUMERIC(1) NOT NULL COMMENT 'Faixa do premio',
	especie VARCHAR(30) COMMENT 'Premio em Espécie',
	datainc DATETIME NOT NULL COMMENT 'Data de Inclusão',
	iduser INTEGER NOT NULL COMMENT 'Id do Usuário',
	PRIMARY KEY (idpremio),
	KEY (idnota, sequencia)
)  COMMENT='Tabela de Premios'
;
CREATE TABLE usuarios
(
	iduser INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Id usuário',
	login VARCHAR(65) NOT NULL COMMENT 'Login do usuário',
	senha VARCHAR(30) NOT NULL COMMENT 'senha usuário',
	administrador NUMERIC(1) NOT NULL COMMENT 'Flag de Administrador',
	email VARCHAR(50) COMMENT 'Email do usuário',
	cnpj CHAR(20) NOT NULL COMMENT 'Cnpj da Empresa',
	file VARCHAR(255),
	datainc DATETIME NOT NULL COMMENT 'Data  de inclusão',
	PRIMARY KEY (iduser),
	KEY (cnpj)
)  COMMENT='Tabela de Usuários e Logins'
;




--  Create Foreign Key Constraints --
ALTER TABLE clientes ADD CONSTRAINT FK_clientes_usuarios 
	FOREIGN KEY (iduser) REFERENCES usuarios (iduser)
;

ALTER TABLE clientesxempresas ADD CONSTRAINT FK_clientesxempresas_clientes 
	FOREIGN KEY (cpf) REFERENCES clientes (cpf)
;

ALTER TABLE clientesxempresas ADD CONSTRAINT FK_clientesxempresas_empresas 
	FOREIGN KEY (cnpj) REFERENCES empresas (cnpj)
;

ALTER TABLE notas ADD CONSTRAINT FK_notas_clientesxempresas 
	FOREIGN KEY (idclienteempresa) REFERENCES clientesxempresas (idclienteempresa)
;

ALTER TABLE parametros ADD CONSTRAINT FK_parametros_empresas 
	FOREIGN KEY (cnpj) REFERENCES empresas (cnpj)
;

ALTER TABLE pontos ADD CONSTRAINT FK_pontos_clientesxempresas 
	FOREIGN KEY (idclienteempresa) REFERENCES clientesxempresas (idclienteempresa)
;

ALTER TABLE premios ADD CONSTRAINT FK_premios_notas 
	FOREIGN KEY (idnota, sequencia) REFERENCES notas (idnota, sequencia)
;

ALTER TABLE usuarios ADD CONSTRAINT FK_usuarios_empresas 
	FOREIGN KEY (cnpj) REFERENCES empresas (cnpj)
;





ALTER TABLE clientes
DROP FOREIGN KEY FK_clientes_usuarios;

alter table clientes change idsuer iduser INTEGER;

ALTER TABLE clientes ADD CONSTRAINT FK_clientes_usuarios FOREIGN KEY (iduser) REFERENCES usuarios (iduser);


                
                


-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tempo de Geração: 13/02/2016 às 18:46
-- Versão do servidor: 5.5.48-cll
-- Versão do PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `topwi_prod`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf` char(20) NOT NULL COMMENT 'Cpf do Cliente',
  `telefone` varchar(20) DEFAULT NULL COMMENT 'Telefone do cliente',
  `datainc` datetime NOT NULL COMMENT 'Data de Inclusão',
  `iduser` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `logradouro` varchar(60) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `municipio` varchar(30) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `renda` int(11) DEFAULT NULL,
  `escolaridade` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idsuer` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de Clientes';

--
-- Fazendo dump de dados para tabela `clientes`
--

INSERT INTO `clientes` (`cpf`, `telefone`, `datainc`, `iduser`, `nome`, `logradouro`, `complemento`, `municipio`, `bairro`, `uf`, `cep`, `celular`, `idade`, `sexo`, `estado_civil`, `renda`, `escolaridade`, `tipo`) VALUES
('000.011.117-10', '(21) 2571 - 4560', '2015-11-16 16:47:55', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('012.628.597-78', '(21) 2122 - 2122', '2015-09-30 21:24:29', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('012.646.747-16', '(21) 9828 - 8040', '2016-02-07 14:13:14', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('013.038.297-38', '(21) 9976 - 5496', '2015-09-29 16:35:21', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('018.816.977-62', '(21) 2571 - 4560', '2015-09-29 21:03:01', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('01881697762', '(21) 3707 - 0532', '2015-09-29 21:04:22', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('021.502.075-83', '(80) 9709 - 8789', '2015-10-11 23:29:19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('043.766.417-15', '(21) 2571 - 4560', '2015-09-28 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('04376641715', '(21) 2571 - 4560', '2015-09-30 11:21:08', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('053.544.407-93', '(21) 3479 - 9250', '2015-09-30 07:25:04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('077.285.518-84', '(21) 2625 - 8630', '2015-11-18 19:24:29', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('080.774.857-90', '(21) 3368 - 1508', '2015-09-29 09:45:06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('119.717.947-08', '(65) 4654 - 6546', '2015-10-03 10:01:23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('120.728.241-33', '(65) 4654 - 5645', '2015-11-15 23:18:34', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('125.042.777-0', '(23) 4213 - 5432', '2015-10-07 11:22:24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('125.042.777-08', '(23) 4213 - 5432', '2015-10-07 11:22:45', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('125.042.777-09', '(21) 3368 - 1508', '2015-09-27 00:00:00', 1, 'josue tristão neves', 'Iaco', 'apto 103', 'Rio de Janeiro', 'Cacuia', 'RJ', '21921-640', '(65) 45645-6456', 3, 'M', 2, 4, 2, 'Rua'),
('128.978.140-04', '(21) 3368 - 1508', '2015-10-01 14:57:55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('144.716.547-05', '(57) 9832 - 4759', '2015-10-06 18:20:50', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('248.034.561-00', '(35) 3534 - 5345', '2015-11-08 01:19:35', 1, 'simone', 'Iaco', 'apto 103', 'Rio de Janeiro', 'Cacuia', 'RJ', '21921-640', '(65) 45645-6456', 2, 'F', 1, 2, 2, 'Rua'),
('298.161.817-20', '(21) 2568 - 2659', '2015-10-20 16:21:23', 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('313.874.797-33', '(21) 3254 - 7600', '2015-11-18 19:26:15', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('450.261.934-55', '(21) 3254 - 7600', '2015-11-18 19:25:34', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('532.256.750-08', '(21) 3368 - 1508', '2015-09-27 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('709.163.907-30', '(80) 9709 - 8789', '2015-10-01 22:06:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('754.710.188-77', '(21) 2625 - 8630', '2015-11-05 13:29:43', 6, 'Marco Antonio Vilardo', 'Joaquim da Costa Sobrinho (Lot Argeu Faz', 'casa 06', 'Niterói', 'Serra Grande', 'RJ', '24340-232', '(21) 98190-3767', 3, 'M', 2, 4, 3, 'Rua'),
('832.981.039-93', '(21) 3368 - 1508', '2015-09-27 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('865.448.253-28', '(65) 4654 - 5645', '2015-11-08 18:28:06', 1, 'josue tristão neves', 'Iaco', 'apto 103', 'Rio de Janeiro', 'Cacuia', 'RJ', '21921-640', '(65) 45645-6456', 2, 'M', 2, 2, 6, 'Rua'),
('868.691.917-00', '(21) 2571 - 4560', '2015-10-20 16:11:58', 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('945.399.857-52', '(21) 3368 - 1508', '2015-09-27 00:00:00', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('953.525.977-67', '(21) 2625 - 8630', '2015-10-05 13:07:14', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('953.525.977-68', '(21) 3368 - 1508', '2015-09-28 00:00:00', 1, 'MARCO ANTONIO VILARDO', 'Joaquim da Costa Sobrinho (Lot Argeu Faz', 'CASA 06', 'Niterói', 'Serra Grande', 'RJ', '24340-232', '(21) 98190-3767', 3, 'M', 2, 6, 7, 'Rua'),
('95352597768', '(21) 2625 - 8630', '2015-09-28 00:00:00', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


