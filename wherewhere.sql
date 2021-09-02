CREATE DATABASE wherewhere;

USE wherewhere;

CREATE TABLE client
(
	idClient INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomClient VARCHAR(256),
	prenomClient VARCHAR(256),
	email VARCHAR(256),
	mdpClient VARCHAR(256),
	naissance DATE
)ENGINE=INNODB;

CREATE TABLE province
(
	idProvince INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomProvince VARCHAR(100),
	imageProvince VARCHAR(256)
)ENGINE=INNODB;

CREATE TABLE localisation
(
	idLocalisation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomLocalisation VARCHAR(200),
	idProvince INT NOT NULL,
	imageLocalisation VARCHAR(256),
	FOREIGN KEY (idProvince) REFERENCES province(idProvince)
)ENGINE=INNODB;

CREATE TABLE activite
(
	idActivite INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomActivite VARCHAR(200),
	imageActivite VARCHAR(256)
)ENGINE=INNODB;

CREATE TABLE lieu
(
	idLieu INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idLocalisation INT NOT NULL,
	nomSite VARCHAR(256),
	imageParDefaut VARCHAR(256),
	descriptionLieu TEXT,
	FOREIGN KEY (idLocalisation) REFERENCES localisation(idLocalisation)
)ENGINE=INNODB;

CREATE TABLE lieu_image
(
	idImage INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idLieu INT NOT NULL,
	nomImage VARCHAR(256),
	FOREIGN KEY (idLieu)  REFERENCES lieu(idLieu)	
)ENGINE=INNODB;

CREATE TABLE lieu_activite
(
	idLieu INT NOT NULL,
	idActivite INT NOT NULL,
	FOREIGN KEY (idLieu)  REFERENCES lieu(idLieu),
	FOREIGN KEY (idActivite)  REFERENCES activite(idActivite)	
)ENGINE=INNODB;

CREATE TABLE compte_client
(
	idCompte INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idClient INT NOT NULL,
	soldeClient DOUBLE PRECISION,	
	FOREIGN KEY (idClient) REFERENCES client(idClient)
)ENGINE=INNODB;
 
CREATE TABLE devise
(	
	nomDevise VARCHAR(20),
	diminutif VARCHAR(10),
	cours DOUBLE PRECISION,
	codeIso VARCHAR(3), 
	dateDevise DATE
)ENGINE=INNODB;

CREATE TABLE categorie_chambre
(
	idCategorieChambre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomCategorieChambre VARCHAR(100),
	litUnePlace SMALLINT, 
	litDeuxPlaces SMALLINT
)ENGINE=INNODB;

CREATE TABLE hotel
(
	idHotel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomHotel VARCHAR(150),
	classe SMALLINT,
	idLocalisation INT NOT NULL,
	nombreChambre SMALLINT, 
	emailHotel VARCHAR(256),
	mdpHotel VARCHAR(256),
	imageHotelParDefaut VARCHAR(256),
	descriptionHotel TEXT,
	FOREIGN KEY (idLocalisation) REFERENCES localisation(idLocalisation)
)ENGINE=INNODB;

CREATE TABLE hotel_image
(
	idImage INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHotel INT NOT NULL,
	nomImageHotel VARCHAR(256),
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel)
)ENGINE=INNODB;

CREATE TABLE compte_hotel
(
	idCompteHotel INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHotel INT NOT NULL,
	soldeHotel DOUBLE PRECISION,
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel)
)ENGINE=INNODB;

CREATE TABLE chambre 
(
	idChambre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHotel INT NOT NULL,
	idCategorieChambre INT NOT NULL,
	nomChambre VARCHAR(150),
	prixChambre DOUBLE PRECISION,
	imageChambreParDefault VARCHAR(256),
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel),
	FOREIGN KEY (idCategorieChambre) REFERENCES categorie_chambre(idCategorieChambre)
)ENGINE=INNODB;

CREATE TABLE chambre_image
(
	idImage INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idChambre INT NOT NULL,
	nomImageChambre VARCHAR(256),
	FOREIGN KEY (idChambre) REFERENCES chambre(idChambre)
)ENGINE=INNODB;

CREATE TABLE hotel_activite
(
	idHotel INT NOT NULL,
	idActivite INT NOT NULL,
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel),
	FOREIGN KEY (idActivite) REFERENCES activite(idActivite)
)ENGINE=INNODB;

CREATE TABLE payment
(
	idPayment INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idCompte INT NOT NULL,
	idHotel INT NOT NULL,
	datePayment DATE,
	motif VARCHAR(100), 
	montant DOUBLE PRECISION,
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel)
)ENGINE=INNODB;

CREATE TABLE reservation
(
	idReservation INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idHotel INT NOT NULL,
	idChambre INT NOT NULL,
	dateReservation DATE, 
	dateDebut DATE,
	dateFin DATE,
	etat SMALLINT, 
	montant DOUBLE PRECISION, 
	nomDevise INT NOT NULL,
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel),
	FOREIGN KEY (idChambre) REFERENCES chambre(idChambre)
)ENGINE=INNODB;

CREATE TABLE abonnement
(
	idAbonnement INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomAbonnement VARCHAR(150),
	duree DOUBLE PRECISION,
	prixAbonnement DOUBLE PRECISION
)ENGINE=INNODB;

