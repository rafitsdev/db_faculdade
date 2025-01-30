CREATE DATABASE db_faculdade;

USE db_faculdade;

CREATE TABLE tbl_tipo_entidade (
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_entidade VARCHAR(20) NOT NULL
);

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
    fk_tipo_entidade INT NOT NULL,
    fk_aluno INT UNIQUE,
    fk_professor INT UNIQUE,
    
CONSTRAINT FOREIGN KEY (fk_tipo_entidade)
REFERENCES tbl_tipo_entidade (id),
    
CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES tbl_alunos (ra),

CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES tbl_professores (id),

CONSTRAINT CHECK ((fk_aluno IS NOT NULL AND fk_professor IS NULL) OR (fk_aluno IS NULL AND fk_professor IS NOT NULL))
);

CREATE TABLE tbl_cursos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(200) NOT NULL,
    semestres INT NOT NULL
);

CREATE TABLE tbl_disciplinas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    carga_horaria INT NOT NULL,
    fk_curso INT NOT NULL,
    fk_professor INT NOT NULL,
    
CONSTRAINT FOREIGN KEY (fk_curso)
REFERENCES tbl_cursos (id),

CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES tbl_professores (id)
);

CREATE TABLE tbl_turmas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    semestre VARCHAR(45) NOT NULL
);

CREATE TABLE tbl_turmas_disciplinas (
	fk_turma INT NOT NULL,
    fk_disciplina INT NOT NULL,
    
    PRIMARY KEY (fk_turma, fk_disciplina),
    
    CONSTRAINT FOREIGN KEY (fk_turma)
    REFERENCES tbl_turmas (id),
    
    CONSTRAINT FOREIGN KEY (fk_disciplina)
    REFERENCES tbl_disciplinas (id)
);

CREATE TABLE tbl_matriculas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_matricula DATE NOT NULL,
    fk_aluno INT NOT NULL,
    fk_curso INT NOT NULL,
    fk_turma INT NOT NULL,
    
CONSTRAINT FOREIGN KEY (fk_aluno)
REFERENCES tbl_alunos (ra),

CONSTRAINT FOREIGN KEY (fk_curso)
REFERENCES tbl_cursos (id),

CONSTRAINT FOREIGN KEY (fk_turma)
REFERENCES tbl_turmas (id)
);

CREATE TABLE tbl_turno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_turno VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE tbl_turno_turmas (
    fk_turno INT NOT NULL,
    fk_turma INT NOT NULL,
    
    PRIMARY KEY (fk_turno, fk_turma),
    
CONSTRAINT FOREIGN KEY (fk_turno)
REFERENCES tbl_turno (id),

CONSTRAINT FOREIGN KEY (fk_turma)
REFERENCES tbl_turmas (id)
);

CREATE TABLE tbl_professores_turmas (
	data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    tipo_aula VARCHAR(45) NOT NULL,
    horas_semanais INT NOT NULL,
    fk_professor INT NOT NULL,
    fk_turma INT NOT NULL,
    
    PRIMARY KEY (fk_professor, fk_turma),
    
CONSTRAINT FOREIGN KEY (fk_professor)
REFERENCES tbl_professores (id),

CONSTRAINT FOREIGN KEY (fk_turma)
REFERENCES tbl_turmas (id)
);

CREATE TABLE tbl_tipo_avaliacao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_notas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(4,2) NOT NULL,
    data_avaliacao DATE,
    fk_matricula INT NOT NULL,
    fk_tipo_avaliacao INT NOT NULL,
    
CONSTRAINT FOREIGN KEY (fk_matricula)
REFERENCES tbl_matriculas (id),

CONSTRAINT FOREIGN KEY (fk_tipo_avaliacao)
REFERENCES tbl_tipo_avaliacao (id)
);