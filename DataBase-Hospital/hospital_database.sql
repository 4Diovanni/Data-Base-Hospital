-- Exemplo de como criar um banco
-- CREATE database movies_data;

CREATE DATABASE IF NOT EXISTS hospital_data; 

-- Escolho o banco para trabalhar
USE hospital_data;

-- Apagar uma tabela 



CREATE TABLE if not exists medicos (
  id INT(11) PRIMARY KEY auto_increment,
  nome VARCHAR (255),
  telefone INT (11),
  email VARCHAR(255) ,
  tipo_medico_id INT,
  especialidade_id INT,
  FOREIGN KEY (tipo_medico_id) REFERENCES tipo_medico(id),
  FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);

CREATE TABLE if not exists tipo_medico (
 id INT(11) PRIMARY KEY auto_increment,
  nome VARCHAR (255)
);

CREATE TABLE if not exists especialidade (
  id INT PRIMARY KEY auto_increment,
  nome VARCHAR (255)
);

CREATE TABLE if not exists paciente (
  id INT(11) PRIMARY KEY auto_increment,
  nome VARCHAR (255),
  data_nascimento INT,
  telefone INT,
  email VARCHAR (255),
  cpf INT,
  rg INT,
  convenio_id INT,
  medico_id INT,
  FOREIGN KEY (convenio_id) REFERENCES convenio(id),
  FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

CREATE TABLE if not exists convenio (
  id INT(11) PRIMARY KEY auto_increment,
  nome VARCHAR (255),
  cnpj INT,
  tempo_carencia INT
);

CREATE TABLE if not exists consulta (
  id INT(11) PRIMARY KEY auto_increment,
  data_hora INT,
  medico_id INT,
  paciente_id INT,
  especialidade_id INT,
  valor_consulta INT,
  numero_carteira INT,
  FOREIGN KEY (medico_id) REFERENCES medicos(id),
  FOREIGN KEY (paciente_id) REFERENCES paciente(id),
  FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);

CREATE TABLE if not exists receita (
  id INT(11) PRIMARY KEY auto_increment,
  consulta_id INT,
  medicamento VARCHAR(255),
  quantidade INT (11),
  intrucoes_uso VARCHAR (255),
  FOREIGN KEY (consulta_id) REFERENCES consulta(id)
);

CREATE TABLE if not exists internacao (
  id INT(11) PRIMARY KEY auto_increment,
  data_entrada INT(8),
  data_prev_alta INT(8),
  data_alta INT(8),
  procedimento VARCHAR(255),
  medico_id INT(11),
  paciente_id INT,
  enfermeiro_id INT,
  quarto_id INT,
  FOREIGN KEY (medico_id) REFERENCES medicos(id),
  FOREIGN KEY (paciente_id) REFERENCES paciente(id),
  FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
  FOREIGN KEY (quarto_id) REFERENCES quarto(id)
);

CREATE TABLE if not exists quarto (
 id INT(11) PRIMARY KEY auto_increment,
  numero INT(255),
  tipo_quarto_id INT NOT NULL,
  FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id)
);

CREATE TABLE if not exists tipo_quarto (
  id INT(11) PRIMARY KEY auto_increment,
  descricao VARCHAR(255),
  valor_diaria INT(255)
);

CREATE TABLE if not exists enfermeiro (
  id INT(11) PRIMARY KEY auto_increment,
  nome VARCHAR(255),
  cpf BIGINT(20) unsigned,
  cre VARCHAR(11)
);


INSERT INTO enfermeiro (nome, cpf, cre) 
VALUES 
('João Silva', 12345678901, '1234567'), 
('Maria Souza', 98765432109, '7654321'), 
('Pedro Santos', 45678901234, '9876543');

INSERT INTO internacao (data_inicio, data_fim, paciente_id, quarto_id, valor_total)
VALUES
('2023-05-01', '2023-05-05', 1, 1, 1500),
('2023-05-02', '2023-05-06', 2, 2, 1800),
('2023-05-03', '2023-05-07', 3, 3, 2100);
INSERT INTO tipo_quarto (descricao, valor_diaria) VALUES 
('Quarto privativo', 500),
('Quarto semi-privativo', 350),
('Quarto coletivo', 200);
INSERT INTO quarto (numero, tipo_quarto_id) 
VALUES (101, 1),
       (102, 1),
       (103, 2),
       (104, 2),
       (105, 3);
INSERT INTO receita ( consulta_id, medicamento, quantidade, instrucoes_uso) VALUES
( 1, 'Paracetamol', 10, 'Tomar 1 comprimido de 6 em 6 horas'),
( 2, 'Rivotril', 30, 'Tomar 1 comprimido antes de dormir'),
( 3, 'Amoxicilina', 20, 'Tomar 1 comprimido de 8 em 8 horas'),
( 4, 'Dipirona', 15, 'Tomar 1 comprimido de 6 em 6 horas'),
( 5, 'Omeprazol', 30, 'Tomar 1 comprimido de manhã'),
( 6, 'Sinvastatina', 30, 'Tomar 1 comprimido à noite'),
( 7, 'Citalopram', 60, 'Tomar 1 comprimido de manhã');
INSERT INTO consulta (id, data_hora, medico_id, paciente_id, especialidade_id, valor_consulta, numero_carteira) VALUES
(1, 202305041030, 1, 1, 4, 150, 123456),
(2, 202305051500, 2, 2, 6, 200, 234567);
INSERT INTO paciente (id, nome, data_nascimento, telefone, email, cpf, rg, convenio_id, medico_id) VALUES
(1, 'Maria Silva', 19900101, 123456789, 'maria.silva@email.com', 12345678901, 123456789, 1, 1),
(2, 'José Santos', 19850228, 234567890, 'jose.santos@email.com', 23456789012, 234567890, 2, 2);
INSERT INTO medicos (id, nome, telefone, email, tipo_medico_id, especialidade_id) VALUES
(1, 'Dr. João Silva', '123456789', 'joao.silva@email.com', 1, 4),
(2, 'Dra. Ana Costa', '234567890', 'ana.costa@email.com', 6, 6),
(3, 'Dr. Marcos Santos', '345678901', 'marcos.santos@email.com', 2, 2);
INSERT INTO convenio (id, nome, cnpj, tempo_carencia) VALUES
(1, 'Unimed', '12345678901234', 30),
(2, 'Bradesco Saúde', '56789012345678', 60),
(3, 'SulAmérica', '90123456789012', 90);
INSERT INTO especialidade (id, nome) VALUES
(1, 'Cardiologia'),
(2, 'Neurologia'),
(3, 'Oncologia'),
(4, 'Ortopedia'),
(5, 'Psiquiatria'),
(6, 'Ginecologia'),
(7, 'Urologia');
INSERT INTO tipo_medico (id, nome) VALUES
(1, 'Cardiologia'),
(2, 'Neurologia'),
(3, 'Oncologia'),
(4, 'Ortopedia'),
(5, 'Psiquiatria'),
(6, 'Ginecologia'),
(7, 'Urologia');

