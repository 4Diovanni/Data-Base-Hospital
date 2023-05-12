# Sistema de Gerenciamento Clínico: Hospital Database
</h1>
<div align='center'>
Trabalho realizado no @Instituto Proa
  
designado ao professor Gabriel Augusto Azevedo
</div>
<h2>Descrição e requisitos para o banco de dados:</h2>
<span>
Descrição do Projeto
Este projeto tem como objetivo desenvolver um sistema de gerenciamento clínico abrangente para o Hospital Database, a fim de aprimorar o controle e a eficiência da área clínica e das consultas realizadas em seu ambiente. O sistema será projetado para armazenar e organizar as informações essenciais relacionadas a pacientes e médicos, substituindo os métodos manuais e desatualizados atualmente em uso.
</span>

## 

## ⚡Parte 1 - Diagrama Entidade Relacionamento (ER)

#### Funcionalidades:

<ul>

<li>Cadastro de Médicos: Os médicos serão classificados em três categorias (generalistas, especialistas ou residentes) e suas informações pessoais serão registradas em planilhas digitais. Cada médico pode ter uma ou mais especialidades, como pediatria, clínica geral, gastroenterologia e dermatologia. Os registros antigos em formulários de papel também poderão ser incluídos no sistema.</li>
<br>
<li>Cadastro de Pacientes: Será possível cadastrar pacientes com detalhes pessoais, documentos e informações de convênio, como nome, data de nascimento, endereço, telefone e e-mail. Para cada convênio, será registrado o nome, CNPJ e tempo de carência.</li>
<br>
<li>Agendamento e Registro de Consultas: O sistema permitirá o agendamento e registro de consultas médicas. As consultas serão registradas em planilhas, contendo informações como data, hora, médico responsável, paciente, valor da consulta ou nome do convênio com o número da carteira, e a especialidade buscada pelo paciente.</li>
<br>
<li>Receita Médica Eletrônica: O sistema informatizará a emissão de receitas médicas. Ao final da consulta, o médico poderá registrar os medicamentos prescritos, a quantidade e as instruções de uso. O sistema poderá imprimir um relatório da receita para o paciente ou permitir a visualização online.</li>
  
</ul>
<br>
<img align='center' src='DiagramaER pt1.png'/>
<br>

#### Benefícios:

<ul>
  
<li>Eficiência no agendamento e controle de consultas médicas.</li>

<li>Acesso rápido e fácil às informações de pacientes e médicos.</li>

<li>Eliminação de erros e redundâncias dos métodos manuais.</li>

<li>Armazenamento seguro e organizado de dados clínicos e pessoais.</li>

<li>Melhoria na comunicação e colaboração entre médicos e pacientes.</li>

<li>Redução do tempo de espera e otimização do atendimento ao paciente.</li>
  
<li>Geração de relatórios e análises estatísticas.</li>
  
</ul>

## 

## ⚡Parte 2 - Diagrama Entidade Relacionamento (ER)

#### Funcionalidades:

<ul>
  
  <li>Registro de Internações: Será possível registrar as internações com informações como data de entrada, data prevista de alta e data efetiva de alta. Além disso, será feita uma descrição textual dos procedimentos a serem realizados durante a internação.</li>
  <br>
  <li>Vinculação a Quartos: Cada internação será vinculada a um quarto específico, contendo a numeração e o tipo do quarto. Os tipos de quartos incluirão apartamentos, quartos duplos e enfermarias. Cada tipo de quarto terá sua descrição e valor diário associados.</li>
  <br>
  <li>Atribuição de Enfermeiros: Será realizado o controle dos profissionais de enfermagem responsáveis pelo acompanhamento do paciente durante a internação. Cada enfermeiro(a) será registrado com nome, CPF e registro no conselho de enfermagem (CRE).</li>
  <br>
  <li>Vínculo com Paciente e Médico Responsável: Cada internação estará associada a um paciente específico, permitindo que um mesmo paciente se interne mais de uma vez. Além disso, será registrado o médico responsável pela internação do paciente.</li>
  
</ul>


<br>
<img align='center' src='DiagramaER pt2.png'/>
<br>

#### Benefícios:

