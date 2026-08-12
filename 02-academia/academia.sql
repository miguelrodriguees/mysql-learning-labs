create database bd_academia;

use bd_academia;

create table academia(
cnpj_academia char(11),
nome_academia varchar(30),
cep_academia varchar(30),
primary key(cnpj_academia)
);

create table usuario_academia(
codigo_usuario int unsigned auto_increment,
cnpj_academia char(11),
nome_usuario varchar (30) not null,
idade_usuario varchar(3),
cpf_usuario char (11),
cadastro_usuario varchar (10) not null,
primary key (codigo_usuario),
foreign key (cnpj_academia) references academia (cnpj_academia)
);

create table funcionarios(
cod_funcionario int unsigned,
codigo_usuario int unsigned auto_increment,
nome_funcionario varchar (30) not null,
cpf_funcionario char (11),
cargo_funcionario varchar (10),
salario_funcionario decimal (6,2),
carga_horaria varchar (10),
cadastro_funcionario varchar (10),
telefone_funcionario varchar (10),
primary key (cod_funcionario),
foreign key (codigo_usuario) references usuario_academia (codigo_usuario)
);

create table alunos (
cod_matricula int unsigned,
codigo_usuario int unsigned auto_increment,
nome_aluno varchar (30) not null,
cpf_aluno char (11) not null,
telefone_aluno char (9),
plano_do_aluno varchar (10),
email_aluno varchar (30),
cadastro_aluno varchar (10),
primary key (cod_matricula),
foreign key (codigo_usuario) references usuario_academia (codigo_usuario)
);