CREATE TABLE hotel_abonnement
(
	idAbonnement INT NOT NULL,
	idHotel INT NOT NULL,
	dateDebutAbonnement DATE,
	FOREIGN KEY (idAbonnement) REFERENCES abonnement(idAbonnement),
	FOREIGN KEY (idHotel) REFERENCES hotel(idHotel)
)ENGINE=INNODB;

CREATE TABLE comission
(
	idCommission INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomCommission VARCHAR(150),
	tauxCommission DOUBLE PRECISION,
	classeHotel SMALLINT 
)ENGINE=INNODB;

CREATE TABLE recette 
(
	idRecette INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	datePaymentRecette DATE,
	montant DOUBLE PRECISION,
	motif VARCHAR(100)
)ENGINE=INNODB;

CREATE TABLE admin
(
	idAdmin INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	pseudoAdmin VARCHAR(256) UNIQUE NOT NULL,
	mdpAdmin VARCHAR(256)
)ENGINE=INNODB;

CREATE TABLE log_admin 
(
	idLog INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idAdmin INT NOT NULL,
	dateConnexion DATE,
	FOREIGN KEY (idAdmin) REFERENCES admin(idAdmin)
)ENGINE=INNODB;

insert into devise (nomDevise, diminutif, codeiso, cours, dateDevise) VALUES 
('Ariary', 'Ar', 'MGA', 1, NOW()),
('Franc CFA', 'F CFA', 'CFA', 6.93, NOW()),
('Shilling Kenyan', 'Shilling', 'KES' ,35.64 , NOW()),
('Shilling Ouganda', 'Shilling','SO', 1.10, NOW()),
('Shilling Tanzanien', 'Shilling', 'TSh', 1.68, NOW()),
('Roupie Seychellois', 'Roupie', 'SCR', 266.79, NOW()),
('Dollar USA', '$', 'USD', 3908.08, NOW()),
('Euro', 'E', 'EUR', 4563.46, NOW()),
('Livre Britannique', '£', 'GBP', 5329.32, NOW()),
('Roupie indienne', 'Rs.', 'INR', 52.49, NOW()),
('Dollar Australia', '$', 'AUD', 2785.00, NOW()),
('Dollar Canada', '$ CA', 'CAD', 3042.94, NOW()),
('Franc Suisse', 'CHF', 'CHF', 4252.28, NOW()),
('Yen Japonais', 'Yen', 'JPY', 35.59, NOW()),
('Yuan Renminbi', 'Yuan', 'CNY', 601.63, NOW()),
('Rand Sud-Africain', 'Rand', 'ZAR', 256.95, NOW()),
('Franc Comorien', 'FC', 'KMF', 9.24, NOW()),
('Roupie Mauricienne', 'Roupie', 'MUR', 91.02, NOW());

INSERT INTO activite VALUES
(1, 'plage', 'SARY'),
(2, 'camping', 'SARY'),
(3, 'piscine', 'SARY'),
(4, 'yoga', 'sary'),
(5, 'vélo', 'SARY'),
(6, 'randonné', 'SARY'),
(7, 'pédalo', 'SARY'),
(8, 'canot', 'SARY'),
(9, 'kayak', 'SARY'),
(10, 'course à obstacles', 'SARY'),
(11, 'football', 'SARY'),
(12, 'basketball', 'SARY'),
(13, 'tenis', 'SARY'),
(14, 'ping-pong', 'SARY'),
(15, 'billard', 'SARY'),
(16, 'jogging', 'SARY'),
(17, 'visite guidée', 'SARY'),
(18, 'jogging', 'SARY'),
(19, 'pique-nique', 'SARY'),
(20, 'beach-volley', 'SARY'),
(21, 'cheval', 'SARY'),
(22, 'pêche', 'SARY'),
(23, 'plongée sous-marine', 'SARY'),
(24, 'surf', 'SARY');

INSERT INTO categorie_chambre VALUES
(1, 'Chambre simple', 1, 0 ),
(2, 'Chambre double', 2, 0 ),
(3, 'Chambre double dual-bed', 0, 1 ),
(4, 'Chambre triple', 3, 0 ),
(5, 'Chambre triple two-one', 2, 1 ),
(6, 'Chambre quadruple', 4, 0),
(7, 'Chambre quadruple two-two', 2, 2),
(8, 'Suite', 0,1);
	
INSERT INTO province VALUES (1, 'Antananarivo', 'Sary');

INSERT INTO localisation VALUES
(1,'Antananarivo',1, 'SARY'),
(2,'Ampefy',1, 'SARY'),
(3,'Ivato',1, 'SARY'),
(4,'Ambohimanga',1, 'SARY'),
(5,'Antsirabe',1, 'SARY');

INSERT INTO lieu VALUES
(1, 2, 'Lemur Park', 'lemurs-park.jpg', 'lsndnanfnadfnanfnafnamfoad'),
(2, 1, 'Musée de la photographie', 'muse_photo.jpg', 'fasdfioahfhaofoai'),
(3, 3, 'Croc Farm', 'croc_farm.jpg', 'flasdfiajodfaof'),
(4, 2, 'Chute de la Lily', 'chute_lily3.jpg', 'dfoiaofiawfionawonef'),
(5, 4, 'Rova Ambohimanga', 'rova_ambo1.jpg', 'foinaiofnoanffdsdlnfsl');

