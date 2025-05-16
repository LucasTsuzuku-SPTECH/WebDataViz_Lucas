-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
    cpf VARCHAR(15),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

SELECT * FROM usuario;

INSERT INTO medida (dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario) VALUES
(30, 25, 10,15,1,'2025-05-16 15:00:00',1),
(25, 30, 20,20,1,'2025-05-16 15:00:02',1),
(20, 35, 30,30,1,'2025-05-16 15:00:04',1),
(15, 30, 10,50,1,'2025-05-16 15:00:06',1),
(15, 20, 10,10,1,'2025-05-16 15:00:08',1),
(20, 15, 55,15,1,'2025-05-16 15:00:10',1),
(35, 10, 42,20,1,'2025-05-16 15:00:12',1),
(30, 55, 33,25,1,'2025-05-16 15:00:14',1),
(10, 10, 22,40,1,'2025-05-16 15:00:16',1), 
(30, 25, 10,15,1,'2025-05-16 15:00:18',1),
(25, 30, 20,20,1,'2025-05-16 15:00:20',1),
(20, 35, 30,30,1,'2025-05-16 15:00:22',1),
(15, 30, 10,50,1,'2025-05-16 15:00:24',1),
(15, 20, 10,10,1,'2025-05-16 15:00:26',1),
(20, 15, 55,15,1,'2025-05-16 15:00:28',1),
(35, 10, 42,20,1,'2025-05-16 15:00:30',1),
(30, 55, 33,25,1,'2025-05-16 15:00:32',1),
(10, 10, 22,40,1,'2025-05-16 15:00:34',1)
;

TRUNCATE medida;
SELECT * FROM medida;
