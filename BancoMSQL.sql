create database Tonypizza;
use Tonypizza;

create table cliente
(
id integer primary key auto_increment not null,
nome varchar(255) not null,
email varchar(255) not null,
senha varchar(24) not null,
foto blob,
telefone bigint(14) not null,
id_endereco integer not null,
foreign key (id_endereco) references endereco (id)
);

create table endereco 
(
id integer primary key auto_increment not null,
estado VARCHAR(2),
cidade VARCHAR(55),
logradouro VARCHAR(255),
complemento VARCHAR(255),
cep VARCHAR(10)
);

create table produto 
(
id integer primary key auto_increment not null,

id_categoria integer not null,
foreign key (id_categoria) references categoria(id),

nome VARCHAR(255),
foto blob,
preco VARCHAR(10),
descricao VARCHAR(555),
avaliacao int,
favorito int

);

create table comentario 
(
id integer primary key auto_increment not null,
titulo VARCHAR(155),
descricao VARCHAR(555),
avaliacao int,

id_cliente integer,
foreign key (id_cliente) references cliente(id),
id_produto integer,
foreign key (id_produto) references produto(id)
); 

create table categoria 
(
id integer primary key auto_increment not null,
nome varchar(155) not null
);

create table pedido 
(
id integer primary key auto_increment not null,
dataPedido date not null,
id_cliente  integer,
foreign key (id_cliente) references cliente(id),
id_produto integer,
foreign key (id_produto) references produto(id)
);

create table pagamento
(
id integer primary key auto_increment not null,
valorFrete varchar(20),
valorTotal varchar(50),
formaDePagamento varchar(155),
id_pedido integer,
foreign key (id_pedido) references pedido(id)
);

-- Inserindo dados 
insert into cliente(nome, email, senha,  foto, telefone, id_endereco)values
("Ana Silva", "ana.silva@email.com", 123, "../img/Ana", "(11) 91270-8554", 1),
("Carlos Oliveira", "carlos.oliveira@email.com", 234, "../img/Carlos", "(11) 32270-8554", 2),
("Maria Santos", "Maria.Santos@email.com", 456, "../img/Maria", "(11) 28770-8554", 3);

insert into endereco (estado, cidade, logradouro, complemento, cep) values
("SP","Cidade Alegre", "Rua das Flores","Apt. 4A", “68610-971”),
("SP", "Cidade Grande", "Av. Central","Casa 2, Bairro Centro", “76610-971”),
("SP","Cidade Serena", "Travessa Azul","789 - Bloco C", “28610-971”);

insert into produto  (id_categoria, nome, foto, preco, descricao, avaliacao , favorito) values
(1,"Pizza Peperonni", "../img/Produtos/pizza1","46,90", "Pizza com queijo e peperonni",5,0),
(1,"Pizza Quatro queijos", "../img/Produtos/pizza2","48,90", "Pizza com queijo",5,1),
(2,"Pizza M&M", "../img/Produtos/pizza2","36,90", "Pizza de chocolate e M&M",4,0),
(2,"Pizza Banana", "../img/Produtos/pizza1","32,90", "Pizza de chocolate com banana",5,1),
(4,"Suco de laranja", "../img/Produtos/bebida1","14,90", "600ml",5,1),
(4,"Refrigerente Coca-Cola", "../img/Produtos/bebiba2","12,90", "2L",5,0);

insert into comentario (id_cliente,id_produto,titulo, descricao, avaliacao) values 
(1, 2, "Pizza boa!", "Chegou no prazo e o sabor é otimo", 5),
(2, 1, "Pizza otima!", "Entrega rapida e a pizza é boa", 5),
(4, 3, "Amei a pizza!", "Orima pizza, comprarei novamente", 4),
(3, 4, "Pizza deliciosa!", "Amo pizza doce e essa é maravilhosa", 5);

insert into categoria (nome) values 
("Pizza salgada"),
("Pizza doce"),
("Doces"),
("Bebidas");

insert into pedido (dataPedido, id_cliente, id_produto) values
("12/07/2022", 1, 2),
("12/07/2022", 1, 5),
("12/07/2022", 2, 6),
("12/07/2022", 3, 5);

insert into pagamento (valorFrete,valorTotal,formaDePagamento,id_pedido) values
("5,78", "75,90", "Dinheiro", 1),
("8,48", "65,90", "Debito", 2),
("3,98", "85,90", "Credito", 3),
("6,28", "75,30", "Dinheiro", 4);