INSERT INTO lieu_image VALUES 
(NULL, 1,'lemurs-park.jpg'),
(NULL, 1,'lemurs-park2.jpg'),
(NULL, 1,'lemurs-park3.jpg'),
(NULL, 1,'lemurs-park4.jpg'),
(NULL, 1,'lemurs-park5.jpg'),
(NULL, 1,'lemur-park6.jpg');

INSERT INTO lieu_image VALUES 
(NULL, 2,'muse_photo.jpg'),
(NULL, 2,'muse_photo2.jpg'),
(NULL, 2,'muse_photo3.jpg'),
(NULL, 2,'muse_photo4.jpg'),
(NULL, 2,'muse_photo5.jpg'),
(NULL, 2,'muse_photo6.jpg');

INSERT INTO lieu_image VALUES 
(NULL, 3,'croc_farm.jpg'),
(NULL, 3,'croc_farm2.jpg'),
(NULL, 3,'croc_farm3.jpg'),
(NULL, 3,'croc_farm4.jpg'),
(NULL, 3,'croc_farm5.jpg');

INSERT INTO lieu_image VALUES 
(NULL, 4,'chute_lily3.jpg'),
(NULL, 4,'chute_lily4.jpg'),
(NULL, 4,'chute_lily5.jpg');

INSERT INTO lieu_image VALUES 
(NULL, 5,'rova_ambo1.jpg'),
(NULL, 5,'rova_ambo2.jpg'),
(NULL, 5,'rova_ambo4.jpg'),
(NULL, 5,'rova_ambo5.jpg'),
(NULL, 5,'rova_ambo6.jpg');

INSERT INTO hotel VALUES
(1, 'Ibiz Hotel', 3, 1, 3,'ibiz@gmail.com', 'ibiz', 'ibiz.jpg', 'lsndnanfnadfnanfnafnamfoad'),
(2, 'Jacaranda', 2, 1, 3, 'jacaranda@gmail.com', 'jacaranda', 'jacaranda.jpg', 'lsndnanfnadfnanfnafnamfoad'),
(3, 'Le Relais des Plateaux', 3, 3, 4, 'relais@gmail.com', 'relai', 'relai4.jpg', 'lsndnanfnadfnanfnafnamfoad'),
(4, 'Kavitaha', 2, 2, 2, 'kavitaha@gmail.com', 'kavitaha', 'kavitaha.jpg', 'lsndnanfnadfnanfnafnamfoad'),
(5, 'Plumeria Hotel', 3, 5, 3, 'plumeria@gmail.com', 'plumeria', 'plumeria.jpg', 'lsndnanfnadfnanfnafnamfoad');

INSERT INTO hotel_image VALUES 
(NULL, 1,'ibiz.jpg'),
(NULL, 1,'ibiz1.jpg'),
(NULL, 1,'ibiz2.jpg'),
(NULL, 1,'ibiz3.jpg'),
(NULL, 1,'ibiz5.jpg');

INSERT INTO hotel_image VALUES 
(NULL, 2,'jacaranda.jpg'),
(NULL, 2,'jacaranda2.jpg'),
(NULL, 2,'jacaranda3.jpg');

INSERT INTO hotel_image VALUES 
(NULL, 3, 'relai.jpg'),
(NULL, 3, 'relais2.jpg'),
(NULL, 3, 'relai4.jpg');

INSERT INTO hotel_image VALUES 
(NULL, 4, 'kavitaha.jpg'),
(NULL, 4, 'kavitaha2.jpg'),
(NULL, 4, 'kavitaha3.jpg'),
(NULL, 4, 'kavitaha4.jpg');

INSERT INTO hotel_image VALUES 
(NULL, 5, 'kavitaha.jpg'),
(NULL, 5, 'kavitaha2.jpg'),
(NULL, 5, 'kavitaha3.jpg'),
(NULL, 5, 'kavitaha4.jpg');

INSERT INTO chambre VALUES
(1, 1, 3, 'Standard Room', 250000, 'One_bed_lehibe_guest_room.jpg'),
(2, 1, 3, 'Superior Double Room', 350000, 'superior.jpg'),
(3, 1, 2, 'Standard Twin Room', 300000, 'twin_bed_kely_guest_room.jpg'),
(4, 2, 1, 'Simple room', 30000, 'simple_jaca.jpg'),
(5, 2, 3, 'Standard double', 50000, 'double_jaca.jpg'),
(6, 2, 3, 'Superior room', 70000, 'sup_jaca.jpg'),
(7, 3, 2, 'Twin', 250000, 'twin-relai.jpg'),
(8, 3, 3, 'Love', 300000, 'love-relai.jpg'),
(9, 3, 5, 'Family', 300000, 'family-relai.jpg'),
(10, 3, 3, 'Standard', 250000, 'standard-relai.jpg'),
(11, 4, 1, 'Simple', 40000, 'standar-kavitaha.jpg'),
(12, 4, 3, 'Standard', 55000, 'superioir-kavitaha.jpg'),
(13, 5, 2, 'Twin', 250000, 'twin-plumjpg.jpg'),
(14, 5, 3, 'Double', 300000, 'double-plum.jpg'),
(15, 5, 3, 'Superior', 370000, 'sup-plum.jpg');

