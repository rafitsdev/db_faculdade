CREATE DATABASE db_faculdade;

USE db_faculdade;

CREATE TABLE tbl_alunos (
	ra INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(250) NOT NULL UNIQUE,
    telefone VARCHAR(15)
);

CREATE TABLE tbl_professores (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    area_atuacao VARCHAR(100) NOT NULL,
    email VARCHAR(250) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    titulo VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
	logradouro VARCHAR(150) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    pais VARCHAR(20)  NOT NULL,
    fk_aluno INT NOT NULL UNIQUE,
    fk_professor INT NOT NULL UNIQUE
);

CREATE TABLE tbl_cursos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(200) NOT NULL,
    duracao VARCHAR(45)
);

CREATE TABLE tbl_disciplinas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    carga_horaria VARCHAR(45) NOT NULL,
    fk_curso INT NOT NULL UNIQUE,
    fk_professor INT NOT NULL
);

CREATE TABLE tbl_turmas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    semestre VARCHAR(45) NOT NULL,
    fk_disciplina INT NOT NULL
);

CREATE TABLE tbl_matriculas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_matricula DATE NOT NULL,
    ra_aluno INT NOT NULL,
    fk_curso INT NOT NULL,
    fk_turma INT NOT NULL
);

CREATE TABLE tbl_turno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_turno VARCHAR(10) NOT NULL
);

CREATE TABLE tbl_turno_turmas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fk_turno INT NOT NULL,
    fk_turma INT NOT NULL
);

CREATE TABLE tbl_professores_turmas (
	data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    tipo_aula VARCHAR(45) NOT NULL,
    horas_semanais VARCHAR(45) NOT NULL,
    fk_professor INT NOT NULL,
    fk_turma INT NOT NULL
);

CREATE TABLE tbl_tipo_avaliacao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_notas (
    nota DECIMAL(4,2) NOT NULL,
    data_avaliacao DATE,
    fk_matricula INT NOT NULL,
    fk_tipo_avaliacao INT NOT NULL,
    PRIMARY KEY (fk_matricula, fk_tipo_avaliacao)
);