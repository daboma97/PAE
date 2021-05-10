

CREATE DATABASE ey;

USE ey;

CREATE TABLE compra(
	nref int,
	nitems int,
	import double,
	idVenedor int,
	dataCompra varchar(16),
	primary key (nref),
	foreign key (idVenedor) references treballador(id));

CREATE TABLE compraOnline(
	idCompra int,
	idClient int,
	nom varchar(32),
	cognom varchar(32),
	email varchar(64),
	ntargeta varchar(32),
	foreign key (idCompra) references compra(nref),
	foreign key (idClient) references clients(nclient));

DROP TABLE compraOnline;

CREATE TABLE clients(
	nclient int,
	nom varchar(32),
	cognom varchar(32),
	address varchar(128),
	email varchar(64),
	passwd varchar(128),
	ntargeta varchar(32),
	dateInscrip varchar(16),
	primary key (nclient));


create table treballador(
	id int,
	nom varchar(32) NOT NULL,
	cognom varchar(32) NOT NULL,
	dni varchar(9) UNIQUE,
	address varchar(128),
	mobil varchar(16) NOT NULL,
	email varchar(64) NOT NULL,
	iban varchar(32) NOT NULL,
	numSegSocial varchar(128) UNIQUE,
	idBotiga int,
	dataAlta varchar(16) not null,
	dataBaixa varchar(16), 
	ncontracte int UNIQUE,
	primary key(id),
	foreign key (idBotiga) references botiga(id));


CREATE TABLE reclamacions(
	nreclamacio int,
	email varchar(64),
	dataCompra varchar(16),
	nrefCompra int,
	item varchar(64),
	motiuReclamacio varchar(2048),
	primary key (nreclamacio),
	foreign key (nrefCompra) references compra(nref));

CREATE TABLE devolucions(
	ndevolucio int,
	email varchar(64),
	dataCompra varchar(16),
	nrefCompra int,
	item varchar(64),
	motiuDevolucio varchar(2048),
	importDevolucio double,
	primary key (ndevolucio),
	foreign key (nrefCompra) references compra(nref));


CREATE TABLE baixes(
	idCausaBaixa int,
	idT int,
	motiuBaixa varchar(2048),
	numSegSocial varchar(128),
	dataBaixa varchar(16) NOT NULL,
	dataAlta varchar(16),
	primary key (idCausaBaixa),
	foreign key (idT) references treballador(id));

drop table baixes ;


CREATE TABLE botiga(
	id int,
	address varchar(128),
	primary key (id));


INSERT INTO botiga VALUES(1, 'Carrer Arago 312, Barcelona');
INSERT INTO botiga VALUES(2, 'Carrer Mallorca 580, Barcelona');

INSERT INTO treballador VALUES(1, 'Roger', 'Puig', '12345678Z', 'Carrer del Congo 20, Barcelona', '666666666', 'roger.puig@lacistore.com', 'ES82 7896 8520 6930 4777 8702', '123456789102', 1, '01/05/2001', '31/10/2010', 1);

INSERT INTO compra VALUES(1, 4, 70.65, 1, '24/11/2009');

INSERT INTO baixes VALUES(1, 1, 'Esquinç de tormell', '1234567891021', '08/05/2005', '06/06/2005');
INSERT INTO baixes VALUES(2, 6, 'Fractura de genoll esquerra', '129826566802', '22/01/1999', '01/03/1999');

DELETE FROM baixes WHERE idCausaBaixa = 1

INSERT INTO compra VALUES(1, 4, 70.65, 1, '24/11/2009');
INSERT INTO compra VALUES(2, 1, 12.35, 1, '03/12/2009');
INSERT INTO compra VALUES(3, 3, 30.0, 1, '08/01/2010');
INSERT INTO compra VALUES(4, 6, 124.99, 2, '02/01/2010');
INSERT INTO compra VALUES(5, 3, 47.95, 1, '13/03/2012');
INSERT INTO compra VALUES(6, 2, 20.00, 1, '15/02/2014');
INSERT INTO compra VALUES(7, 2, 17.45, 1, '19/08/2015');
INSERT INTO compra VALUES(8, 4, 60.00, 2, '12/07/2019');
INSERT INTO compra VALUES(9, 5, 99.99, 2, '20/11/2020');
INSERT INTO compra VALUES(10, 1, 2.6, 2, '07/05/2021');

