/*Comando utilizado para abrir o postgres*/
psql

/*Comando utilizado para listar as databases*/
\list

/*Comando utilizado para criar um banco de dados*/
create database "nome database";
/*Exemplo*/
create database ed;

/*Comando utilizado para acessar o banco*/
\connect nome database OU \c nome database
/*Exemplo*/
\c ed;

/*Comando utilizado para executar um script SQL externo*/
\i /caminho do arquivo/arquivo.sql
/*Exemplo*/
\i /var/lib/postgresql/relacional/1.CreateTable.sql

/*Comando utilizado para visualizar todas as tabelas*/
\dt *.*

/*Projeção de dados na tela (SELECT) e origem (FROM)*/
select nome coluna ou * para tudo
from nome do diretório.nome da tabela;
/*Exemplo todas as colunas*/
select *
from clientes;
/*Exemplo colunas específicas*/
select clientes, sexo, status
from relacional.clientes;

/*Seleção/Filtros (WHERE)*/
select nome coluna ou * para tudo
from nome do diretório.nome da tabela
where coluna = aqui vai a condição;
/*Exemplo todas as colunas*/
select *
from clientes
where status = "Silver";
/*Exemplo colunas específicas*/
select clientes, sexo, status
from relacional.clientes
where status = "Silver";

/*Comando Parecido (WHERE LIKE)*/
select nome coluna ou * para tudo 
from nome do diretório.nome da tabela
where coluna like aqui vai a condição;
/*Neste comando utilizamos para encontrar dados semelhantes a alguma coisa por exemplo precisamos saber as placas de carro que terminam com um determinado número*/
/*
Para isso usamos o símbolo "%" onde no início irá escolher tudo que termine com o número ex. "%0", 
no final irá puxar tudo que comece com o número ex. "0%" 
e em ambos os lados tudo que contenha o número no meio ex. "%0%"
*/
/*Exemplo no início*/
select clientes, sexo, status
from relacional.clientes
where status like "%ver";
/*Exemplo no meio*/
select clientes, sexo, status
from relacional.clientes
where status like "%ilv%";
/*Exemplo no final*/
select clientes, sexo, status
from relacional.clientes
where status like "Sil%";

/*Comando utilizado para limitar dados na tela (LIMIT)*/
select nome coluna ou * para tudo
from nome do diretório.nome da tabela
where coluna = aqui vai a condição
limit número de dados que irá mostrar;
/*Exemplo*/
select clientes, sexo, status
from relacional.clientes
where status = "Silver"
limit 1;

/*
== - Um valor igual a
> - Um valor maior que
>= - Um valor maior ou igual que
< - Um valor menor que
<= - Um valor menor que
<> - Um valor diferente que
*/
select nome coluna ou * para tudo 
from nome do diretório.nome da tabela
where coluna > aqui vai a condição
limit número de dados que irá mostrar;
/*Exemplo*/
select *
from relacional.vendas
where total >= 6000
limit 1;

/*
Operadores lógios
AND - E (2 condições devem ser verdadeiras para aparecer)
OR - OU (1 condição deve ser verdadeira para aparecer)
*/
select nome coluna ou * para tudo 
from nome_do_diretório.nome_da_tabela
where coluna > aqui vai a condição and coluna < aqui vai a condição
limit número de dados que irá mostrar;
/*Exemplo OR*/
select *
from relacional.vendas
where total >= 6000 and total <= 10000
limit 1;
/*Exemplo AND*/
select clientes, sexo, status
from relacional.clientes
where status = "Silver" and status = "Gold"
limit 1;

/*Comando para contar número de linhas*/
select count(nome_coluna ou * para tudo) /*É possível colocar * para contar total de linhas incluindo nulos ou o nome da coluna para contar todos menos os nulos*/
from "nome do diretório.nome da tabela"
/*Exemplo*/
select count(*)
from relacional.clientes;

/*Comando utilizado para nomear uma coluna (AS)*/
select nome coluna, count(nome_coluna) as "nome"
from "nome do diretório.nome da tabela"
where coluna = aqui vai a condição
group by coluna;
/*Exemplo*/
select idvendedor, count(idvendedor) as "quantidade"
from relacional.clientes
where status = "Silver"
group by idvendedor;

/*Comando utilizado para agrupar dados (GROUP BY)*/
select nome coluna, count(nome_coluna) as "nome"
from "nome do diretório.nome da tabela"
where coluna = aqui vai a condição
group by coluna;
/*Exemplo*/
select idvendedor, count(idvendedor) as "quantidade vendas"
from relacional.clientes
where status = "Silver"
group by idvendedor;

/*
Funções de agregação
SUM() - Soma
AVG() - Média
COUNT() - Conta
MIN() - Minimo
MAX() - Maximo
*/
select nome coluna, sum(nome_coluna) as "nome"
from nome_do_diretório.nome_da_tabela
group by coluna;
/*Exemplo*/
select idvendedor as "ID", sum(total) as "Soma de vendas"
from relacional.clientes
group by idvendedor;

/*Comando para remover dados duplicados (DISTINCT)*/
select distinct nome coluna ou * para tudo 
from nome_diretório.nome_tabela;
/*Exemplo*/
select distinct status
from relacional.clientes;

/*Inserir dados na tabela (INSERT)*/
insert into nome_diretorio.nome_tabela (campo1, campo2, campo3) values ("valor1", "valor2", "valor3");
/*Exemplo*/
insert into relacional.clientes (idcliente, cliente, status) values ("1", "Lucas", "Gold");

/*Atualizar dados (UPDATE)*/
update nome_diretorio.nome_tabela
set coluna1 = valorNovo1, coluna2 = valorNovo2
where coluna = valor_da_coluna;
/*Exemplo*/
update relacional.clientes
set status = "Platinum"
where idcliente = 1;

