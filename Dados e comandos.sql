/* modelagem Básica - 
ENTIDADE = TABELA 
CAMPOS = ATRIBULTOS
*/ 

CLIENTE 

NOME - CRACTERE(30)
CPF - NUMERICO (11)
EMAIL - CARACTERE (30)
TELEFONE - CARACTERE (30)
ENDERECO - CARACTERE (100)  
SEXO - CARACTERE (1)


/*PROCESSOS DE MODELAGEM*/


/*FASE 01 E 02 - SÃO FEITAS PELO ADM DE DADOS*/
MODELAGEM CONCEITUAL - rascunho dos tipos de dados que o programa terá.
MODELAGEM LOGICA -

/*FASE 03 - DBA / AD */
MODELAGEM FISICA - SCRIPTS DE BANCO

/* INICIANDO MODELAGEM FISICA */

/*COMANDO PARA CRIAR BANCO DE DADOS*/
create database exemplo;

CREATE DATABASE PROJETO;

/*COMANDO PARA SE CONECTAR AO BANCO DE DADOS*/
USE PROJETO;

/*CLIENTE PARA CRIAR UMA TABELA DE CLIENTES*/
CREATE TABLE CLIENTE (
 NOME VARCHAR (30),
 SEXO CHAR (1),
 EMAIL VARCHAR (30),
 CPF CHAR (11),
 TELEFONE VARCHAR (30),
 ENDERECO VARCHAR (100)
);

/*comando para APAGAR UMA TABELA*/
DROP TABLE NOME_TABELA;

/*VERIFICANDO AS TABELAS DO BANCO */
SHOW TABLES;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */
DESC CLIENTE;





/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*SINTAXE BÁSICA DE INSERÇÃO DA DADOS  - INSERT INTO TABELA...*/
INSERT INTO CLIENTE VALUES ('GUILHERME', 'M', 'GUILHERME@GMAIL.COM', '12345612321' , '11990098884', 'GONÇALVES DIAS 126 - BARUERI - SP');


INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF, TELEFONE, ENDERECO) VALUES ('GUILHERME', 'M', 'GUILHERME@GMAIL.COM',NULL, '11990031889', 'GONÇALVES DIAS 126 - BARUERI - SP');

/*ENTRADA DE DADOS2*/
INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF, TELEFONE, ENDERECO) VALUES ('JUJU', 'F', 'JUJUGMAIL.COM', 112, '11990389779', 'CASA 31 DA RUA');

/* ENTRADA DE DADOS 3 - FORMA COMPACTA */
INSERT INTO CLIENTE VALUES ('ANA', 'F', 'ANA@GLOBO.COM',123, '54335618998', 'PRES ANTONIO CARLOS - CENTRO - SP'),
                                         ('CARLA','F','CARLA@TERRA.COM.BR',122,'66587458','SAMUEL - CENTRO -MG');
										 


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/



/* COMANDO SELECT - 
esse comando tratasse de uma projeção.

para usar o comando vamos digitar (select A, B, C form )

*/

SELECT NOW() AS DATA_HORA, 'GUILHERME SILVA' AS 'ALUNO';
/*COMANDO QUE VAI MOSTRAR DATA E HORA*/

SELECT 'GUILHERME SILVA';
/*MOSTRAR GUILHERME SILVA*/

SELECT NOME, SEXO, EMAIL FROM CLIENTE;
/*VAI MOSTRAR NOME, SEXO, EMAIL DA TABELA CLIENTE*/

SELECT NOME AS CLIENTE, SEXO, ENDERECO FROM CLIENTE;
/*VAI MOSTRAR NOME DA TABELA_CLIENTE, SEXO, ENDERECO, DE TABELA_CLIENTE;*/

/*MOSTRA NA TABELA  OS SEGUINTE DADOS, NOME, SEXO, EMAIL, ENDERECO*/
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;


SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;


/*NÃO USAR ESSE COMANDO EM EMPRESA, SOMENTE PARA FINS ACADEMICOS.

quando pedimos para o banco de dados mostrar todos os dados, ele não conseguirá pois será muitos dados, sem contar que na grande maioria das consultas o cliente que pediu
o banco pede que o banco mostre algo exato, como nome e telefone.
*/
-- comando para ver todos os dados de uma tabela;   
SELECT * FROM CLIENTE;