INSERT INTO treballador VALUES(1, 'Roger', 'Puig', '12345678Z', 'Carrer del Congo 20, Barcelona', '666666666', 'roger.puig@lacistore.com', 'ES82 7896 8520 6930 4777 8702', '123456789102', 1, '01/05/2001', '31/10/2010', 2);
INSERT INTO treballador VALUES(2, 'Paco', 'Martinez', '12345679S', 'Carrer del Pilar 20, Barcelona', '664665667', 'paco.martinez@lacistore.com', 'ES82 7896 8520 6230 1234 8702', '123456559102', 1, '01/05/2010', 'null', 3);
INSERT INTO treballador VALUES(3, 'Marta', 'Perez', '12345579F', 'Avinguda Madrid 240 Barcelona', '674665267', 'marta.perez@lacistore.com', 'ES82 7896 8520 6230 1456 8802', '123226559102', 1, '14/04/1997', 'null', 4);
INSERT INTO treballador VALUES(4, 'Daniel', 'Pallise', '43235579A', 'Plaça Reial 52, Barcelona', '674885267', 'daniel.pallise@lacistore.com', 'ES82 7897 8540 1234 1456 8802', '123226559802', 1, '22/11/2019', 'null', 5);
INSERT INTO treballador VALUES(5, 'Marc', 'Santapau', '48325779Y', 'Carrer Roger de Flor 52, Barcelona', '673885107', 'marc.santapau@lacistore.com', 'ES82 7897 8543 1234 1456 1123', '123226566802', 2, '01/01/2021', 'null', 6);
INSERT INTO treballador VALUES(6, 'Julia', 'Dominguez', '42575789Q', 'Carrer Castillejos 52, Barcelona', '699885106', 'julia.dominguez@lacistore.com', 'ES82 7457 3451 1234 2536 5523', '129826566802', 2, '15/08/1993', '01/01/2013', 7);
INSERT INTO treballador VALUES(7, 'Maria', 'Dill', '42767789T', 'Carrer Abat Safont 52, Barcelona', '673885107', 'maria.dill@lacistore.com', 'ES82 7897 8543 1234 1456 1352', '123256556802', 2, '13/12/2012', 'null', 8);
INSERT INTO treballador VALUES(8, 'Pere', 'Jimenez', '42529479P', 'Carrer Sergialet 52, Barcelona', '673885107', 'pere.jimenez@lacistore.com', 'ES82 7897 0503 2220 3233 1123', '129274566802', 2, '01/07/2007', 'null', 9);

INSERT INTO clients VALUES(1, 'Nacho', 'Perez', 'Carrer Mallorca 43, Barcelona', 'nacho.perez@esade.com', '12356789', '2316 2432 2212 3582', '18/12/1997');
INSERT INTO clients VALUES(2, 'Lucia', 'Garcia', 'Plaça Major de Sarrià 3, Barcelona', 'lucia252021@fib.upc.edu', 'lucia1234', '9522 3245 6938 7821', '25/04/2004');
INSERT INTO clients VALUES(3, 'Arturo', 'Reyes', 'Carrer de Calvet 68, Barcelona', 'arturito@gmail.com', 'reyarturo', '2234 4467 1235 6422', '08/11/2009');
INSERT INTO clients VALUES(4, 'Joan', 'Soler', 'Avinguda del Milenari 15, Cervera', 'joan.soler@ub.cat', 'joanpetitcomballa', '2144 4234 5233 5342', '30/03/2011');
INSERT INTO clients VALUES(5, 'Ariadna', 'Rubio', 'Avinguda Urgell 24, Lleida', 'ariansita19@msn.es', 'ariguapa12', '1211 5349 3209 6451', '15/07/2015');
INSERT INTO clients VALUES(6, 'Xavi', 'Mateo', 'Carrer Migdia 5, Girona', 'xavi.mateo@gmail.com', 'xavimateo91', '5490 2352 6034 2222 5321', '20/11/2020');
INSERT INTO clients VALUES(7, 'Laura', 'Ruiz', 'Camí Orleans 41, Tortosa', 'lauraruiz03@fib.upc.edu', 'viscatelecos12', '2135 5693 1912 5694', '07/05/2021');

INSERT INTO compraOnline VALUES(9, 6, 'Xavi', 'Mateo', 'xavi.mateo@gmail.com', '5490 2352 6034 2222 5321');
INSERT INTO compraOnline VALUES(10, 7, 'Laura', 'Ruiz', 'lauraruiz03@fib.upc.edu', '2135 5693 1912 5694');


INSERT INTO reclamacions VALUES(1, 'joan.soler@ub.cat', '13/03/2012', 5, 'Pantalons', 'Trencats');




