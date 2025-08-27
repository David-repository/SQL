create database BibliotecaEscolar;

use BibliotecaEscolar;

create table Pessoa (
	CPF char(11) primary key,
    Nome varchar(255) not null,
    DataNascimento date not null
);

select * from pessoa;

create table Autor (
	ID int auto_increment primary key,
    CPF char(11) not null,
    foreign key (CPF) references Pessoa(CPF)
);

create table Aluno (
	Matricula int primary key,
    CPF char(11) not null,
    Entrada date not null,
    Ativo boolean not null,
    foreign key (CPF) references Pessoa(CPF)
);

create table Curso (
	Codigo int primary key,
    Nome varchar(255) not null
);

create table Turma(
	Codigo int primary key,
    Semestre varchar(20) not null,
    CursoCodigo int not null,
    foreign key (CursoCodigo) references Curso(Codigo)
);

create table Livro (
	ISBN char(13) primary key,
    Titulo varchar(255) not null,
    Ano year not null,
    Editora varchar(255) not null
);

create table Autor_Livro (
	AutorID int,
    LivroISBN char(13),
    primary key (AutorID, LivroISBN),
    foreign key (AutorID) references Autor(ID),
    foreign key (LivroISBN) references Livro(ISBN)
);

create table Aluno_Curso (
	Matricula int,
    CursoCodigo int,
    primary key (Matricula, CursoCodigo),
    foreign key (Matricula) references Aluno(Matricula),
    foreign key (CursoCodigo) references Curso(Codigo)
);

create table Emprestimo (
	ID int auto_increment primary key,
    Matricula int not null,
    LivroISBN char(13) not null,
    DataEmprestimo date not null,
    DataDevolucao date,
    foreign key (Matricula) references Aluno(Matricula),
    foreign key (LivroISBN) references Livro(ISBN)
);

insert into Pessoa (CPF, Nome, DataNascimento) values
('11111111111', 'David Moura', '2002-08-28'),
('22222222222', 'João Silva', '1999-05-02'),
('33333333333', 'Maria Souza', '2000-07-24'),
('44444444444', 'José Santos', '1980-03-12');

insert into Autor (CPF) values
('44444444444'),
('33333333333'),
('11111111111');

insert into Aluno (Matricula, CPF, Entrada, Ativo) values
(1000, '22222222222', '2020-02-10', true),
(1001, '11111111111', '2021-03-12', false),
(1002, '33333333333', '2019-01-20', true);

insert into Curso (Codigo, Nome) values
(1, 'Ciência da Computação'),
(2, 'Engenharia de Software'),
(3, 'Análise e Desenvolvimento de Sistemas');

insert into Turma (Codigo, Semestre, CursoCodigo) values
(100, '2025/1', 1),
(101, '2025/1', 2),
(102, '2025/2', 3);

insert into Livro (ISBN, Titulo, Ano, Editora) values
('7777777777777', 'Banco de Dados', 1990, 'Editora A'),
('8888888888888', 'Lógica de Programação', 2000,  'Editora B'),
('9999999999999', 'Java', 2005, 'Editora C');

insert into Autor_Livro (AutorID, LivroISBN) values
(1, '7777777777777'),
(2, '8888888888888'),
(3, '9999999999999');

insert into Aluno_Curso (Matricula, CursoCodigo) values
(1000, 1),
(1001,2),
(1002, 3);

insert into Emprestimo (Matricula, LivroISBN, DataEmprestimo, DataDevolucao) values
(1000, '7777777777777', '2025-08-01', '2025-08-25'),
(1001, '8888888888888', '2025-08-15', null),
(1002, '9999999999999', '2025-07-25', null);