/*SELEÇÃO DE GRUPOS ESPECIFICOS (WHERE)*/
/*Selecinor nome, sexo da tabela cliente (where) com sexo sendo 'm'*/
/*EXEMPLO TRAGA TODOS SEXO 'M'*/
SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'm';


/*OPERADOR LIKE*/
/*ESSE CAMPO TRAZ TODOS OS CAMPOS QUE TEM O DADO RJ EM ENDERECO*/
/*SELECIONE NOME, SEXO DE TABALA_CLIENTE QUANDO CAMPO_ENDEREÇO COMO 'RJ';*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';

/*CARACTER CORINGA*/
/*SELECIONAR NOME, SEXO DA TABELA_CLIENTES QUANDO CAMPO_ENDERECO COMO'FINAL RJ';*/

/*obs: o simbolo de porcentagem (% diz que queremos os dados do final).*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';
/*OBS: o simbolo no final diz que queremos o dado que esteja dentro de endereco e tenha rj no inicio*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'RJ%';
/*OBS: o simbolo '%x%' diz que queremos o dado que está no meio de um campo*/

/*Nós traz o dado que está quem tem a palavra casa dentro do nosso campo endereço*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%casa%';

/*Comando para adicionar mais de uma condição
selecionar autor, sexo da tabela-info quando sexo for = 'm' e uf = 'sp' ou uf = 'rj';*/
SELECT AUTOR, SEXO FROM INFO WHERE SEXO = 'M' AND UF = 'SP' OR UF = 'RJ';


select nome, email, telefone from cliente where sexo = 'm' or endereco like = '%mg';

/*exercicio*/
/*
1-	Trazer todos os dados.
2-	Trazer o nome do livro e o nome da editora.
3-	Trazer o nome do livro e a uf dos livros publicados por autores do sexo masculino.
4-	Trazer o nome do livro e a uf dos livros publicados por autores do sexo feminino.
5-	Trazer os valores dos livros das editoras de são Paulo.
6-	Trazer os dados dos autores do sexo masculinho que tiveram livros publicados por são Paulo ou rio de janeiro (questão desafio).
Necessário uma tabela com os seguintes campos: nome do livro, nome do autor, sexo do autor, 
numero de páginas, nome da editora, valor do livro, estado (uf) da editora ano publicado.
*/
/*comandos
create database livros;

use livros;

create table info (
livro varchar (30),
autor varchar (30),
sexo char (1),
pagina char (10),
editora varchar (100),
valor varchar (5),
uf char (2),
ano char (4) 
);


INSERT INTO INFO (LIVRO, AUTOR, SEXO, PAGINA, EDITORA, VALOR, UF, ANO)
VALUES 
('BRIDA', 'PAULO COELHO', 'M', '258', 'BOOKET', '29,99', 'RJ', '2014');

INSERT INTO INFO (LIVRO, AUTOR, SEXO, PAGINA, EDITORA, VALOR, UF, ANO)
VALUES 
('Almanaque', 'ANA PAULA', 'F', '345', 'PANDA BOOKS', '25,99', 'PR', '2012');

INSERT INTO INFO (LIVRO, AUTOR, SEXO, PAGINA, EDITORA, VALOR, UF, ANO)
VALUES 
('AGAHTA UMA BIOGRAFIA', 'AGATHA CHRISTIE', 'F', '476', 'BEST SELLER', '59,99', 'SP', '2018');


SELECT LIVRO FROM INFO;

SELECT LIVRO, UF FROM INFO WHERE SEXO = 'M';

SELECT LIVRO, UF FROM INFO WHERE SEXO = 'F';

SELECT VALOR FROM INFO WHERE UF = 'SP';

SELECT AUTOR, SEXO FROM INFO WHERE SEXO = 'M' AND UF = 'SP' OR UF = 'RJ';

*/




/*tabela verdade
Esse exemplo é como se fosse o if, else e elif do python.
Se céu for azul apresente sim.
Se céu não for azul apresente n.
Esse exemplo é como se fosse o if, else e elif do python.
Se céu for azul apresente sim.
Se céu não for azul apresente n.*/
SELECT AUTOR, SEXO FROM INFO WHERE SEXO = 'M' AND UF = 'SP' OR UF = 'RJ';



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*CRIANDO CONDIÇÃO*/

