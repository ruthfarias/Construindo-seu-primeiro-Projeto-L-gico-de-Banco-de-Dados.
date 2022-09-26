drop schema if exists joins;
create schema joins;
use joins;

create table departamentos(
	id int PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	sigla VARCHAR(5)
);

create table funcionarios(
	id int PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	telefone VARCHAR(15),
	endereco VARCHAR(50),
	bairro VARCHAR(20),
	cep VARCHAR(8),
	salario double,
	cidade VARCHAR(20),
	departamento_id int,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

insert into departamentos values (NULL, 'Compras', 'COMPR');
insert into departamentos values (NULL, 'Comercial', 'COMER');
insert into departamentos values (NULL, 'Financeiro', 'FINAN');
insert into departamentos values (NULL, 'Marketing', 'MARKE');
insert into departamentos values (NULL, 'Diretoria', 'DIRET');	
				
insert into funcionarios values (NULL, 'Maria João', '99070012', 'Av. Gov José Malcher, 2460', 
'São Bras', '66060281', 1500.80, 'Belém', 1);
insert into funcionarios values (NULL, 'Pedro Zamora', '99989988', 'Av. Magalhães Barata, 1360', 
'Nazaré', '66055090', 2300.12, 'Belem', 2);
insert into funcionarios values (NULL, 'Andrea Pinho', '99989988', 'Boaventura da Silva, 678, ap 304', 
'Umarizal', '66075080', 4080.50, 'BELEM', 2);
insert into funcionarios values (NULL, 'Mario Silva', '2223234', 'Cidade Nova IV, 3456', 
'São Bras', '66060281', 1200.80, 'Ananindeua', 5);
insert into funcionarios values (NULL, 'Felipe Almeida', '99980088', 'Av. Roberto Camelier, 2360', 
'Jurunas', '66055090', 9300.72, 'Belem', 4);
insert into funcionarios values (NULL, 'Rafael Bezerra', '99345688', 'Passagem Maxima, 678, ap 304', 
'Marco', '66075080', 4080.50, 'BELEM', 3);
insert into funcionarios values (NULL, 'Katia Santos', '98760012', 'Trav Mauriti, 2460', 
'Marco', '66060281', 700.80, 'Belém', 4);
insert into funcionarios values (NULL, 'Gustavo Pinto', '22389988', 'Passagem Barata, 1360', 
'Cidade Nova IV', '66055090', 2300.12, 'Ananindeua', 2);
insert into funcionarios values (NULL, 'Anderson Marques', '32289988', '40 horas, 678', 
'Coqueiro', '66075080', 8900.50, 'Ananindeua', 1);
insert into funcionarios values (NULL, 'Renato Hudson', '34553234', 'Passagem Tereza, 3456', 
'Cidade Nova V', '66060281', 1450.80, 'Ananindeua', 5);
insert into funcionarios values (NULL, 'Tiago Alves', '78889988', 'Av. Magalhães Barata, 1360', 
'Nazaré', '66055090', 2990.62, 'Belem', 4);
insert into funcionarios values (NULL, 'Mario Antonio', '23489988', 'Boaventura da Silva, 678, ap 304', 
'Umarizal', '66075080', 4080.50, 'BELEM', 3);
insert into funcionarios values (NULL, 'Maria Silva', '32470012', 'Av. Gov José Malcher, 2460', 
'São Bras', '66060281', 1500.80, 'Belém', 2);
insert into funcionarios values (NULL, 'Jean Zorat', '88789988', 'Av. Magalhães Barata, 1360', 
'Nazaré', '66055090', 2823.99, 'Belem', 1);
insert into funcionarios values (NULL, 'Andre Ribeiro', '76589988', 'Boaventura da Silva, 678, ap 304', 
'Umarizal', '66075080', 3567.50, 'BELEM', 2);
insert into funcionarios values (NULL, 'Matheus Carmo', '87893234', 'Cidade Nova IV, 3456', 
'São Bras', '66060281', 1689.90, 'Ananindeua', 4);
insert into funcionarios values (NULL, 'Daniel Dantes', '22989988', 'Av. Magalhães Barata, 1360', 
'Nazaré', '66055090', 2800.12, 'Belem', 3);
insert into funcionarios values (NULL, 'Zumira Castro', '99989988', 'Boaventura da Silva, 678, ap 304', 
'Umarizal', '66075080', 8080.00, 'BELEM', 4);

-- Selecione apenas o nome, telefone e salario dos funcionários que pertencem ao departamento compras;

select nome, telefone, salario from funcionarios where departamento_id =1;

-- Quais os departamentos dos funcionários com o salário maior que R$ 3.000,00

SELECT departamentos.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where salario > 3000;

-- Selecione os nome do departamento e nome dos funcionários com o salário entre R$ 2.000,00 e R$ 4.000,00

SELECT departamentos.nome, funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where salario  between 2000 and 4000;

-- Selecione os funcionários e departamentos que não moram em Belém

SELECT departamentos.nome, funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where cidade !='Belem';

-- Selecione os funcionários e departamento que moram no bairro de São Bras ou que tenham salário superior a R$ 2.500,00

SELECT departamentos.nome, funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where salario > 2500 or bairro = 'São Bras';

-- Selecione os funcionarios que pertençam ao departamento iniciado com a letra C

SELECT  funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where departamentos.nome like 'C%';

--  Selecione os nomes dos funcionários ordenados pelo maior salário, dos departamentos: Compras, Financeiro e Marketing

SELECT  funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where departamentos.nome = ('Compras'or 'financeiro' or 'Marketing') 
order by salario desc;

-- Selecione os funcionários que moram fora de Belém ou com salario inferior a R$ 3.000,00 que não sejam da Diretoria ordenados pelo maior salario

SELECT  funcionarios.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where (cidade != 'Belem' or (salario < 3000 and departamentos.nome != 'Diretoria') )order by salario desc;

-- Selecione os salarios, e departamento de quem mora nos bairros: São Bras, Umarizal e Nazaré, ordenados pelo maior salário
SELECT  funcionarios.salario, departamentos.nome FROM departamentos
INNER JOIN funcionarios on funcionarios.departamento_id = departamentos.id where (bairro = 'São Bras' or 'Umarizal' or'Nazaré')order by salario desc;




