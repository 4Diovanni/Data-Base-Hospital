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
  em_atividade BOOLEAN DEFAULT true,
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
('Dr. Marcos Santos', '345678901', 'marcos.santos@email.com', 2, 2),
('Dr. Luiz Alves', '456789012', 'luiz.alves@email.com', 1, 1),
('Dra. Carla Oliveira', '567890123', 'carla.oliveira@email.com', 2, 3),
('Dr. Gustavo Rocha', '678901234', 'gustavo.rocha@email.com', 1, 5),
('Dra. Fernanda Rodrigues', '789012345', 'fernanda.rodrigues@email.com', 2, 7),
('Dr. Felipe Oliveira', '890123456', 'felipe.oliveira@email.com', 1, 6),
('Dra. Juliana Silva', '901234567', 'juliana.silva@email.com', 2, 5),
('Dr. Rafael Santos', '012345678', 'rafael.santos@email.com', 1, 2);


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
('Carlos Alberto', '1989-07-15', '11987654321', 'carlos.alberto@gmail.com', '12345678910', '123456789', 1, 1),
('Mariana Fernandes', '1995-05-02', '21976543210', 'mariana.fernandes@hotmail.com', '23456789101', '234567890', 2, 2),
('Felipe Rodrigues', '1980-12-25', '31965432109', 'felipe.rodrigues@yahoo.com.br', '34567891012', '345678901', 3, 3),
('Gabriela Silva', '2001-02-20', '11912345678', 'gabriela.silva@gmail.com', '45678901234', '456789012', 1, 4),
('Ricardo Souza', '1978-11-30', '21987654321', 'ricardo.souza@hotmail.com', '56789012345', '567890123', 2, 5),
('Amanda Santos', '1992-09-10', '31976543210', 'amanda.santos@yahoo.com.br', '67890123456', '678901234', 3, 6),
('Marcelo Costa', '1985-06-05', '11945678901', 'marcelo.costa@gmail.com', '78901234567', '789012345', 1, 7),
('Isabela Ferreira', '1997-01-12', '21965432109', 'isabela.ferreira@hotmail.com', '89012345678', '890123456', 2, 8),
('Thiago Nunes', '1983-04-07', '31987654321', 'thiago.nunes@yahoo.com.br', '90123456789', '901234567', 3, 9),
('Juliana Oliveira', '1990-08-18', '11965432109', 'juliana.oliveira@gmail.com', '01234567890', '012345678', 1, 10),
('Roberto Santos', '1975-03-27', '21912345678', 'roberto.santos@hotmail.com', '12345678901', '123456789', 2, 4),
('Renata Alves', '1988-12-10', '31965432101', 'renata.alves@yahoo.com.br', '23456789012', '234567890', 3, 6),
('Fernando Pereira', '1982-05-01', '11987654301', 'fernando.pereira@gmail.com', '34567890123', '345678901', 1, 9),
('Camila Lima', '1993-10-23', '21976543201', 'camila.lima@hotmail.com', '45678901234', '456789012', 2, 1),
('Lucas Martins', '1979-07-14', '31987654301', 'lucas.martins@yahoo.com.br', '56789012345', '567890123', 3, 10);


INSERT INTO consulta (data_hora, medico_id, paciente_id, status, valor_consulta, numero_carteira)
VALUES 
('2015-06-12 09:00:00', 2, 5, 'confirmada', 180.00, 345678),
('2016-03-21 11:30:00', 8, 7, 'realizada', 120.00, 456789),
('2016-09-10 14:00:00', 3, 3, 'confirmada', 200.00, 234567),
('2017-05-02 15:30:00', 4, 4, 'realizada', 150.00, 456789),
('2017-08-10 10:00:00', 6, 12, 'confirmada', 250.00, 567890),
('2018-02-15 16:30:00', 5, 13, 'realizada', 170.00, 456789),
('2018-04-20 11:00:00', 1, 1, 'realizada', 150.00, 123456),
('2019-01-15 14:30:00', 10, 15, 'realizada', 200.00, 678901),
('2019-03-27 09:00:00', 7, 8, 'realizada', 180.00, 567890),
('2019-11-05 10:30:00', 3, 3, 'realizada', 200.00, 234567),
('2020-01-30 16:00:00', 9, 11, 'confirmada', 150.00, 789012),
('2020-04-08 14:30:00', 4, 4, 'realizada', 150.00, 456789),
('2020-06-17 11:00:00', 1, 2, 'realizada', 200.00, 123456),
('2021-02-20 13:30:00', 6, 10, 'realizada', 250.00, 567890),
('2021-04-05 10:00:00', 5, 11, 'realizada', 170.00, 456789),
('2021-07-12 15:30:00', 2, 6, 'realizada', 180.00, 345678),
('2021-09-23 09:00:00', 8, 15, 'realizada', 120.00, 456789),
('2022-01-05 10:30:00', 7, 14, 'confirmada', 200.00, 567890),
('2022-01-25 14:00:00', 3, 9, 'realizada', 200.00, 234567),
('2022-05-01 11:00:00', 1, 2, 'confirmada', 200.00, 345678);