/*Deletar dado da coluna (DELETE)*/
delete from nome_diretório.nome_tabela
where coluna = valor_coluna;
/*Exemplo*/
delete from relacional.clientes
where idcliente = 1;

/*
Comandos de transação 
BEGIN - Inicia um novo bloco de transação explícita.
ROLLBACK - Reverte (desfaz) todas as alterações feitas na transação atual, retornando o banco de dados ao estado anterior.
COMMIT - Confirma todas as alterações feitas na transação atual, tornando-as permanentes no banco de dados.
*/
begin;
insert into nome_diretório.nome_tabela (campo1, campo2, campo3) values ("valor1", "valor2", "valor3");
rollback;
OU
begin;
insert into nome_diretório.nome_tabela (campo1, campo2, campo3) values ("valor1", "valor2", "valor3");
commit;
/*Exemplo*/
begin;
insert into relacional.clientes (idcliente, cliente, status) values ("1", "Lucas", "Gold");
rollback;
OU
begin;
insert into relacional.clientes (idcliente, cliente, status) values ("1", "Lucas", "Gold");
commit;

/*Comando de junção (INNER JOIN)*/
select nome_coluna_tab1, nome_coluna_tab2
from nome_diretório.nome_tabela1
inner join nome_diretório.nome_tabela2
on tab1.cond_tab1 = tab2.cond_tab2;
/*Exemplo*/
select clientes, vendedores
from relacional.clientes
inner join relacional.vendedores
on clientes.idcliente = vendedores.idcliente
/*Com mais de 1 INNER JOIN*/
select c.cliente, p.produto, v.data, v.total, iv.quantidade
from relacional.clientes c
inner join relacional.vendas v
on v.idcliente = c.idcliente
inner join relacional.itensvenda iv
on iv.idvenda = v.idvenda
inner join relacional.produtos p
on p.idproduto = iv.idproduto;

/*
Comando para ordenar as linhas (ORDER BY)
ASC - Crescente
DESC - Decrescente
*/
select coluna 
from nome_diretório.nome_tabela
order by coluna desc;
OU
select coluna 
from nome_diretório.nome_tabela
order by coluna asc;
/*Exemplo*/
select total
from resumoVendas
order by total desc;
OU
select total
from resumoVendas
order by total asc;

/*
Cláusula WITH - Expressão de Tabela Comum (CTE - Common Table Expression), 
é utilizada para criar um conjunto de resultados temporário. Esse conjunto pode ser referenciado em instruções SELECT, INSERT, UPDATE ou DELETE subsequentes.
*/
with nome as(
	select nome_coluna_tab1, nome_coluna_tab2
	from nome_diretório.nome_tabela1
	inner join nome_diretório.nome_tabela2
	on tab1.cond_tab1 = tab2.cond_tab2
	group by coluna;
)
select * 
from nome
order by coluna desc
limit 5;
/*Exemplo*/
with resumoVendas as(
	select v.nome, sum(s.total) as total
	from relacional.vendedores v
	inner join relacional.vendas s
	on v.idvendedor = s.idvendedor
	group by v.idvendedor, s.idvendedor
)
select * 
from resumoVendas
order by total desc
limit 5;

/*Exercícios Teste com resposta*/

/*  
compras de um cliente específico
campos: nome, produto, quantidade, valor total, data de venda
filtros: código do cliente 
*/

select c.cliente, p.produto, v.data, v.total, iv.quantidade
from relacional.clientes c
inner join relacional.vendas v
on v.idcliente = c.idcliente
inner join relacional.itensvenda iv
on iv.idvenda = v.idvenda
inner join relacional.produtos p
on p.idproduto = iv.idproduto
where c.idcliente = 1;

/*
Lista dos 5 melhores/piores vendedores (2 consultas)
campos: nome vendedor, total de vendas
agrupado por vendedor
ordenado pelo total de vendas
*/

/* 5 melhores */

with resumoVendas as(
	select v.nome, sum(s.total) as total
	from relacional.vendedores v
	inner join relacional.vendas s
	on v.idvendedor = s.idvendedor
	group by v.idvendedor, s.idvendedor
)
select * 
from resumoVendas
order by total desc
limit 5;

/* 5 piores */

with resumoVendas as(
	select v.nome, coalesce(sum(s.total)) as total
	from relacional.vendedores v
	inner join relacional.vendas s
	on v.idvendedor = s.idvendedor
	group by v.idvendedor, s.idvendedor
)
select * 
from resumoVendas
order by total asc
limit 5;

/*
Total de vendas em período
campos: produto, total de vendas
agrupado por produto
filtro de mês e ano
*/

with totalVendas as (
	select p.produto, sum(iv.quantidade) as qtd
	from relacional.produtos p
	inner join relacional.itensvenda iv
	on p.idproduto = iv.idproduto
	inner join relacional.vendas v
	on iv.idvenda = v.idvenda
	where v.data >= '2016-04-01' and v.data < '2016-05-01'
	group by p.produto
)
select * 
from totalVendas
order by qtd asc;

/*
Produtos com maiores descontos
campos: produto, vendedor, total de descontos
agrupado por produtos
*/

with Descontos as(
	select p.produto, v.nome, sum(iv.desconto) as Desconto
	from relacional.produtos p
	inner join relacional.itensvenda iv
	on p.idproduto = iv.idproduto
	inner join relacional.vendas s
	on iv.idvenda = s.idvenda
	inner join relacional.vendedores v
	on s.idvendedor = v.idvendedor
	group by p.produto, v.nome
)
select * 
from Descontos
order by Desconto desc;