/*OR - OU*/
select nome, sexo, endereco from cliente
where 
sexo = 'm' or endereco like '%rj';

select nome, sexo, endereco from cliente
WHERE
sexo = 'f' or endereco like '%barueri';

/*AND - E*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE 
WHERE
SEXO = 'M' and endereco like '%rj';

select nome, sexo, endereco from cliente 
where 
sexo = 'f' and endereco like '%barueri';


/*Operadore lógicos.

(OR) -> Para a saída da query seja verdadeira, basta que apenas uma condição seja verdadeira. 
(AND) -> Para que a saída seja verdadeira todas as condições precisam ser verdadeira. 
*/


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


/*Funções de tabelas*/

/*CONTA A QUANTIDADE DE REGISTROS DE UMA TABELA*/
SELECT COUNT(*) FROM NOME-TABELA;

/*SEPARA E CLASSIFICA QUANTOS REGISTROS TEMOS DE UMA CIDADE*/
SELECT CIDADE, COUNT(*) FROM CLIENTE GROUP BY CIDADE;

/*condição
sexo = f 
cidade = rio de janeiro
*/

/*situação - tratando com OU / OR
70% mulheres = sexo = f
30% mora no rio de janeiro*/

/*MOSTRA NOME E SEXO QUANDO O CLIENTE TIVER O SEXO F OU FOR DA CIDADE DO RIO DE JANEIRO*/
SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

/*SITUAÇÃO TRATANDO COM E / AND
70% DAS MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO*/

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';




/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/



/*
Exercício de fixação;
Nome do banco: exercício.
Nome da tabela: funcionários.
Campos: idFuncionario, nome, email, sexo, departamento, admissão, salario, cargo, idRegião.

Departamentos, filmes, roupas, lar, jardim
Insira 5 funcionários com dados fictícios 

Exigências: Querie que traga os funcionários que trabalham no departamento de filmes ou no departamento de roupas.

O gestor de marketing pediu a lista das funcionárias que trabalham no departamento de filmes ou no departamento de lar.

Ele necessita enviar um e-mail para os colaboradores desses dois setores.

Como estamos trabalhando com AND, colocamos o departamento primeiro, pois ele irá checar a segunda condição, um número menor de vezes.
Traga os funcionários do sexo masculinos ou funcionários que trabalham no jardim.*/




create database exercicio;

use excercicio;

create table funcionarios (
nome varchar (50),
email varchar (40),
sexo char (1),
departamento varchar (20),
admisao VARCHAR (8),
salario varchar (7),
cargo varchar (25),
regiao varchar (10) 
);

insert into funcionarios (nome, email, sexo, departamento, admisao, salario, cargo, regiao) 
values 
('guilherme da silva', 'forcecell954@gmail.com', 'M', 'filmes', '09/2001', '1250', 'vendedor', 'barueri');


insert into funcionarios (nome, email, sexo, departamento, admisao, salario, cargo, regiao) 
values 
('Agatha taina silva', 'agathatata23@gmail.com', 'F', 'roupas', '10/2001', '2500', 'administrador', 'guarulhos');

insert into funcionarios (nome, email, sexo, departamento, admisao, salario, cargo, regiao) 
values 
('paulo cezar', 'paulogabriel@gmail.com', 'M', 'jardim', '02/2012', '1800', 'cuidado', 'jandira');

insert into funcionarios (nome, email, sexo, departamento, admisao, salario, cargo, regiao) 
values 
('francisco garcia', 'francis668@gmail.com', 'M', 'lar', '05/2009', '1900', 'vendedor', 'osasco');

insert into funcionarios (nome, email, sexo, departamento, admisao, salario, cargo, regiao) 
values 
('fernando silva', 'fernadolol@gmail.com', 'M', 'filmes', '08/2012', '2600', 'acessor', 'barueri');

/*funcionários que trabalham no departamento de filmes ou no departamento de roupas*/
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO, ADMISAO, CARGO, REGIAO FROM FUNCIONARIOS 
WHERE DEPARTAMENTO = 'FILMES' OR DEPARTAMENTO = 'ROUPAS';

/*funcionárias que trabalham no departamento de filmes ou no departamento de lar*/
SELECT NOME, EMAIL, SEXO, DEPARTAMENTO, ADMISAO, CARGO, REGIAO FROM FUNCIONARIOS 
WHERE DEPARTAMENTO = 'FILMES' OR DEPARTAMENTO = 'LAR';

