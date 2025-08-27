create database if not exists biblioteca;

use biblioteca;

create table Pessoa(
ID int primary key auto_increment,
cpf decimal(11) unique not null,
nome varchar(255) not null,
data_nasc date not null,
saldo decimal(11,2) not null default 0
);

insert into pessoa (cpf, nome, data_nasc)
values ("12345678910", "David", "2002-08-28");

select * from pessoa;

create table Autor(
ID int primary key auto_increment,
cpf decimal(11) unique not null
);

insert into Autor (nome) values ("David");

create table Livro(
ISBN decimal(13) primary key,
título varchar(255) not null,
ano smallint,
autorID int not null,
constraint autorid_fk
foreign key(autorID) references Autor(ID)
on update cascade
on delete restrict
);

insert into Livro (ISBN, título, ano, autorID)
values('1234567890123', "Banco de Dados", 2025, 1);