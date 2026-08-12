create database bd_cadastro_aluno;

use bd_cadastro_aluno;

create table aluno(
rg_aluno char(9) not null,
uf_aluno varchar (30),
nome_aluno varchar(30),
data_nascimento_aluno varchar(8),
matricula_aluno char(6) not null,
cep_aluno char (8),
numero_endereço_aluno varchar (4),
primary key (rg_aluno)
);