/*funcionários do sexo masculinos ou funcionários que trabalham no jardim.*/
SELECT DEPARTAMENTO, EMAIL, NOME, CARGO, SEXO, ADMISAO,  REGIAO FROM FUNCIONARIOS 
WHERE SEXO = 'M' AND DEPARTAMENTO = 'JARDIM';

/*CORREÇÃO DO PROFESSOR*/

/*Exibe a quantidade de funcionarios*/
select count(*) from funcionarios;

/*mostra a quantidade de registros por grupo especifico de departamento.*/
SELECT COUNT(*) FROM NOME-TABELA
GROUP BY SEXO;

select count(*), departamento
from funcionarios 
group by departamento;


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*FILTRANDO VALORES NULOS*/


/*inserindo dado vazio*/
INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF, TELEFONE, ENDERECO) 
VALUES
('PESSOA NULA', 'M', '', '54994382895', '11994304878', 'CASA DE CIPO DO RIO ALAGOAS'); 

/*busca o cliente que tem o dado vazio*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
EMAIL = '';

/*busca todos os cliente que tem um email preenchido no banco*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
EMAIL IS NOT NULL;

/*
is null / is not nul

esse comando pode ser utilizado para representar os dados nulos
*/

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*
Clausula Update
*/

/*Comando para alterar algum campo da tabela*/

UPDATE CLIENTE 
SET EMAIL = 'EMAILNOVO@GMAIL.COM'
WHERE NOME = 'PESSOA NULA';


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*Clausula delete*/

/*OBS: preste bastante atenção nessa parte!*/

DELETE FROM CLIENTE 
WHERE 
NOME = 'PESSOA NULA';


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/


/*
PRIMEIRA FORMA NORMAL


1- TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA

[AMARELO, AZUL, LARANJA, VER] -> CORES
[KA, FIESTA, UNO, CIVIC] -> CARROS


2- TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA 
QUANDO O CAMPO FOR DIVISIVEL.

3-	Toda tabela necessita de pelo menos um campo que identifique doto o registro como sendo único.
OBS: isso é o que chamamos de chave primaria ou primary key.
Sendo assim nossa chave primária é o campo do registro que consegue identificar a pessoa, sendo algo que somente ela tem.
Exemplo: 
O campo CPF é o que toda pessoa brasileira tem diferente do outro, contudo estimasse que em algum tempo ocorrerá uma 
mudança que irá sumir o cpf e o rg, então imagine a grande confusão que seria.



4- tipos de chaves:
Chave natural: pertence a pessoa, podendo ser CPF ou RG.
Chave Artificial: É um id que foi adicionado no início da tabela que representará cada usuário
em especifico. Pense como os bilhetes de atendimento de banco, onde de acordo com a chegada você 
recebeu uma senha e foi atendido.




*/


NOME BANCO: BANCOOF 


CREATE DATABASE BANCOOF;
USE BANCOOF;

CREATE TABLE CLIENTES (
NOME VARCHAR (100),
SEXO CHAR (1),
IDADE VARCHAR (3),
ENDERECO VARCHAR (100)
);

INSERT INTO CLIENTES (NOME, SEXO, IDADE, ENDERECO) 
VALUES 
('GUILHERME DA SILVA PESSOA LUCAS', 'M', '20', 'RUA GONÇALVES DIAS 126 - JARDIM TUPÃ BARUERI - SP');

INSERT INTO CLIENTES (NOME, SEXO, IDADE, ENDERECO) 
VALUES
('AGATHA THAINÁ SILVA', 'F', '19', 'AVENIDA DOIS CORREGOS 230, ARISTON CARAPICUIBA');

INSERT INTO CLIENTES (NOME, SEXO, IDADE, ENDERECO) 
VALUES
('ALEXANDRO DA SILVA PESSOA', 'M', '17', 'RUA VINTE E DOIS DE MARÇO SÃO-PAULO');

INSERT INTO CLIENTES (NOME, SEXO, IDADE, ENDERECO) 
VALUES
('GUILHER DA PERREIRA SANTOS', 'M', '13', 'RUA VINTE E DOIS DE MARÇO SÃO-PAULO');


