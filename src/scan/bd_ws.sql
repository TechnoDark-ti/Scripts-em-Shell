CREATE DATABASE auditoria_rede;
USE auditoria_rede;

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha_hash VARCHAR(255)
);

CREATE TABLE Captura (
    id_captura INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_inicio DATETIME,
    interface VARCHAR(50),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Filtro (
    id_filtro INT AUTO_INCREMENT PRIMARY KEY,
    expressao TEXT,
    id_captura INT,
    FOREIGN KEY (id_captura) REFERENCES Captura(id_captura)
);

CREATE TABLE Relatorio (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    nome_arquivo VARCHAR(100),
    data_geracao DATETIME,
    tipo VARCHAR(50),
    id_captura INT,
    FOREIGN KEY (id_captura) REFERENCES Captura(id_captura)
);