INSERT INTO lieu_activite VALUES
(1,17), (1,19),
(2,17),
(3,17), (3,19),
(4, 8), (4, 22),
(5, 17), (5, 6);

INSERT INTO hotel_activite VALUES
(1, 3),
(3, 3), (3, 15),
(4, 7), (4, 3), (4,8), (4,22);


INSERT INTO province VALUES(3,'Mahajanga','mahajanga.jpg');

INSERT INTO localisation VALUES
('11','Anjohibe','3','localisation.jpg'),
('12','Katsepy','3','localisation.jpg'),
('13','Baie Bombetoka','3','localisation.jpg'),
('14','Antsanitia','3','localisation.jpg'),
('15','Boeny','3','localisation.jpg');

INSERT INTO lieu VALUES
('11','11','Grotte de Anjohibe','grotte-anjohibe.jpg','Il vous faudra au moins 6 à 7 heures (aller et retour) pour rejoindre un site exceptionnel. Situé à 83 kilomètres de Majunga et à 60 Km (de piste) à partir de la nationale. La route est parfois difficile, rochers, excavations, passages de radiers ce qui en rend le parcours moins monotone voire agréable. Vous ne pourrez pratiquer cette piste qu en 4x4 en prenant toutes les précautions d usage en cas de panne eau etc. Avant à Majunga vous aurez pris un guide seul garant de réussir à trouver cette grotte. Sur place après avoir fait les invocations aux ancêtres (grotte sacré-Fady) vous découvrirez des cathédrales somptueuses. Je bourlingue beaucoup mais là ce site est exceptionnel. A découvrir aux dédales de plafonds hauts, de couloirs où vous aurez peut-être la chance de trouver des boas venus hiberner, vous apercevrez les pipistrelles collées à leurs rochers. Stalactites et stalagmites se découvrent à chaque pas.
A quelques pas de là un lac vous permettra de vous baigner à côté de cascades. Vous pourrez camper ou faire un bivouac à côté de lémuriens coquerelli, Sifaka etc.'),
('12','12','Phare de Katsepy','Katsepy.jpg','Phare Eiffel et reliquat de forêt avec Baobabs et lémuriens à visiter. Si vous avez traversé la baie de Betsiboka pour aller de Mahajanga à Katsepy (belles plages). Il faut pousser jusqu au phare (construction atelier Eiffel). 174 marches à gravir. Un palier à environ 1/3 avant le sommet donne une belle vue sur la zone environnante. Vue panoramique sur la baie et la presqu’ile. Avec les palmiers satrana très abondant et utilisés en vannerie (nattes, paniers, ....). Petite forêt avec trois espèces de lémuriens diurnes : sifaka couronnés, les lemurs mongoz et les lemurs fulvus. Plusieurs pieds de baobabs dans cette petite forêt transformée.'),
('13','13','Eco Parc Reniala','parc-reniala.jpg','Ce petit parc vaut le détour. La marche est facile et le paysage est superbe avec de très gros baobabs. Le vrai point fort, ce sont les oiseaux. Plusieurs espèces localement endémiques que l on peut voir plus facilement ici que dans les forêts tropicales humides. De loin la meilleure observation d oiseaux que j ai vécue à Madagascar. Assurez-vous d utiliser un guide local spécialisé avec un autre observateur, car cela améliorera vos chances de voir les oiseaux étonnants'),
('14','14','Antsanitia Beach','plage-d-antsinitia.jpg','Un endroit superbe, quelque soit la marée, endroit idéal pour des photos nous y avons croisé des mariés en marée basse pour des prises de photos magnifiques
Possibilité de se restaurer sur la plage , tables aménagées sous paillote avec langouste, poissons grillés et gambas pour des prix modiques.'),
('15','15','Lac Sacré','lac-sacree.jpg','Lac décrété sacré par l ancien président de Madagascar du fait qu il est sur un terrain appartenant à sa famille.
entrée payante, aperçu de croyances locales avec sacrifices de zébu et offrandes aux poissons pour espérer être exaucé.
Honnêtement sans réel attrait, sauf pour voir quelques grosses carpes et anguilles, crocodiles (autour d un petit minuscule point d eau), et quelques lémuriens, du fait de l isolement du site.
');

INSERT INTO lieu_image VALUES
(NULL,'11','localisation.jpg'),
(NULL,'12','localisation.jpg'),
(NULL,'13','localisation.jpg'),
(NULL,'14','localisation.jpg'),
(NULL,'15','localisation.jpg');


INSERT INTO hotel VALUES
('11','Coco Lodge','4','11','20','cocolodge@moov.mg','sha1(4321)','This small park is well worth a visit. Walking is easy and the scenery is great with some very large Baobab','coco-lodge.jpg'),
('12','Antsanitia Resort','4','12','26','contact@antsanitia.com','sha1(4321)','This small park is well worth a visit. Walking is easy and the scenery is great with some very large Baobab','antsanitia-resort.jpg'),
('13','Domaine de Mandravasarotra','4','13','16','mandravasarotra@gmail.com','sha1(4321)','This small park is well worth a visit. Walking is easy and the scenery is great with some very large Baobab','mandravasarotra.jpg'),
('14','Andafiroi Lodge','4','14','18','resa@andafiroi.com','sha1(4321)','This small park is well worth a visit. Walking is easy and the scenery is great with some very large Baobab','andafiroi-lodge.jpg'),
('15','Lodge Des Terres Blanches','5','15','22','contact@lodgetb.com','sha1(4321)','This small park is well worth a visit. Walking is easy and the scenery is great with some very large Baobab','terres-blanches.jpg');

INSERT INTO hotel_image VALUES
(NULL,'11','coco.jpg'),
(NULL,'12','antsanitia.jpg'),
(NULL,'13','ddm.png'),
(NULL,'14','andafiroi.jpg'),
(NULL,'15','ldtb.jpg');


INSERT INTO chambre VALUES
('41','11','1','luxe','255000','chambre8.jpg'),
('42','12','2','luxe','284000','antsanitia-resort(2).jpg'),
('43','13','3','luxe','159000','chambre-exclusive.jpg'),
('44','14','4','luxe','153000','anadafiroi-chambre.jpg'),
('45','15','5','luxe','3200000','vue-interieure-bungalow.jpg');

INSERT INTO chambre_image VALUES
(NULL,'41','chambre4.jpg'),
(NULL,'42','antsanitia-resort(3).jpg'),
(NULL,'43','chambreexclusive(1).jpg'),
(NULL,'44','ecolodge-andafiroi(2).jpg'),
(NULL,'45','une-suite.jpg');

INSERT INTO province VALUES
('5','Fianarantsoa','FianarantsoaProvince.jpg');

INSERT INTO localisation VALUES
('21','Fianarantsoa ','5','SARY'),
('22','Manakara','5','SARY'),
('23','Ranohira','5','SARY'),
('24','Ambositra','5','SARY'),
('25','Ambohimahasoa','5','SARY');

INSERT INTO lieu VALUES
('21','22','ranomafana-national-park.','ranomafana-national-park.jpg','khsdfashdoHDOHDOahdo'),
('22','21','Andriamamovoka Chute','Andriamamovoka.jpg','akdnbalkdlakd'),
('23','23','Parc Isalo','Parc Isalo.jpg','nandlsakkdaklsdn'),
('24','22',' Canal des Pangalanes','Canal des Pangalanes.jpg','kjsdnlkasndlask'),
('25','25','Andringitra ','Andringitra.jpg','askjndlkasndladl');

INSERT INTO hotel VALUES
('21','Lac Hotel','3','21','30',' LacHotel@yahoo.fr','1234','lac-hotel.jpg','jbsdbfabfabof'),
('22','Hotel-tombontsoa','2','22','20','TombotsoaHotel@gmail.com','1234','hotel-tombontsoa.jpg','jbsdbfabfabof'),
('23','Hotel Tsara Guest House','1','23','24','	GuestHouse@gmail.com','1234','Hotel Tsara Guest House.jpg','jbsdbfabfabof'),
('24','rem-hotel','4','23','15','remHotel@moov.mg','1234','rem-hotel.jpg','jbsdbfabfabof'),
('25','Hotel Cotsoyannis','1','25','12','cotsoyannis@moov.mg','1234','Hotel Cotsoyannis.jpg','jbsdbfabfabof');


INSERT INTO hotel_image VALUES
(NULL,'21','lac-hotel1.jpg'),
(NULL,'22','hotel-tombontsoa1.jpg'),
(NULL,'23','Guest House1.jpg'),
(NULL,'24','rem-hotel1.jpg'),
(NULL,'25','cotsoyannis1.jpg');


INSERT INTO chambre VALUES
('81','21','1','Premiere classe','225000','lac-hotel2.jpg'),
('82','22','2','luxe','200000','hotel-tombontsoa2.jpg'),
('83','23','3','chambre classe','250000','GuestHouse2.jpg'),
('84','24','4','Bon accueil','300000','rem-hotel2.jpg.jpg'),
('85','25','5','Paradise','350000','lac-hotel3.jpg');


INSERT INTO chambre_image VALUES
(NULL,'81','GuestHouse3.jpg'),
(NULL,'82','rem-hotel87.jpg'),
(NULL,'83','cotsoyannis89.jpg'),
(NULL,'84','hotel-tombontsoa96.jpg'),
(NULL,'85','lac-hotel100.jpg');


INSERT INTO province VALUES (4, 'Antsiranana', 'sary');
insert into province values(
    2, 'Toamasina', 'Toamasina.jpg'
);


INSERT INTO localisation VALUES
(16,'Nosy Be',4,'NosyBe.jpeg'),
(17,'Ankify',4,'Ankify.jpg'),
(18,'Ambanja',4,'ambanja.jpg'),
(19,'Sambava',4,'Sambava.jpg'),
(20,'Antalaha',4,'Antalaha.jpg');



insert into localisation values
(6,'Foulpointe', 2,'Fouplointe.jpg'),
(7,'Sainte-Marie', 2,'SainteMarie.jpg'),
(8,'Mahambo', 2,'Mahambo.jpg'),
(9,'Fenerive-Est', 2,'FeneriveEst.jpg'),
(10,'Centre ville', 2,'CentreVille.jpg');

insert into lieu values
(6,6,'Manda Fort', 'fortmanda1.jpg','Fort Manda est une ancienne forteresse protégeant les attaques depuis la mer sur Foulpointe.'),
(7,6,'plage Foulpointe', 'plageFoulpointe.jpg','Mahavelona, de son appellation en malgache, Foulpointe est une villégiature balnéaire située sur la côte est de Madagascar. Destination de rêve grâce à sa magnifique plage protégée par un récif corallien, Foulpointe Madagascar a tout ce qu’il faut pour impressionner les visiteurs.'),
(8,7,'Nosy Boraha', 'nosyBaraha.jpg', 'Île sainte Marie ou Nosy Boraha, une petite ile paradisiaque. L’ île sainte Marie ou Nosy Boraha, est une petite ile paradisiaque de 49 km de long et 5 km de large au Nord Est de Madagascar ou passent presque chaque année des baleines à bosse à la recherche d’un refuge pour s’accoupler et mettre bas.'),
(9,8,'Plage de Mahambo', 'plageMahambo.jpg','Mahambo Madagascar - Guide et photos A 90 km de Tamatave se trouve la ville de Mahambo. Elle possède une belle plage calme, un grand lagon et une végétation plus dense que celle de Foulpointe.'),
(10,10,'Ville de Tamatave', 'CentreVille.jpg','Tamatave, la ville à multiples facettes. Gardant des vestiges d’avant l’indépendance, Tamatave recèle de nombreux sites touristiques à voir absolument. Le vieux Tamatave, la Place Bien Aimé, le port de Tamatave ou encore le littoral nord et ses plages idylliques sont autant de lieux à explorer dans cette ville haute en couleurs.');


INSERT INTO lieu VALUES
(16,16,'Nosy Iranja','NosyIranja.jpg','Nosy Iranja se situe au sud-ouest de Nosy Be,au dela de la baie des Russes à environ 27 miles nautiques soit a environ 1h30 en bateau'),
(17,16,'Mont Passot','Passot.jpg','Le mont Passot connu aussi sous le nom malgache de Bongo Pisa est une colline volcanique du centre île de Nosy Be a Madagascar.
Altitude du mont Passot est de 326 metres'),
(18,19,'CHUTES SACRÉES ANDRIAGNAMBO','ChutteSacre.jpg','Les chutes,environ 20 m de hauteur, sont un lieu sacré de purification et de vœux. Les pèlerins y font des offrandes aux ancêtres (miel, tabac, pièces de monnaie…)'),
(19,20,'PARC ANDRANOANALA','Parc.jpg','Il est à proximité ;
 on peut s’y rendre à pied depuis là. Pour une plus grande randonnée, s’engager dans le parc jusqu’à la cascade de Bevontsira. 
 Pour la « totale », le tour complet de la presqu’île vous mènera jusqu’à Maroantsetra.'),
(20,16,'Nosy Sakatia','NosySakatia.jpg','Nosy Sakatia, île aux orchidées. 
Située sur la côte ouest de Nosy Be,vous trouverez sur l’île un écosystème préservé, protégé et classé en raison des merveilles qui s’y trouvent');

INSERT INTO lieu_image VALUES
(NULL,16,'Nosy-Iranja2.jpg'),
(NULL,17,'Passot2.jpg'),
(NULL,20,'NosySakatia3.jpg'),
(NULL,19,'Parc3.jpg');



insert into lieu_image values
(NULL, 6, 'manda1.jpg'),
(NULL, 6, 'manda2.jpg'),
(NULL, 7, 'foulpointePlage1.jpg'),
(NULL, 7, 'fouplointePlage2.jpg'),
(NULL, 8, 'boraha1.jpg'),
(NULL, 8, 'boraha2.jpg'),
(NULL, 9, 'mahambo1.jpg'),
(NULL, 9, 'mahambo2.jpg'),
(NULL, 10, 'ville1.jpg'),
(NULL, 10, 'ville2.jpg');

INSERT INTO hotel VALUES 
(16,'Andilana Beach Resort',4,16,204,'andilana@voihotels.com','andl','Andilana2.jpg','Loren'),
 (17,'Royal Beach Hotel',4,16,72,'royalBeach@gmail.com','mdp','Royal.jpg','Loren descrifsnfa'),
 (18,'Hotel Lakana Ramena',2,17,90,'ramena@gmail.com','mramena','ramena.jpg','Loren descrifsnfa'),
 (19,'Hotel de la Baie',2,19,50,'hotel@gmail.com','hote','LaBaie.jpg','Loren descrifsnfa'),
 (20,'Ocean Momo',4,20,100,'ocean@gmail.com','hotel','bungmomo.jpg','Loren descrifsnfa');



insert into hotel values
(6,'Manda Beach',4, 6,10, 'Mandabeach@gmail.com','HotelToamasina123','mandabeach.jpg', 'Hôtel Manda Beach, avec sa cordialité et son style typique, offre un séjour chaleureux et distingué. '),
(7,'La Cigale',4, 6,12,'LaCigale@gmail.com' ,'HotelToamasina123', 'lacigale.jpg','hôtel La Cigale se situe sur la plage des pêcheurs à Foulpointe, 50 km de l’aéroport de Tamatave'),
(8,'Soanambo Hotel',5, 7,15,'Soanambo@gmail.com', 'HotelToamasina123', 'soanambo.jpg', 'Le Soanambo Hotel soutient le développement durable et les pratiques environnementales écologiques par utilisation de programme de traitement des eaux usées, la récolte des eaux de pluie et des chauffe-eau solaires.'),
(9,'Masoandro Lodge',5, 7, 8, 'Masoandrolodge@gmail.com' , 'HotelToamsina123','masoandro.jpg', 'Entre saveurs et douceurs. Le Masoandro Lodge est implanté dans un environnement de verdure luxuriante avec une vue magnifique sur la plage et sur Madagascar éloignée de 7km.'),
(10,'Princesse Bora Lodge',5, 7,5,'Princessbora@gmail.com','HotelToamasina123', 'princessBora.jpg','Hôtel Princesse Bora Lodge & Spa En bord de plage · Plage privée. Cet établissement se trouve sur la plage ou juste à côté et possède une plage privée. En bord de plage ·'),
(31,'La Pirogue',3, 8, 7,'Lapirogue@gmail.com','HotelToamasina123', 'pirogue.jpg','Laissez vous séduire par le charme unique et exceptionnel de l’Hôtel La Pirogue à Mahambo. C’est un hôtel lodge de charme et de caractère, avec une situation unique sur la côte Est de Madagascar à une heure de Tamatave, à vingt minutes du golf de Foulpointe et à une heure quinze de Sonierana-Ivongo, le port d’embarquement pour l’île Sainte-Marie.'),
(32,'Calypso', 5,10, 16, 'Calypso@gmail.com','HotelToamasina123', 'calypso.jpg','Le Calypso Hotel & Spa est un hôtel d’affaire se situant au coeur de Tamatave, un des principaux centres économiques de Madagascar.'),
(33,'Hotel Joffre',4, 10, 10,'Joffre@gmail.com','HotelToamasina123' ,'joffre.jpg','L’hotel Joffre à Tamatave, côte est de Madagascar, est un hotel 3 étoiles situé en plein centre ville de Tamatave. Découvrez ses chambres tout confort et son restaurant gastronomique, dans un bâtiment inspiré de la plus belle époque de Tamatave');


INSERT INTO hotel_image VALUES
(NULL,16,'Andilana3.jpg'),
(NULL,17,'Royal2.jpg'),
(NULL,19,'Baie.jpg'),
(NULL,18,'ramena2.jpg'),
(NULL,20,'ocean.jpg'),
(NULL,20,'ocean3.jpg');



INSERT INTO lieu_activite VALUES
(16,1),
(20,1),
(17,16),
(20,21),
(19,1),
(19,16),
(19,5),
(20,19);

insert into lieu_activite values
(6,16),
(6,17),
(6,5),
(7,1);
insert into lieu_activite values
(7,2),
(7,18),
(7,19),
(7,16),
(7,22),
(7,23),
(7,17);
insert into lieu_activite values
(8,1),
(8,3),
(9,18),
(10,3);
insert into lieu_activite values
(10,4),
(10,9),
(10,17),
(10,20);

insert into chambre values(
    21,6, 3, 'Bungalow Beach 1', 70000, 'mandabeach1.jpg' 
),(
    22,6, 5, 'Manda Beach 1', 50000, 'mandabeach5.jpg' 
),(
    23,7, 7, 'La Cigale Familiale', 100000, 'cigale3.jpg' 
),(
    24,7, 3, 'La Cigale Couple', 75000, 'cigale5.jpg' 
),(
    25,8, 8, 'Grande suite', 210000, 'soanambo.jpg' 
),(
    26,8, 7, 'Soanambo Room', 50000, 'soanambo4.jpg' 
),(
    27,8, 3, 'Soanambo Simple', 50000, 'soanambo2.jpg' 
),(
    28,9, 3, 'Bungalow sun', 40000, 'masoandro1.jpg' 
),(
    29,9, 7, 'Masoandro familiale', 80000, 'masoandro2.jpg' 
),(
    30,10, 5, 'Bora Royal Family', 130000, 'bora1.jpg' 
),(
   31,10, 7, 'Bora Bungalow', 70000, 'bora5.jpg' 
),(
    32,31, 3, 'Pirogue Bungalow', 40000, 'pirogue1.jpg' 
),(
    33,31, 5, 'Pirogue Family', 60000, 'pirogue4.jpg' 
),(
    34,32, 8, 'Suit Calypso', 140000, 'calypso4.jpg' 
),(
    35,33, 2, 'Joffre simple', 30000, 'joffre1.jpg' 
),(
    36,33, 3, 'Joffre couple', 30000, 'joffre2.jpg' 
);

INSERT INTO chambre VALUES 
(61,16,3,'Chambre Double Classique',600000,'ChambreAndila.jpg'),
(62,16,7,'Chambre Quadruple Classique',700000,'2chambreAndila.jpg'),
(63,17,3,'Chambre DeLuxe',800000,'RoyalChambre.jpg'),
(64,18,3,'chambre dual',100000,'Karamena2.jpg'),
(65,19,3,'Chambre Luxe',135000,'Baie.jpg'),
(66,20,3,'Makila',160000,'chambreMomo.jpg');


INSERT INTO chambre_image VALUES
 (NULL,63,'Royal2.jpg'),
 (NULL,64,'Karamena.jpg');

 
insert into chambre_image values
(NULL, 21, 'mandabeach2.jpg'),
(NULL, 21, 'mandabeach3.jpg'),
(NULL, 22, 'mandabeach4.jpg'),
(NULL, 22, 'mandabeach3.jpg'),
(NULL, 24, 'cigale1.jpg'),
(NULL, 23, 'cigale2.jpg'),
(NULL, 23, 'cigale4.jpg'),
(NULL, 24, 'cigale5.jpg'),
(NULL, 26, 'soanambo4.jpg'),
(NULL, 27, 'soanambo2.jpg'),
(NULL, 26, 'soanambo4.jpg'),
(NULL, 35, 'joffre1.jpg'),
(NULL, 35, 'joffre3.jpg'),
(NULL, 36, 'joffre2.jpg'),
(NULL, 36, 'joffre3.jpg'),
(NULL, 36, 'joffre4.jpg');



INSERT INTO province VALUES
('6','Toliara','salary-bay.jpg');


INSERT INTO localisation VALUES
('26','Ifaty','6','sary'),
('27','Bezaha','6','sary'),
('28','Saint Augustin','6','sary'),
('29','Morondava','6','sary'),
('30','Fort Dauphin','6','sary');


INSERT INTO lieu VALUES
('26','26','Arboretum de Antsokay','entree-de-l-arboretum.jpg','il est trés intéressant de se faire guider dans ce petit parc où la guide vous explique la végétation dela région et en particulier les baobabs;il y a aussi des caméléons ,mais si vous voulez voir des oiseaux,ne venez pas en milieu de journée'),
('27','27','Honko Community Based Mangrove Reserve','getlstd-property-photo.jpg','Géré par l ONG Mangrove Honko Conservation & Education, le Centre d information de Mangrove offre l opportunité unique de faire un tour de promenade guidée des mangroves du sud-ouest de Madagascar et d explorer sa flore et sa faune unique. Ce site est particulièrement connu pour sa diversité des oiseaux des zones humides (au moins 37 espèces)! Nous offrons différentes visites guidées en anglais, en français et en malgache. Contactez-nous pour plus d infos'),
('28','28','Anakao Express','caption.jpg','un aller retour à prix sympa qui évite huit heures de piste et la bonne surprise des baleines en prime'),
('29','29','Allee des Baobab','alleeBaobab.jpg','L endroit est très beau, surtout vers la fin de l’après midi en admirant le coucher de soleil. on a pu voir le baobab sacré, un lieu de culte pour les Malgaches, ils déposent des bouteilles et des étoffes pour honorer les ancêtres.'),
('30','30','Musee Rabesandratana','musee-rabesandratana.jpg','une visite originale et distrayante, avec d énormes poissons séchés (mérous, molas, requins...) que lon peut toucher, de vers, mollusques et crustacés en bocaux, et le merveilleux Coelacanthe pour terminer, le tout accompagné d une guide charmante et de tres bonne volonté.');



INSERT INTO hotel VALUES
('26','Victory Hôtel Restaurant et Piscine','3','26','29','Victory Hôtel@yahoo.fr','1234','hotel-victory.jpg','l Hotel Victory Toliara est l hôtel préféré des voyageurs visitant Toliara.'),
('27','Hôtel Amazone','4','27','20','Amazone@gmail.com','1234','hotel-amazone.jpg','un petit hôtel qui vous apporte le meilleur de Toliara à votre portée.'),
('28','Hotel de charme Hyppocampo','2','28','16','hyppocampo@gmail.com','1234','hotel-de-charme-hyppocampo.jpg','un établissement de choix pour les voyageurs comme vous.'),
('29','Moringa Hotel','4','29','26','Moringa@moov.mg','1234','photo-pierrot-men.jpg','offre un cadre familial et de nombreux services conçus pour sublimer votre séjour'),
('30','Famata Lodge','4','30','5','Famatalodge@moov.mg','1234','the-pool.jpg','le meilleur hotel de tulear tout simplement ');


INSERT INTO hotel_image VALUES
(NULL,'26','hotel-victory_2.jpg'),
(NULL,'27','hotel-amazone_3.jpg'),
(NULL,'28','photo3jpg.jpg'),
(NULL,'29','karenjy-la-voiture-malgache.jpg'),
(NULL,'30','famata-lodge_4.jpg');



INSERT INTO chambre VALUES
('101','26','3','Premiere classe','225000','famata-lodge_3.jpg'),
('102','27','8','luxe','300000','hotel-amazone_2.jpg'),
('103','28','3','chambre classe','350000','bedroom.jpg'),
('104','29','4','Bon accueil','200000','camera-piu-spaziosa.jpg'),
('105','30','7','Paradise','350000','the-top-floor-of-hemingway.jpg');


INSERT INTO chambre_image VALUES
(NULL,'101','famata-lodge_5.jpg'),
(NULL,'102','hotel-amazone_3.jpg'),
(NULL,'103','our-bedroom.jpg'),
(NULL,'104','moringa-hotel.jpg'),
(NULL,'105','famata-lodge_6.jpg');



INSERT INTO lieu_image VALUES
(NULL,'26','arboretum-d-antsokay.jpg'),
(NULL,'27','honko-community-based.jpg'),
(NULL,'28','caption_2.jpg'),
(NULL,'29','avenue-of-the-baobabs.jpg'),
(NULL,'30','musee-rabesandratana.jpg');