SELECT NOME, SEXO, IDADE, ENDERECO FROM CLIENTES 
WHERE NOME LIKE '%GUILHER%';


UPDATE CLIENTES
SET NOME = 'GUILHERME PERREIRA SANTOS'
WHERE NOME = 'GUILHER DA PERREIRA SANTOS';

SELECT NOME, SEXO, IDADE, ENDERECO FROM CLIENTES
WHERE SEXO = 'F' OR IDADE = '20';

INSERT INTO 










/*TRABALHANDO COM CHAVES PRIMARIAS - CONECTANDO TABELAS*/



CREATE DATABASE BANCO;

USE BANCO;

CREATE TABLE CLIENTE01 (
   
   IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, /*DIZEMOS AO BANCO QUE ID É UMA CHAVE PRIMARIA E AUTOINCREMENTE DIZ QUE ELE DEVE CONTAR*/
   NOME VARCHAR (30) NOT NULL,  /*NOTE NULL DIZ QUE O CAMPO É OBRIGATÓRIO*/
   SEXO ENUM ('M', 'F') NOT NULL, /*ENUM SIGNIFICA QUE IRÁ APARECER ESSAS OPÇÕES*/
   EMAIL VARCHAR (50) UNIQUE, /*UNIQUE DIZ QUE O VALOR NÃO PODE SE REPETIR*/
   CPF VARCHAR (15) UNIQUE
   );

CREATE TABLE ENDERECO (
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
RUA VARCHAR (30) NOT NULL,
BAIRRO VARCHAR (30) NOT NULL,
CIDADE VARCHAR (30) NOT NULL,
ESTADO CHAR (2) NOT NULL,
ID_CLIENTE INT UNIQUE, /*KEY obs: DEVE DEFINIR QUE A CHAVE É UNICA*/

/*regra de chave*/
FOREIGN KEY (ID_CLIENTE) /*DEFINE QUE ID_CLIENTE SERÁ A KEY DE CONEXÃO*/
REFERENCES CLIENTE01 (IDCLIENTE)/*DIZ QUE IDCLIENTE A TABELA CLIENTE É A KEY */
);

CREATE TABLE TELEFONE (
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
TIPO ENUM ('RES', 'COM', 'CEL') NOT NULL,
NUMERO VARCHAR (10) NOT NULL,
ID_CLIENTE INT, /*KEY*/

/*regra de chave*/
FOREIGN KEY (ID_CLIENTE) /*QUEM É A KEY? = ID_CLIENTE*/
REFERENCES CLIENTE01 /*A REFERENCIA É TABELA CLIENTE 01*/ ( IDCLIENTE/*CAPO DA TABELA PRINCIPAL*/)
);


/*ENDEREÇO OBRIGATÓRIO, CADASTRO SOMENTE DE UM
TELEFONE OBRIGATÓRIO CADASTRI DE MAIS DE UM (OPCIONAL) */

/*CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA QUE VAIATÉ OUTRA
TABELA PARA FAZER REFERÊNCIA ENTRE REGISTRO*/





/*EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA*/

/*
TEMOS UMA PADADRIA E QUEREMOS CADASTRAR NOSSOS CLIENTES PARA DEIXAR SEUS
DEBITOS REGISTRADOS

EXEMPLO: TEMOS O CLIENTE E O SEU ENDEREÇO, SENDO ASSIM SERÁ UMA TÁBELA COM
OS DADOS DO CLIENTE E OUTRA COM O INDEREÇO, 

EXEMPLO 2: TEMOS UM ESTACIONAMENTO, AGORA PENSE O QUE SERÁ MAIS NECESSÁRIO 
REGISTRAR O CLIENTE OU O CARRO? OBVIAMENTE É O CARRO. 

NESTES EXEMPLOS DE RELACIONAMENTO 1 X 1 COMO PRECISAMOS DE UTILIZAR A CHAVE
ESTRANGEIRA MAIS FRACA  IRIMOS UTILIZAR AS TABELAS ENDEREÇO PARA A PADARIA
E CLIENTE PARA O ESTACIONAMENTO*/



/*EM RELACIONAMENTOS 1 X N A CHAVE ESTRANGEIRA FICA SEMPRE NA CARDINALIDADE*/




/*INSERINDO O VALOR NA TABELA CLIENTES.*/