INSERT INTO receita ( consulta_id, medicamento, quantidade, instrucoes_uso) VALUES
( 1, 'Paracetamol', 10, 'Tomar 1 comprimido de 6 em 6 horas'),
( 2, 'Rivotril', 30, 'Tomar 1 comprimido antes de dormir'),
(3, 'Ibuprofeno', 20, 'Tomar 1 comprimido de 8 em 8 horas'),
(3, 'Amoxicilina', 14, 'Tomar 1 comprimido de 12 em 12 horas'),
(4, 'Dipirona', 10, 'Tomar 1 comprimido de 6 em 6 horas'),
(4, 'Buscopan', 20, 'Tomar 1 comprimido antes das refeições'),
(5, 'Losartana', 30, 'Tomar 1 comprimido ao dia'),
(5, 'Hidroclorotiazida', 20, 'Tomar 1 comprimido ao dia'),
(6, 'Sinvastatina', 30, 'Tomar 1 comprimido antes de dormir'),
(6, 'Aspirina', 30, 'Tomar 1 comprimido ao dia'),
(7, 'Omeprazol', 30, 'Tomar 1 comprimido antes das refeições'),
(7, 'Metoclopramida', 20, 'Tomar 1 comprimido antes das refeições');
 
 INSERT INTO enfermeiro (nome, cpf, cre) 
 VALUES 
 ('João Silva', 12345678901, '1234567'), 
 ('Maria Souza', 98765432109, '7654321'), 
 ('Pedro Santos', 45678901234, '9876543'),
 ('Ana Oliveira', 23456789012, '2345678'), 
 ('Lucas Vieira', 34567890123, '3456789'),
 ('Mariana Rodrigues', 56789012345, '5678901'), 
 ('Carlos Nunes', 78901234567, '7890123'),
 ('Fernanda Silva', 90123456789, '9012345'), 
 ('Gustavo Costa', 67890123456, '6789012'),
 ('Isabela Mendes', 89012345678, '8901234');
 
 INSERT INTO tipo_quarto (descricao, valor_diaria) VALUES 
 ('Quarto privativo', 500),
 ('Quarto semi-privativo', 350),
 ('Quarto coletivo', 200),
 ('Apartamentos', 200),
 ('Quartos duplos', 200),
 ('Enfermaria', 200);
 
 INSERT INTO quarto (numero, tipo_quarto_id) 
 VALUES (101, 1), (102, 1), (103, 2), (104, 2), (105, 3);
 
INSERT INTO internacao (data_entrada, data_prev_alta, data_alta, descricao_procedimento, medico_id, paciente_id, enfermeiro_id, quarto_id)
VALUES 
('2021-05-01', '2021-05-06', '2021-05-05', 'Cirurgia de apendicite', 1, 1, 2, 1),
('2020-05-02', '2020-05-08', '2020-05-14', 'Tratamento de pneumonia', 2, 2, 3, 2),
('2019-05-03', '2019-05-09', '2019-06-10', 'Cirurgia de fratura no braço', 3, 3, 1, 3),
('2018-12-01', '2018-12-08', '2019-12-10','Tratamento de infecção urinária', 4, 4, 1, 4),
('2017-07-15', '2017-07-20', '2017-07-30','Cirurgia de hérnia inguinal', 5, 5, 1, 5),
('2016-05-30', '2016-06-05', '2016-06-10','Tratamento de fratura na perna', 6, 6, 2, 3),
('2015-09-20', '2015-09-30', '2015-10-10','Cirurgia de retirada de apêndice', 7, 7, 3, 4);

-- ////////////////////////////////////////////////////////////////////////////////////////
