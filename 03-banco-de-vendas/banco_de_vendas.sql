create database bd_vendas;

use bd_vendas;

create table tbl_produto (
    cod_produto int unsigned auto_increment,
    nome_produto varchar(100) not null,
    desc_produto varchar(100) not null,
    unid_medida varchar(30) not null,
    estoque_atual int default 0,
    estoque_min int default 0,
    estoque_max int default 0,
    valor decimal(10,2) not null,
    primary key (cod_produto)
);

create table tbl_endereco (
    id int(10) not null,
    cep int(9) not null,
    logradouro varchar(90) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    constraint pk_endereco primary key (cep)
);

create table tbl_cliente (
    cod_cliente int unsigned auto_increment,
    nome_cliente varchar(45) not null,
    cpf varchar(11) default '',
    data_nasc date,
    cep int(9) default 0,
    numero varchar(10) default '',
    complemento varchar(20) default '',
    primary key (cod_cliente),
    constraint foreign key fk_cliencep (cep) references tbl_endereco(cep)
);

create table tbl_pedido (
    cod_pedido int unsigned auto_increment,
    data_pedido date,
    data_entrega date,
    cod_cliente int unsigned not null,
    primary key (cod_pedido),
    constraint fk_cliente foreign key (cod_cliente)
        references tbl_cliente(cod_cliente)
);

create table tbl_itempedido (
    qtde int unsigned not null,
    i_cod_pedido int unsigned not null,
    i_cod_produto int unsigned not null,
    i_valor decimal(10,2) not null,
    constraint fk_pedido1
        foreign key (i_cod_pedido)
        references tbl_pedido(cod_pedido),
    constraint fk_tbl_produto1
        foreign key (i_cod_produto)
        references tbl_produto(cod_produto)
);

insert into tbl_produto(nome_produto, desc_produto, unid_medida, estoque_atual, estoque_min, estoque_max, valor) values
('Arroz', 'Arroz agulhinha tipo 1', 'SC', 10,2,20, 12.50),
('Feijão', 'Feijão carioquinha com casca', 'SC', 25,5,60, 7.50),
('Macarrão', 'Macarrão Adria espaguete', 'PC', 50,10,80, 5.50),
('Óleo', 'Óleo Lisa', 'LT', 15,10,45, 6.50),
('Vinagre', 'Vinagre Castelo', 'GR', 30,10,50, 7.89),
('Batata', 'Batata lavada', 'KG', 100,50,200, 4.50),
('Tomate', 'Tomate vermelho', 'KG', 80,8,160, 6.90),
('Cebola', 'Cebola com casca', 'KG', 50,5,100, 6.99),
('Leite', 'Leite Leco', 'CX', 25,10,90, 2.50),
('Café', 'Café do Ponto', 'SC', 500,100,200, 11.50);

-- Consultas praticadas em aula

select distinct cpf
from tbl_cliente
limit 5,3;

select *
from tbl_cliente
order by data_nasc
limit 6,1;

select * from tbl_endereco;
select * from tbl_produto;
select * from tbl_cliente;

-- LIKE
select * from tbl_cliente
where nome_cliente like 'M%';

select * from tbl_cliente
where nome_cliente like '%M';

select * from tbl_cliente
where nome_cliente like '%M%';

-- BETWEEN
select * from tbl_produto
where estoque_min not between 10 and 100;

-- COUNT
select count(*) as qtde_ocorrencias
from tbl_produto
where estoque_min between 10 and 100;

-- GROUP BY
select count(*), unid_medida
from tbl_produto
group by unid_medida;

select count(*), month(data_nasc)
from tbl_cliente
group by month(data_nasc);

-- SUM
select sum(estoque_min) as soma_estoque
from tbl_produto;

-- AVG
select avg(estoque_min) as media_estoque
from tbl_produto;