<ul>
  
  <li>Eficiência no registro e controle das internações hospitalares.</li>
  
  <li>Controle adequado da ocupação dos quartos e tipos de quartos disponíveis.</li>
  
  <li>Atribuição correta de enfermeiros responsáveis pelo acompanhamento dos pacientes durante a internação.</li>
  
  <li>Facilidade na identificação do médico responsável por cada internação.</li>
  
  <li>Agilidade na busca e análise das informações das internações.</li>
  
  <li>Melhoria na organização e gestão das internações hospitalares.</li>
  
  <li>Otimização dos recursos e melhor aproveitamento dos quartos disponíveis.</li>
  
  <li>Redução de erros e inconsistências nos registros das internações.</li>
  
  <li>Melhoria na comunicação entre equipes médicas, enfermeiros e pacientes durante as internações.</li>
  
  <li>Geração de relatórios e análises estatísticas para auxiliar na tomada de decisões e planejamento hospitalar.</li>
  
</ul>

## 

## ⚡Parte 3 - Adicionando a tabela

<p>
<ul>
<li>Inclua ao menos dez médicos de </li>
<li>Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastroenterologia e dermatologia”).</li>
<li>Inclua ao menos 15 pacientes. </li>
<li>Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos. </li>
<li>Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas. </li>
<li>Criar entidade de relacionamento entre médico e especialidade.  </li>
<li>Criar Entidade de Relacionamento entre internação e enfermeiro.  </li>
<li>Arrumar a chave estrangeira do relacionamento entre convênio e médico. </li>
<li>Criar entidade entre internação e enfermeiro. </li>
<li>Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente). </li>
<li>Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022. </li>
<li>Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes. </li>
<li>Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros. </li>
<li>Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado. </li>
</ul>
</p>
<br>

## 

## ⚡Parte 4 - AlterAndo a tabela

<br>
<p>
Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:

Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 
</p>
<img align='center' src='ALTERando_Tabela.png'/>

## 

## ⚡Parte 4 - Estruturando e testando 

* Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
```
SELECT *, AVG(valor_consulta) 
FROM consulta 
WHERE YEAR(data_hora) = 2020 
GROUP BY id 
LIMIT 1000;
```
* Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
```
select * from internacao
where data_alta > data_prev_alta;
```
* Receituário completo da primeira consulta registrada com receituário associado.
```
select * from consulta inner join receita on consulta.id = receita.id inner join paciente 
on paciente.id = consulta.id order by receita.id limit 1;
```
* Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
```
SELECT consulta.*, MAX(consulta.valor_consulta) AS max_valor_consulta, MIN(consulta.valor_consulta) AS min_valor_consulta 
FROM consulta
INNER JOIN paciente ON consulta.paciente_id = paciente.id
WHERE paciente.convenio_id IS NULL
GROUP BY consulta.id;
```
* Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
```
select *, DATEDIFF(data_alta, data_entrada) dias_internado, tipo_quarto.valor_diaria,
DATEDIFF(data_alta, data_entrada) * tipo_quarto.valor_diaria valor_total 
from internacao 
inner join quarto 
on internacao.quarto_id = quarto.id
inner join tipo_quarto 
on quarto.id = tipo_quarto.id;
```
* Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
```
select internacao.id, internacao.data_entrada, internacao.descricao_procedimento, quarto.numero 
from internacao 
inner join quarto 
on quarto.id = internacao.quarto_id where quarto.id = 1; 
```
* Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
```
SELECT p.nome AS nome_paciente, c.data_hora, m.especialidade_id
FROM consulta AS c
INNER JOIN paciente AS p ON c.paciente_id = p.id
INNER JOIN medicos AS m ON c.medico_id = m.id
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data_hora) < 18
  AND m.especialidade_id <> 'pediatria'
ORDER BY c.data_hora;
```
* Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
```
SELECT p.nome AS nome_paciente, m.nome AS nome_medico, i.data_entrada, i.descricao_procedimento
FROM internacao AS i
INNER JOIN paciente AS p ON i.paciente_id = p.id
INNER JOIN medicos AS m ON i.medico_id = m.id
WHERE m.especialidade_id = '1';
```
* Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
```
select m.nome, count(c.medico_id) as 'Qntd de consultas' from medicos m inner join consulta c 
on c.medico_id = m.id group by c.medico_id;
```
* Todos os médicos que tenham "Gabriel" no nome. 
```
select * from medicos where nome like '%Gabriel%';
```
* Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
```
SELECT enf.nome AS nome_enfermeiro, enf.cre, COUNT(*) AS numero_internacoes
FROM enfermeiro AS enf
INNER JOIN internacao AS i ON enf.id = i.enfermeiro_id
GROUP BY enf.id, enf.nome, enf.cre
HAVING COUNT(*) > 1;
```
<!-- CONTACT -->
## Contact

Giovanni Moreira - [Linkedin](https://www.linkedin.com/in/giovanni-moreira-64654a254/)

Project Link: [https://github.com/4Diovanni/Data-Base-Hospital.git](https://github.com/github_username/repo_name)
