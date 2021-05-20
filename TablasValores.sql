
CREATE TABLE clients (
	idClient int,
	nom varchar(32),
	cognom varchar(32),
	dataNeixement varchar(16),
	genere varchar(16),
	email varchar(64),
	adresa varchar(64),
	codiPostal varchar(5),
	ciutat varchar(32),
	passwd varchar(128),
	nTargeta varchar(32),
	dataRegistre varchar(16),
	primary key(idClient));


CREATE TABLE compra (
	nref int,
	nitems int,
	import double,
	dataCompra varchar(16),
	idClient int,
	idVenedor int,
	primary key (nref),
	foreign key (idClient) references clients(idClient),
	foreign key (idVenedor) references treballador(id));
	
CREATE TABLE botiga(
	id int,
	address varchar(128),
	primary key (id));
	
CREATE TABLE baixes(
	idCausaBaixa int,
	idT int,
	motiuBaixa varchar(2048),
	numSegSocial varchar(128),
	dataBaixa varchar(16) NOT NULL,
	dataAlta varchar(16),
	primary key (idCausaBaixa),
	foreign key (idT) references treballador(id));
	

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
	

INSERT INTO treballador VALUES(1, 'Roger', 'Puig', '12345678Z', 'Carrer del Congo 20, Barcelona', '666666666', 'roger.puig@lacistore.com', 'ES82 7896 8520 6930 4777 8702', '123456789102', 1, '01/05/2001', '31/10/2010', 2);
INSERT INTO treballador VALUES(2, 'Paco', 'Martinez', '12345679S', 'Carrer del Pilar 20, Barcelona', '664665667', 'paco.martinez@lacistore.com', 'ES82 7896 8520 6230 1234 8702', '123456559102', 1, '01/05/2010', 'null', 3);
INSERT INTO treballador VALUES(3, 'Marta', 'Perez', '12345579F', 'Avinguda Madrid 240 Barcelona', '674665267', 'marta.perez@lacistore.com', 'ES82 7896 8520 6230 1456 8802', '123226559102', 1, '14/04/1997', 'null', 4);
INSERT INTO treballador VALUES(4, 'Daniel', 'Pallise', '43235579A', 'Plaça Reial 52, Barcelona', '674885267', 'daniel.pallise@lacistore.com', 'ES82 7897 8540 1234 1456 8802', '123226559802', 1, '22/11/2019', 'null', 5);
INSERT INTO treballador VALUES(5, 'Marc', 'Santapau', '48325779Y', 'Carrer Roger de Flor 52, Barcelona', '673885107', 'marc.santapau@lacistore.com', 'ES82 7897 8543 1234 1456 1123', '123226566802', 2, '01/01/2021', 'null', 6);
INSERT INTO treballador VALUES(6, 'Julia', 'Dominguez', '42575789Q', 'Carrer Castillejos 52, Barcelona', '699885106', 'julia.dominguez@lacistore.com', 'ES82 7457 3451 1234 2536 5523', '129826566802', 2, '15/08/1993', '01/01/2013', 7);
INSERT INTO treballador VALUES(7, 'Maria', 'Dill', '42767789T', 'Carrer Abat Safont 52, Barcelona', '673885107', 'maria.dill@lacistore.com', 'ES82 7897 8543 1234 1456 1352', '123256556802', 2, '13/12/2012', 'null', 8);
INSERT INTO treballador VALUES(8, 'Pere', 'Jimenez', '42529479P', 'Carrer Sergialet 52, Barcelona', '673885107', 'pere.jimenez@lacistore.com', 'ES82 7897 0503 2220 3233 1123', '129274566802', 2, '01/07/2007', 'null', 9);


INSERT INTO clients VALUES(1, 'Nacho', 'Perez', '25/04/1989', 'M', 'nacho.perez@esade.com', 'Carrer Mallorca 43', '08029', 'Barcelona', '$2a$04$jTP4SsWMPMYu8FOVG78nz.bHcCyzrEk.WGkq3dZnfeo8MHCSXjD0S', '2316 2432 2212 3582', '18/12/2011');
INSERT INTO clients VALUES(2, 'Lucia', 'Garcia', '18/12/2002', 'F', 'lucia252021@fib.upc.edu', 'Plaça Major de Sarrià 3', '08017', 'Barcelona', '$2a$04$.ANXhrM1tCBf9BqZGE33aOdy2k0O.QUgp32gaXP0EcURSMv4uUG8G', '9522 3245 6938 7821', '25/04/2018');

INSERT INTO compra VALUES(1, 3, 43.80, '18/12/2011', 1, null);
INSERT INTO compra VALUES(2, 5, 69.99, '13/02/2012', 1, null);
INSERT INTO compra VALUES(3, 6, 95.68, '25/04/2018', 2, null); 

INSERT INTO reclamacions VALUES(1, 'joan.soler@ub.cat', '13/03/2012', 5, 'Pantalons', 'Trencats');

INSERT INTO baixes VALUES(1, 1, 'Esquinç de tormell', '1234567891021', '08/05/2005', '06/06/2005');
INSERT INTO baixes VALUES(2, 6, 'Fractura de genoll esquerra', '129826566802', '22/01/1999', '01/03/1999');


INSERT INTO botiga VALUES(1, 'Carrer Arago 312, Barcelona');
INSERT INTO botiga VALUES(2, 'Carrer Mallorca 580, Barcelona');




























