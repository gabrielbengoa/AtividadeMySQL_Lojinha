create database lojadeinformatica;
use lojadeinformatica;

create table tbclientes(
         idcli int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    cpf varchar(15) not null    
);

describe tbclientes;

insert into tbclientes(nome,fone,cpf)
values('Gabriel Barros Bengoa','96446-5786','39217432814');

insert into tbclientes(nome,fone,cpf)
values('Paulo Roberto Centeiro Franco','95417-2272','91482165460');

insert into tbclientes(nome,fone,cpf)
values('Dio Brando','96666-6969','02647109631');

select * from tbclientes;


create table tbprodutos(
	idpro int primary key auto_increment,
    produto varchar(50) not null,
    valor decimal(10,2),
    quantidade int not null
);

describe tbprodutos;

insert into tbprodutos(produto,valor,quantidade)
values('Placa-Mãe',320.52,500);

insert into tbprodutos(produto,valor,quantidade)
values('Fonte ATX',550,450);

insert into tbprodutos(produto,valor,quantidade)
values('Memória RAM',220,850);

insert into tbprodutos(produto,valor,quantidade)
values('Placa de Video',920.55,1500);

insert into tbprodutos(produto,valor,quantidade)
values('Processador',999.99,3000);

select * from tbprodutos;


create table tbpedidos(
	idpedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    idcli int not null,
    idpro int not null,
    foreign key(idcli) references tbclientes(idcli),
    foreign key(idpro) references tbprodutos(idpro)
);

describe tbpedidos;


insert into tbpedidos(idcli,idpro) values (1,1);
insert into tbpedidos(idcli,idpro) values (1,2);
insert into tbpedidos(idcli,idpro) values (2,3);
insert into tbpedidos(idcli,idpro) values (2,4);
insert into tbpedidos(idcli,idpro) values (3,1);
insert into tbpedidos(idcli,idpro) values (3,2);
insert into tbpedidos(idcli,idpro) values (3,3);
insert into tbpedidos(idcli,idpro) values (3,4);


select * from tbpedidos
inner join tbclientes
on tbpedidos.idcli = tbclientes.idcli
inner join tbprodutos
on tbpedidos.idpro = tbprodutos.idpro;


select
P.idpedido as Pedido,
A.nome as cliente,
C.produto,valor
from tbpedidos as P
inner join tbclientes as A
on (P.idcli = A.idcli)
inner join tbprodutos as C
on (P.idpro = C.idpro);

select sum(valor) as Total from tbprodutos;