INSERT into cliente01 VALUES (NULL, 'GUI', 'M', 'GUINA847@GMAIL.COM', '76657587887');

INSERT into cliente01 VALUES (NULL, 'PAULO', 'M', 'PAULO@GMAIL.COM', '76657587886'); 

INSERT into cliente01 VALUES (NULL, 'CLARA', 'F', 'NULL', '76657587885');


/*RESULTADOS INSERIDOS.
OBS: note que idcliente é unico. Cada individuo possui o seu.*/
+-----------+-------+------+--------------------+-------------+
| IDCLIENTE | NOME  | SEXO | EMAIL              | CPF         |
+-----------+-------+------+--------------------+-------------+
|         1 | GUI   | M    | GUINA847@GMAIL.COM | 76657587887 |
|         4 | PAULO | M    | PAULO@GMAIL.COM    | 76657587886 |
|         5 | CLARA | F    | NULL               | 76657587885 |
+-----------+-------+------+--------------------+-------------+


/*INSERINDO O VALOR NA TABELA ENDERECO.*/

INSERT INTO ENDERECO VALUES (NULL, 'GONÇALVES DIAS', 'BARUERI', 'SÃO PAULO', 'SP',1); /*o VALOR 1 É REFERENTE AO IDCLIENTE DA TABELA CLIENTE*/

INSERT INTO ENDERECO VALUES (NULL, 'GENERAL TEODORO', 'FRANCA', 'SÃO PAULO', 'SP',4); /*o VALOR 4 É REFERENTE AO IDCLIENTE DA TABELA CLIENTE*/

INSERT INTO ENDERECO VALUES (NULL, 'MARCOS ANTONIO SANTOS', 'BARUERI', 'MINAS GERAIS', 'MG',5); /*o VALOR 5 É REFERENTE AO IDCLIENTE DA TABELA CLIENTE*/

/*RESULTADOS*/
+------------+-----------------------+---------+--------------+--------+------------+
| IDENDERECO | RUA                   | BAIRRO  | CIDADE       | ESTADO | ID_CLIENTE |
+------------+-----------------------+---------+--------------+--------+------------+
|          1 | GONÇALVES DIAS        | BARUERI | SÃO PAULO    | SP     |          1 |
|          3 | GENERAL TEODORO       | FRANCA  | SÃO PAULO    | SP     |          4 |
|          4 | MARCOS ANTONIO SANTOS | BARUERI | MINAS GERAIS | MG     |          5 |
+------------+-----------------------+---------+--------------+--------+------------+




/*INSERINDO O VALOR NA TABELA telefone.*/

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '1199003188', 1); /*VALOR 1 REPRESENTA O CLIENTE GUI*/

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '1198432892', 4); /*VALOR 4 REPRESENTA O CLIENTE PAULO*/

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '1193843782', 5); /*VALOR 5 REPRESENTA O CLIENTE CLARA*/

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '119900319',5);

INSERT INTO TELEFONE VALUES (NULL, 'COM', '119903819',5);

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '119900319',5);

INSERT INTO TELEFONE VALUES (NULL, 'RES', '119480639',5);

INSERT INTO TELEFONE VALUES (NULL, 'COM', '119900319',5);

INSERT INTO TELEFONE VALUES (NULL, 'CEL', '119900319',5);


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
/*realizando teste de criação de id para clientes.*/


teste
nome banco =  teste
tabela cliente = cliente

create table cliente (
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
nome varchar (30),
sexo char (1),
nascimento varchar (10)
);
/*dados guilherme*/
INSERT INTO CLIENTE VALUES (NULL, 'GUILHERME DA SILVA', 'M', '04/09/2001');
/*dados marina*/
INSERT INTO CLIENTE VALUES (NULL, 'MARINA PESSOA SILVA', 'F', '05/07/1993');
/*dados marcio*/
INSERT INTO CLIENTE VALUES (NULL, 'MARCIO PERREIRA SANTO', 'M', '07/02/1986');

CREATE TABLE TELEFONE (
IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
TIPO ENUM ('CEL', 'RES', 'COM') NOT NULL,
TELEFONE VARCHAR (11) NOT NULL
);

