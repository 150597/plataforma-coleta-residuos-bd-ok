CREATE DATABASE IF NOT EXISTS coleta_residuos;
USE coleta_residuos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    tipo ENUM('Morador', 'Comércio', 'Empresa', 'Instituição'),
    senha VARCHAR(255)
);

CREATE TABLE pontos_coleta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(200),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    capacidade INT
);

CREATE TABLE residuos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_residuo VARCHAR(100),
    descricao TEXT
);

CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_ponto INT,
    data_agendamento DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_ponto) REFERENCES pontos_coleta(id)
);

CREATE TABLE coletas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_agendamento INT,
    id_residuo INT,
    quantidade_kg DECIMAL(10,2),
    data_coleta DATE,
    FOREIGN KEY (id_agendamento) REFERENCES agendamentos(id),
    FOREIGN KEY (id_residuo) REFERENCES residuos(id)
);
