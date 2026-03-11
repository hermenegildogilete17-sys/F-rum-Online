-- Apagar base antiga se existir
DROP DATABASE IF EXISTS forum_online;

-- Criar nova base e selecionar
CREATE DATABASE forum_online;
USE forum_online;

-- Tabela usuário
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    data_registro DATETIME
);

-- Tabela administrador
CREATE TABLE administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabela categoria
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

-- Tabela tópico
CREATE TABLE topico (
    id_topico INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    data_criacao DATETIME,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- Tabela comentário
CREATE TABLE comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT,
    data_comentario DATETIME,
    id_usuario INT,
    id_topico INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_topico) REFERENCES topico(id_topico)
);