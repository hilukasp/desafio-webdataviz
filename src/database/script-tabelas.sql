-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE woodtech;

USE woodtech;

CREATE TABLE empresa (
	id					INT PRIMARY KEY AUTO_INCREMENT,
	nome 				VARCHAR(100),
	email				VARCHAR(100),
	codigo_ativacao		CHAR(6)
);

CREATE TABLE usuario (
	id					INT PRIMARY KEY AUTO_INCREMENT,
	nome				VARCHAR(100),
	email				VARCHAR(100),
	senha				VARCHAR(100),
	fk_empresa 			INT,
	foreign key 		(fk_empresa) references empresa(id)
) auto_increment = 10 ;

CREATE TABLE lote (
	id					INT PRIMARY KEY AUTO_INCREMENT,
	tipo				VARCHAR(50),
	fk_empresa			INT,
	foreign key 		(fk_empresa) references empresa(id)
) auto_increment = 100 ;

CREATE TABLE sensor (
	id					INT PRIMARY KEY AUTO_INCREMENT,
	fk_lote				INT,
	foreign key 		(fk_lote) references lote(id)
) auto_increment = 1000 ;

CREATE TABLE registro (
	id 					INT PRIMARY KEY AUTO_INCREMENT,
	fk_sensor			INT,
	medida				DECIMAL(3, 1),,
	horario				DATETIME,
	foreign key 		(fk_sensor) references sensor(id)
) auto_increment = 10000 ;

INSERT INTO empresa (nome, email, codigo_ativacao)
VALUES				('Madeireira SA', 'madeira@contato.com', 'ABC123'),
					('Lenha SP', 'lenhasp@contato.com', 'DFE456');
					
INSERT INTO usuario (nome, email, senha, fk_empresa)
VALUES				('João Pedro', 'joaopedro@contato.com', 'senha123', 1),
					('Lucas Hideo', 'lucashideo@contato.com', 'senha123', 1),
					('Pedro Giraldi', 'pedrogiraldi@contato.com', 'senha123', 2),
					('Matheus Souza', 'matheussouza@contato.com', 'senha123', 2);

INSERT INTO lote (tipo, fk_empresa)
VALUES			 ('Acácia', 1),
				 ('Pinheiro', 1),
				 ('Eucalipto', 2),
				 ('Carvalho', 2);

INSERT INTO sensor 	(fk_lote)
VALUES			 	(100),
				 	(100),
				 	(200),
				 	(200);

INSERT INTO registro (fk_sensor, medida, horario)
VALUES
-- REGISTROS DE ACÁCIA
(1000, 7.5, "2025-01-01 13:40:00"),
(1000, 8.2, "2025-01-03 09:15:00"),
(1001, 9.1, "2025-01-05 16:20:00"),
(1001, 10.3, "2025-01-07 10:45:00"),
(1002, 11.7, "2025-01-09 14:30:00"),
(1002, 10.9, "2025-01-11 08:50:00"),
(1002, 7.8, "2025-01-13 17:10:00"),
(1002, 8.4, "2025-01-15 12:00:00"),
(1002, 9.7, "2025-01-17 15:30:00"),
(1002, 11.2, "2025-01-19 09:40:00"),

-- REGISTROS DE PINHEIRO
(1000, 7.4, "2025-02-01 13:40:00"),
(1000, 8.7, "2025-02-03 10:00:00"),
(1001, 9.5, "2025-02-05 14:10:00"),
(1001, 10.6, "2025-02-07 11:20:00"),
(1002, 11.3, "2025-02-09 16:30:00"),
(1002, 9.9, "2025-02-11 09:45:00"),
(1002, 7.9, "2025-02-13 14:50:00"),
(1002, 8.6, "2025-02-15 12:30:00"),
(1002, 10.1, "2025-02-17 15:20:00"),
(1002, 11.8, "2025-02-19 10:10:00"),

-- REGISTROS DE EUCALIPTO
(1000, 7.8, "2025-03-01 14:00:00"),
(1000, 9.0, "2025-03-03 10:30:00"),
(1001, 10.2, "2025-03-05 14:20:00"),
(1001, 11.5, "2025-03-07 11:40:00"),
(1002, 8.7, "2025-03-09 17:00:00"),
(1002, 7.3, "2025-03-11 10:50:00"),
(1002, 9.8, "2025-03-13 15:10:00"),
(1002, 10.7, "2025-03-15 13:00:00"),
(1002, 11.1, "2025-03-17 16:40:00"),
(1002, 8.4, "2025-03-19 09:20:00"),

-- REGISTROS DE CARVALHO
(1000, 7.2, "2025-04-01 14:10:00"),
(1000, 8.9, "2025-04-03 10:15:00"),
(1001, 9.4, "2025-04-05 14:30:00"),
(1001, 11.0, "2025-04-07 11:10:00"),
(1002, 7.7, "2025-04-09 17:20:00"),
(1002, 8.3, "2025-04-11 10:40:00"),
(1002, 9.9, "2025-04-13 15:30:00"),
(1002, 10.4, "2025-04-15 13:20:00"),
(1002, 11.6, "2025-04-17 16:00:00"),
(1002, 7.6, "2025-04-19 09:30:00");