/*dados guilherme*/
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '11990031889');
/*dados marina*/
INSERT INTO TELEFONE VALUES (NULL, 'COM', '36987432895');
/*dados marcio*/
INSERT INTO TELEFONE VALUES (NULL, 'RES', '36994832895');



CREATE TABLE ENDERECO (
IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
CIDADE VARCHAR (20),
BAIRRO VARCHAR (20),
RUA VARCHAR (30),
NUMERO VARCHAR (5),
ESTADO CHAR (2)
);

/*dados guilherme*/
INSERT INTO ENDERECO 
VALUES 
(NULL, 'BARUERI', 'JARDIM TUPÃ', 'GONÇALVES DIAS', '126', 'SP');

/*dados marina*/
INSERT INTO ENDERECO 
VALUES 
(NULL, 'CLARAVAL', 'SANTA CRUZ', 'PADRE ANTÔNIO SOUZA', '9', 'MG');

/*dados marcio*/
INSERT INTO ENDERECO 
VALUES 
(NULL, 'FRANCA', 'EDEM', 'MACHADO DE ASSIS', '56', 'SP');


/*tabela cliene*/
+-----------+-----------------------+------+------------+
| IDCLIENTE | nome                  | sexo | nascimento |
+-----------+-----------------------+------+------------+
|         1 | GUILHERME DA SILVA    | M    | 04/09/2001 |
|         2 | MARINA PESSOA SILVA   | F    | 05/07/1993 |
|         3 | MARCIO PERREIRA SANTO | M    | 07/02/1986 |
+-----------+-----------------------+------+------------+

/*tabela telefone*/
+------------+------+-------------+
| IDTELEFONE | TIPO | TELEFONE    |
+------------+------+-------------+
|          1 | CEL  | 11990031889 |
|          2 | COM  | 36987432895 |
|          3 | RES  | 36994832895 |
+------------+------+-------------+

/*tabela endereço*/
+------------+----------+-------------+---------------------+--------+--------+
| IDENDERECO | CIDADE   | BAIRRO      | RUA                 | NUMERO | ESTADO |
+------------+----------+-------------+---------------------+--------+--------+
|          1 | BARUERI  | JARDIM TUPÃ | GONÇALVES DIAS      | 126    | SP     |
|          2 | CLARAVAL | SANTA CRUZ  | PADRE ANTÔNIO SOUZA | 9      | MG     |
|          3 | FRANCA   | EDEM        | MACHADO DE ASSIS    | 56     | SP     |
+------------+----------+-------------+---------------------+--------+--------+

/*Chamada de dados*/
SELECT NOME , SEXO, TIPO, TELEFONE 
FROM CLIENTE
INNER JOIN  TELEFONE
ON IDCLIENTE = IDTELEFONE;


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/






/*SELEÇÃO PROJEÇÃO E JUNÇÃO*/

/*
Projeção: É tudo o que queremos ver na tela. Exemplo: Select * from clientes; mostra todos os dados da tabela cliente, 
exibindo as informações. 

Seleção: Estamos selecionando os dados que queremos ver, exemplo select nome, sexo, email from cliente 
Where sexo = ‘F’; neste caso queremos que o banco retorne nome, email, sexo somente das pessoas do sexo feminino.

Junção - Join:

*/

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE01;
+-------+--------------------+-----------+
| NOME  | EMAIL              | IDCLIENTE |
+-------+--------------------+-----------+
| GUI   | GUINA847@GMAIL.COM |         1 |
| PAULO | PAULO@GMAIL.COM    |         4 |
| CLARA | NULL               |         5 |
+-------+--------------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;
+------------+---------+--------------+
| ID_CLIENTE | BAIRRO  | CIDADE       |
+------------+---------+--------------+
|          1 | BARUERI | SÃO PAULO    |
|          4 | FRANCA  | SÃO PAULO    |
|          5 | BARUERI | MINAS GERAIS |
+------------+---------+--------------+

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE01, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;
+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| GUI   | M    | BARUERI | SÃO PAULO    |
| PAULO | M    | FRANCA  | SÃO PAULO    |
| CLARA | F    | BARUERI | MINAS GERAIS |
+-------+------+---------+--------------+

/*obs: acima fizemos a junção de 3 tabelas e coletamos os dados de acordo com o id
Contudo esse método não pode ser utilizado pois está incorreto.*/

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE01, ENDERECO  /*apontar tábelas, nome e sexo = tabela cliente01 e bairro e cidade = tabela endereco.*/
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';


