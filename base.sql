CREATE DATABASE projetCaisse;
use projetCaisse;

CREATE TABLE Admin(
    idAdmin int(1) primary key not null auto_increment,
    login varchar(50),
    motDePasse varchar(50)
);

CREATE TABLE Categorie(
    idCategorie int(3) not null auto_increment primary key,
    nomCategorie varchar(50)
);

CREATE TABLE Produit(
    idProduit int(3) primary key not null auto_increment,
    idCategorie int(3) references Categorie(idCategorie),
    designation varchar(50) not null,
    image varchar(50) not null,
    prix int(20) not null,
    quantiteStock int(20)
);

CREATE TABLE Caisse(
    idCaisse int(3) primary key not null auto_increment,
    nomCaisse varchar(10)
);

CREATE TABLE Achat(
    idAchat int(5) primary key not null auto_increment,
    idCaisse int(3) not null references Caisse(idCaisse),
    idProduit int(3) not null references Produit(idProduit),
    quantite int(3) not null
);

CREATE TABLE Facture(
    idFacture int(5) primary key not null auto_increment,
    idAchat int(5) not null references Achat(idAchat),
    montantTotal int(5)
);

INSERT INTO Admin VALUES 
(null,"Mendrika",sha1("123")),
(null,"Ravaka",sha1("123")),
(null,"Itu",sha1("123"));

INSERT INTO Categorie VALUES
(null,"Fourniture"),
(null,"Fruits"),
(null,"Snacks");

INSERT INTO Produit VALUES 

(null,2,"Ananas","8.jpg",800,30),
(null,2,"Banane","1.png",100,50),
(null,2,"Pasteque","7.jpg",1000,20),
(null,2,"Coco","6.jpg",2000,30),
(null,2,"Corossol","5.jpg",1400,30),

(null,3,"Lays","9.jpg",3000,100),
(null,1,"Stylo","16.jpg",400,100),
(null,1,"Cahier 100P","1.jpg",1500,300),
(null,1,"Bloc note","2.jpg",1000,200),
(null,1,"Cahier 200P","4.jpg",2500,300),



(null,3,"Doritos GM","10.jpeg",8000,100),
(null,1,"Trousse","17.jpg",1000,100),
(null,3,"Cheetos","13.jpg",1000,100),
(null,3,"Crunchips","14.jpg",500,100),
(null,3,"Chees balls","12.jpg",600,100);

INSERT INTO Caisse VALUES
(null,"Caisse 1"),
(null,"Caisse 2"),
(null,"Caisse 3");


