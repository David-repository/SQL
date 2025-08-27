use testDB;

rename table teste to Pessoa;

alter table pessoa
add column data_nasc date not null;

alter table pessoa
add column dinheiro float not null default 0.0;

insert into pessoa (ID, nome, data_nasc)
values (1, 'David', '2002-08-28');

select ID, nome, data_nasc, dinheiro from pessoa;

insert into pessoa (ID, nome, data_nasc)
values (2, 'Jão', '1999-09-09', 100);

select ID, nome, data_nasc, dinheiro from pessoa;