-- Exemplo de como criar um banco
-- CREATE database movies_data;
-- Exemplo de como criar um banco
-- CREATE database movies_data;

CREATE DATABASE IF NOT EXISTS hospital_data; 
-- Escolho o banco para trabalhar
USE hospital_data;

CREATE TABLE IF NOT EXISTS convenio (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  cnpj VARCHAR(14),
  tempo_carencia INT
);

CREATE TABLE IF NOT EXISTS especialidade (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tipo_medico (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS medicos (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  telefone VARCHAR(11),
  email VARCHAR(255),
  tipo_medico_id INT,
  especialidade_id INT,
  FOREIGN KEY (tipo_medico_id) REFERENCES tipo_medico(id),
  FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);

CREATE TABLE IF NOT EXISTS paciente (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  data_nascimento DATE,
  telefone VARCHAR(11),
  email VARCHAR(255),
  cpf VARCHAR(11),
  rg VARCHAR(9),
  convenio_id INT,
  medico_id INT,
  FOREIGN KEY (convenio_id) REFERENCES convenio(id),
  FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

CREATE TABLE IF NOT EXISTS consulta (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  data_hora DATETIME,
  medico_id INT,
  paciente_id INT,
  status VARCHAR(255),
  valor_consulta DECIMAL(10,2),
  numero_carteira INT,
  FOREIGN KEY (medico_id) REFERENCES medicos(id),
  FOREIGN KEY (paciente_id) REFERENCES paciente(id)
);

 CREATE TABLE if not exists receita (
id INT(11) PRIMARY KEY auto_increment,
consulta_id INT,
medicamento VARCHAR(255),
quantidade INT (11),
instrucoes_uso VARCHAR (255),
FOREIGN KEY (consulta_id) REFERENCES consulta(id)
);

CREATE TABLE if not exists tipo_quarto (
 id INT(11) PRIMARY KEY auto_increment,
 descricao VARCHAR(255),
 valor_diaria INT(255)
 );
 
 CREATE TABLE if not exists quarto (
 id INT(11) PRIMARY KEY auto_increment,
 numero INT(255),
 tipo_quarto_id INT NOT NULL,
 FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id)
);

 CREATE TABLE if not exists enfermeiro (
 id INT(11) PRIMARY KEY auto_increment,
 nome VARCHAR(255), cpf BIGINT(20) unsigned,
 cre VARCHAR(11)
 );

CREATE TABLE IF NOT EXISTS internacao (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATE,
    data_prev_alta DATE,
    data_alta DATE,
    descricao_procedimento VARCHAR(255),
    medico_id INT(11),
    paciente_id INT(11),
    enfermeiro_id INT(11),
    quarto_id INT(11),
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
    FOREIGN KEY (quarto_id) REFERENCES quarto(id)
);

INSERT INTO tipo_medico (nome) VALUES
('generalistas'), 
('especialistas'),
('residentes');

INSERT INTO especialidade (nome) VALUES
('Cardiologia'),
('Neurologia'),
('Oncologia'),
('Ortopedia'),
('Psiquiatria'),
('Ginecologia'),
('Urologia');

INSERT INTO medicos (nome, telefone, email, tipo_medico_id, especialidade_id) VALUES
('Dr. João Silva', '123456789', 'joao.silva@email.com', 1, 4),
('Dra. Ana Costa', '234567890', 'ana.costa@email.com', 2, 6),
('Dr. Marcos Santos', '345678901', 'marcos.santos@email.com', 2, 2);

INSERT INTO convenio (nome, cnpj, tempo_carencia) VALUES
('Unimed', '12345678901234', 30),
('Bradesco Saúde', '56789012345678', 60),
('SulAmérica', '90123456789012', 90),
('Amil Saúde', '34567890123456', 45),
('Intermédica', '78901234567890', 30),
('Porto Seguro', '23456789012345', 60),
('Golden Cross', '67890123456789', 90),
('São Cristóvão', '01234567890123', 45);

INSERT INTO paciente (nome, data_nascimento, telefone, email, cpf, rg, convenio_id, medico_id) VALUES
('Carlos Alberto', '1989-07-15', '11987654321', 'carlos.alberto@gmail.com', '12345678910', '123456789', 1, 1);
INSERT INTO paciente (nome, data_nascimento, telefone, email, cpf, rg, convenio_id, medico_id) VALUES
('Mariana Fernandes', '1995-05-02', '21976543210', 'mariana.fernandes@hotmail.com', '23456789101', '234567890', 2, 2);
INSERT INTO paciente (nome, data_nascimento, telefone, email, cpf, rg, convenio_id, medico_id) VALUES
('Felipe Rodrigues', '1980-12-25', '31965432109', 'felipe.rodrigues@yahoo.com.br', '34567891012', '345678901', 3, 3);

INSERT INTO consulta (data_hora, medico_id, paciente_id, status, valor_consulta, numero_carteira) VALUES 
('2023-05-04 10:30:00', 1, 1, 'agendada', 150.00, 123456), 
('2023-05-05 15:00:00', 3, 2, 'confirmada', 200.00, 234567);

INSERT INTO receita ( consulta_id, medicamento, quantidade, instrucoes_uso) VALUES
 ( 1, 'Paracetamol', 10, 'Tomar 1 comprimido de 6 em 6 horas'),
 ( 2, 'Rivotril', 30, 'Tomar 1 comprimido antes de dormir');
 
 INSERT INTO enfermeiro (nome, cpf, cre) 
 VALUES 
 ('João Silva', 12345678901, '1234567'), 
 ('Maria Souza', 98765432109, '7654321'), 
 ('Pedro Santos', 45678901234, '9876543');
 
 INSERT INTO tipo_quarto (descricao, valor_diaria) VALUES 
 ('Quarto privativo', 500),
 ('Quarto semi-privativo', 350),
 ('Quarto coletivo', 200);
 
 INSERT INTO quarto (numero, tipo_quarto_id) 
 VALUES (101, 1), (102, 1), (103, 2), (104, 2), (105, 3);
 
 INSERT INTO internacao (data_entrada, data_prev_alta, data_alta, descricao_procedimento, medico_id, paciente_id, enfermeiro_id, quarto_id)
VALUES 
('2023-05-01', '2023-05-06', '2023-05-05', 'Cirurgia de apendicite', 1, 1, 2, 1),
('2023-05-02', '2023-05-08', '2023-05-07', 'Tratamento de pneumonia', 2, 2, 3, 2),
('2023-05-03', '2023-05-09', '2023-05-10', 'Cirurgia de fratura no braço', 3, 3, 1, 3);

-- ////////////////////////////////////////////////////////////////////////////////////////