/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/*JUNÇÃO JOIN Comando para apresentar dados de varias tábelas.*/ 
SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE01 
INNER JOIN ENDERECO /*ME JUNTE COM*/
ON IDCLIENTE * ID_CLIENTE; /*INDICANDO ONDE ESTÁ AS CHAVES DE CADA TABELA*/
+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| CLARA | F    | BARUERI | SÃO PAULO    |
| PAULO | M    | BARUERI | SÃO PAULO    |
| GUI   | M    | BARUERI | SÃO PAULO    |
| CLARA | F    | FRANCA  | SÃO PAULO    |
| PAULO | M    | FRANCA  | SÃO PAULO    |
| GUI   | M    | FRANCA  | SÃO PAULO    |
| CLARA | F    | BARUERI | MINAS GERAIS |
| PAULO | M    | BARUERI | MINAS GERAIS |
| GUI   | M    | BARUERI | MINAS GERAIS |
+-------+------+---------+--------------+

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE01
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;



/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/




/*INNER JOIN COM MAIS DE DUAS TABELAS
As tabelas devem ter nome, sexo, bairro, cidade, tipo, numero.
*/

SELECT CLIENTE01.NOME, CLIENTE01.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO 
FROM CLIENTE01
INNER JOIN ENDERECO
ON CLIENTE01.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE01.IDCLIENTE = TELEFONE.ID_CLIENTE;


/*RESULTADO*/
mysql> SELECT CLIENTE01.NOME, CLIENTE01.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
    -> FROM CLIENTE01
    -> INNER JOIN ENDERECO
    -> ON CLIENTE01.IDCLIENTE = ENDERECO.ID_CLIENTE
    -> INNER JOIN TELEFONE
    -> ON CLIENTE01.IDCLIENTE = TELEFONE.ID_CLIENTE;
+-------+------+---------+--------------+------+------------+
| NOME  | SEXO | BAIRRO  | CIDADE       | TIPO | NUMERO     |
+-------+------+---------+--------------+------+------------+
| GUI   | M    | BARUERI | SÃO PAULO    | CEL  | 1199003188 |
| PAULO | M    | FRANCA  | SÃO PAULO    | CEL  | 1198432892 |
| CLARA | F    | BARUERI | MINAS GERAIS | CEL  | 1193843782 |
| CLARA | F    | BARUERI | MINAS GERAIS | CEL  | 119900319  |
| CLARA | F    | BARUERI | MINAS GERAIS | COM  | 119903819  |
| CLARA | F    | BARUERI | MINAS GERAIS | CEL  | 119900319  |
| CLARA | F    | BARUERI | MINAS GERAIS | RES  | 119480639  |
| CLARA | F    | BARUERI | MINAS GERAIS | COM  | 119900319  |
| CLARA | F    | BARUERI | MINAS GERAIS | CEL  | 119900319  |
+-------+------+---------+--------------+------+------------+
9 rows in set (0.00 sec)


/*OBS: Note que utilizamo (nometabela.) para dar referência de onde se encontra o devido dado.*/

/*

exemplo: 
selecionar tabelaCliente01.campoNome, tabelaCliente01.campoSexo, tabelaEndereco.campoBairro, tabelaEndereco.campoCidade
da tabela cliente01
onde usará tabelaEndereco
e IDcliente dentro da TabelaCliente01 é igual = ID_cliente.TabelaEndereco.

*/

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO 
FROM CLIENTE01 C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;



/*APRESENTAR OS SEGUINTES CAMPOS DE TABELAS DIFERENTES: NOME E SEXO, BAIRRO E CIDADE, TIPO E TELEFONE.*/
select cliente01.nome, cliente01.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero 
/*Selecionar tabela_cliente01 campo. nome*/
from cliente01
/*de tabela cliente 01*/
inner join endereco
/*da outra tabela endereco*/
on cliente01.idcliente = endereco.id_cliente
/*onde tabela cliente01.capo_idcliente é igual a tabela endereco.Campo_id_cleinte*/
inner join telefone
/*da outra tabela telefone*/
on cliente01.idcliente = telefone.id_cliente;
/* onde tabela_cliente01.campo_idcliente é igual a tabela_telefone.campo_Id_telefone*/