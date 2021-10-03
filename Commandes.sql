CREATE DATABASE IF NOT EXISTS CINEMAS SET utfmb4 COLLATE utf8mb4_general_ci;

CREATE TABLE administrateur (
    id_administrateur INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom VARCHAR(30),
    prenom VARCHAR(30)
) engine=INNODB; 

CREATE TABLE cinemas (
    id_cinema INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    adresse VARCHAR(100),
    administrateur INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_administrateur
    FOREIGN KEY (administrateur)
    REFERENCES  administrateur(id_administrateur)
) engine=INNODB;

CREATE TABLE salle (
    id_salle INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    capacité INT,
    numéro INT,
    cinema INT UNSIGNED NOT NULL,
    projection INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_cinema
    FOREIGN KEY (cinema)
    REFERENCES  cinemas(id_cinema),
    CONSTRAINT FK_id_projection
    FOREIGN KEY (projection)
    REFERENCES projection(id_projection)
)engine=INNODB;

CREATE TABLE horaire (
    id_horaire INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    date_projection DATE,
    heure TIME
)engine=INNODB;

CREATE TABLE tarif (
    id_tarif INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    description_tarif VARCHAR(300),
    prix FLOAT,
    administrateur INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_administrateur
    FOREIGN KEY (administrateur)
    REFERENCES  administrateur(id_administrateur)
)engine=INNODB;

CREATE TABLE film (
    id_film INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titre VARCHAR(100)
    duree TIME
    realisateur VARCHAR(30)
)

CREATE TABLE vendeur (
    id_vendeur INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(30),
    prenom VARCHAR(30),
)engine=INNODB;

CREATE TABLE client (
    id_client INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    film INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_film
    FOREIGN KEY (film)
    REFERENCES  film(id_film)
)engine=INNODB;

CREATE TABLE internaute (
    id_internaute INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(30),
    prenom VARCHAR(30),
    username VARCHAR(30),
    email VARCHAR(320),
    mot_de_passe CHAR(36),
    film INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_film
    FOREIGN KEY (film)
    REFERENCES  film(id_film)
)engine=INNODB;

CREATE TABLE reservationGuichet (
    id_reservationGuichet INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    projection VARCHAR(100),
    codeBarre VARCHAR(13),
    nbPlace INT,
    prix FLOAT,
    vendeur INT UNSIGNED NOT NULL, 
    paiement INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_vendeur
    FOREIGN KEY (vendeur)
    REFERENCES vendeur(id_vendeur),
    CONSTRAINT FK_id_paiement
    FOREIGN KEY (paiement)
    REFERENCES  paiement(id_paiement),
)engine=INNODB;

CREATE TABLE reservationWeb (
    id_reservationWeb INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    projection VARCHAR(100),
    codeBarre VARCHAR(13),
    nbPlace INT,
    prix FLOAT,
    paiement INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_paiement
    FOREIGN KEY (paiement)
    REFERENCES  paiement(id_paiement),
)engine=INNODB;

CREATE TABLE paiement (
    id_paiement INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
)engine=INNODB;

CREATE TABLE projection (
    id_projection INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    placesLibres INT,
    placesReservees INT,
    administrateur INT UNSIGNED NOT NULL,
    film INT UNSIGNED NOT NULL,
    horaire INT UNSIGNED NOT NULL,
    CONSTRAINT FK_id_administrateur
    FOREIGN KEY (administrateur)
    REFERENCES  administrateur(id_administrateur),
    CONSTRAINT FK_id_film
    FOREIGN KEY (film)
    REFERENCES  film(id_film),
    CONSTRAINT FK_id_horaire
    FOREIGN KEY (horaire)
    REFERENCES  horaire(id_horaire),
)engine=INNODB;

-- ajouter les associations binaire ! --


--remplissage des tables--
insert into administrateur (id_administrateur, first_name, last_name) values (1, 'Alon', 'Zeplin');
insert into administrateur (id_administrateur, first_name, last_name) values (2, 'Vitoria', 'Tegeller');
insert into administrateur (id_administrateur, first_name, last_name) values (3, 'Delcine', 'Mix');
insert into administrateur (id_administrateur, first_name, last_name) values (4, 'Chauncey', 'Cracknall');
insert into administrateur (id_administrateur, first_name, last_name) values (5, 'Carilyn', 'Trunkfield');

insert into cinemas (id_cinema, adresse) values (1, '043 Scott Point');
insert into cinemas (id_cinema, adresse) values (2, '899 Alpine Terrace');
insert into cinemas (id_cinema, adresse) values (3, '0883 Rieder Road');
insert into cinemas (id_cinema, adresse) values (4, '2 Bowman Pass');
insert into cinemas (id_cinema, adresse) values (5, '57043 Mallard Parkway');

insert into salle (id_salle, capacite, numero) values (1, 100, 1);
insert into salle (id_salle, capacite, numero) values (2, 100, 2);
insert into salle (id_salle, capacite, numero) values (3, 100, 3);
insert into salle (id_salle, capacite, numero) values (4, 100, 4);
insert into salle (id_salle, capacite, numero) values (5, 100, 5);
insert into salle (id_salle, capacite, numero) values (6, 100, 6);
insert into salle (id_salle, capacite, numero) values (7, 100, 7);
insert into salle (id_salle, capacite, numero) values (8, 100, 8);
insert into salle (id_salle, capacite, numero) values (9, 100, 9);
insert into salle (id_salle, capacite, numero) values (10, 100, 10);

insert into horaire (id_horaire, date_projection, heure) values (1, '8/2/2021', '9:00 AM');
insert into horaire (id_horaire, date_projection, heure) values (2, '8/28/2021', '6:41 AM');
insert into horaire (id_horaire, date_projection, heure) values (3, '1/23/2021', '4:27 AM');
insert into horaire (id_horaire, date_projection, heure) values (4, '2/11/2021', '7:53 PM');
insert into horaire (id_horaire, date_projection, heure) values (5, '5/28/2021', '12:39 AM');
insert into horaire (id_horaire, date_projection, heure) values (6, '1/28/2021', '9:26 PM');
insert into horaire (id_horaire, date_projection, heure) values (7, '12/15/2020', '6:41 PM');
insert into horaire (id_horaire, date_projection, heure) values (8, '8/5/2021', '5:57 PM');
insert into horaire (id_horaire, date_projection, heure) values (9, '2/20/2021', '8:52 AM');
insert into horaire (id_horaire, date_projection, heure) values (10, '9/16/2021', '5:03 AM');

insert into tarif (id_tarif, description_tarif, prix) values (1, 'Plein tarif', '9.20');
insert into tarif (id_tarif, description_tarif, prix) values (2, 'Etudiant', '7.60');
insert into tarif (id_tarif, description_tarif, prix) values (3, '-14 ans', '5.90');

insert into film (id_film, titre, duree, Réalisateur) values (1, 'The Crown Jewels', '2:54', 'Ella Lemhagen');
insert into film (id_film, titre, duree, Réalisateur) values (2, 'Jane Eyre', '2:00', 'Cary Joji Fukunaga');
insert into film (id_film, titre, duree, Réalisateur) values (3, 'How to Kill Your Neighbor''s Dog', '1:48', 'Michael Kalesniko');
insert into film (id_film, titre, duree, Réalisateur) values (4, 'Fury, The', '2:14', 'David Ayer');

insert into vendeur (id_vendeur, nom, prenom) values (1, 'Gaylord', 'Caizley');
insert into vendeur (id_vendeur, nom, prenom) values (2, 'Nike', 'Paynes');
insert into vendeur (id_vendeur, nom, prenom) values (3, 'Tiff', 'Fasham');
insert into vendeur (id_vendeur, nom, prenom) values (4, 'Arron', 'Grayshan');
insert into vendeur (id_vendeur, nom, prenom) values (5, 'Liane', 'O Sullivan');
insert into vendeur (id_vendeur, nom, prenom) values (6, 'Grover', 'California');
insert into vendeur (id_vendeur, nom, prenom) values (7, 'Genevra', 'Bartosik');
insert into vendeur (id_vendeur, nom, prenom) values (8, 'Adolf', 'Ambrosch');
insert into vendeur (id_vendeur, nom, prenom) values (9, 'Ruth', 'Torres');
insert into vendeur (id_vendeur, nom, prenom) values (10, 'Caterina', 'McLice');
insert into vendeur (id_vendeur, nom, prenom) values (11, 'Tonye', 'Jekel');
insert into vendeur (id_vendeur, nom, prenom) values (12, 'Samaria', 'Mattioni');
insert into vendeur (id_vendeur, nom, prenom) values (13, 'Domenico', 'Chrippes');
insert into vendeur (id_vendeur, nom, prenom) values (14, 'Alica', 'Hastwell');
insert into vendeur (id_vendeur, nom, prenom) values (15, 'Devondra', 'Rose');
insert into vendeur (id_vendeur, nom, prenom) values (16, 'Gradey', 'Danet');
insert into vendeur (id_vendeur, nom, prenom) values (17, 'Meagan', 'Arthan');
insert into vendeur (id_vendeur, nom, prenom) values (18, 'Joya', 'Ternott');

insert into client (id_client) values (1);
insert into client (id_client) values (2);
insert into client (id_client) values (3);
insert into client (id_client) values (4);
insert into client (id_client) values (5);
insert into client (id_client) values (6);
insert into client (id_client) values (7);
insert into client (id_client) values (8);
insert into client (id_client) values (9);
insert into client (id_client) values (10);
insert into client (id_client) values (11);
insert into client (id_client) values (12);
insert into client (id_client) values (13);
insert into client (id_client) values (14);
insert into client (id_client) values (15);
insert into client (id_client) values (16);
insert into client (id_client) values (17);
insert into client (id_client) values (18);
insert into client (id_client) values (19);
insert into client (id_client) values (20);
insert into client (id_client) values (21);
insert into client (id_client) values (22);
insert into client (id_client) values (23);
insert into client (id_client) values (24);
insert into client (id_client) values (25);
insert into client (id_client) values (26);
insert into client (id_client) values (27);
insert into client (id_client) values (28);
insert into client (id_client) values (29);
insert into client (id_client) values (30);
insert into client (id_client) values (31);
insert into client (id_client) values (32);
insert into client (id_client) values (33);
insert into client (id_client) values (34);
insert into client (id_client) values (35);
insert into client (id_client) values (36);
insert into client (id_client) values (37);
insert into client (id_client) values (38);
insert into client (id_client) values (39);
insert into client (id_client) values (40);
insert into client (id_client) values (41);
insert into client (id_client) values (42);
insert into client (id_client) values (43);
insert into client (id_client) values (44);
insert into client (id_client) values (45);
insert into client (id_client) values (46);
insert into client (id_client) values (47);
insert into client (id_client) values (48);
insert into client (id_client) values (49);
insert into client (id_client) values (50);
insert into client (id_client) values (51);
insert into client (id_client) values (52);
insert into client (id_client) values (53);
insert into client (id_client) values (54);
insert into client (id_client) values (55);
insert into client (id_client) values (56);
insert into client (id_client) values (57);
insert into client (id_client) values (58);
insert into client (id_client) values (59);
insert into client (id_client) values (60);
insert into client (id_client) values (61);
insert into client (id_client) values (62);
insert into client (id_client) values (63);
insert into client (id_client) values (64);
insert into client (id_client) values (65);
insert into client (id_client) values (66);
insert into client (id_client) values (67);
insert into client (id_client) values (68);
insert into client (id_client) values (69);
insert into client (id_client) values (70);
insert into client (id_client) values (71);
insert into client (id_client) values (72);
insert into client (id_client) values (73);
insert into client (id_client) values (74);
insert into client (id_client) values (75);
insert into client (id_client) values (76);
insert into client (id_client) values (77);
insert into client (id_client) values (78);
insert into client (id_client) values (79);
insert into client (id_client) values (80);
insert into client (id_client) values (81);
insert into client (id_client) values (82);
insert into client (id_client) values (83);
insert into client (id_client) values (84);
insert into client (id_client) values (85);
insert into client (id_client) values (86);
insert into client (id_client) values (87);
insert into client (id_client) values (88);
insert into client (id_client) values (89);
insert into client (id_client) values (90);
insert into client (id_client) values (91);
insert into client (id_client) values (92);
insert into client (id_client) values (93);
insert into client (id_client) values (94);
insert into client (id_client) values (95);
insert into client (id_client) values (96);
insert into client (id_client) values (97);
insert into client (id_client) values (98);
insert into client (id_client) values (99);
insert into client (id_client) values (100);

insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (1, 'Klaassens', 'Saxe', 'sklaassens0', 'sklaassens0@earthlink.net', '$2y$10$wlbVES.zN7lA.zaAqi4JPeCMW439Su1GjE7VWpf51DQ2pWD.MHXR6');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (2, 'Huyhton', 'Sydel', 'shuyhton1', 'shuyhton1@example.com', '$2y$10$lg.s72wM5KKkv1ZXqrND5OIUrOH/3/WI7M7P/OxbTdtDwfwyUhLEa');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (3, 'Hemphall', 'Farly', 'fhemphall2', 'fhemphall2@stanford.edu', '$2y$10$KkM3AMfBPo/hD9A./CmJUOAgHXFILIp2WGW.JEOh1DFBMpQz4912y');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (4, 'Wringe', 'Kira', 'kwringe3', 'kwringe3@wired.com', '$2y$10$iZBlnMOLAcFuBENjf/k/Su/u/JkJgew9G9L9aksRQvfMIUhZY6tI6');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (5, 'Eriksson', 'Maurice', 'meriksson4', 'meriksson4@archive.org', '$2y$10$YoeDCyIb81kg30v7XZjCtuSr.mMlpRIltw9xLw/boL0Jx8xteN76O');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (6, 'Caron', 'Sophey', 'scaron5', 'scaron5@google.com.br', '$2y$10$uCBkBdxLM0MErDcNV3lFxe0TI/AKmzHzDg12EeVgXwnaqfqtnzpz2');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (7, 'Baish', 'Benni', 'bbaish6', 'bbaish6@fda.gov', '$2y$10$xZiSFT06VTWtkyxPZanI7.SYPJKzNKOu108XRIxUoKro09ppU6MDK');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (8, 'Pountain', 'Delcine', 'dpountain7', 'dpountain7@mysql.com', '$2y$10$6j5D5PkgO6Gc1u2bqDb0E.9QyJrmchjngLqTx9yW9REPKMdssvXOy');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (9, 'Suart', 'Hilliard', 'hsuart8', 'hsuart8@photobucket.com', '$2y$10$cEigU8gG9XidrrmTVVM/qeFAG9uPUMpLGMhVnaDATHqQGyTCwlk9u');
insert into internaute (id_internaute, nom, prenom, username, email, mot_de_passe) values (10, 'Matthai', 'Delmore', 'dmatthai9', 'dmatthai9@engadget.com', '$2y$10$EvALt6YpeJSNu9pdxXLECen4uLt2IFBlqWdmbYOdJfzciCgvfINXa');


insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (1, 5, '€24,74', '16714-405');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (2, 2, '€22,47', '53346-1359');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (3, 5, '€18,17', '65197-212');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (4, 3, '€8,73', '68084-371');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (5, 5, '€36,06', '54859-603');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (6, 4, '€15,24', '61269-210');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (7, 4, '€38,66', '35356-825');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (8, 2, '€28,60', '0378-2224');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (9, 3, '€27,75', '37808-057');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (10, 5, '€33,98', '51079-697');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (11, 1, '€22,07', '53645-1001');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (12, 4, '€33,33', '36987-2637');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (13, 1, '€10,88', '55154-1333');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (14, 3, '€42,50', '43455-0003');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (15, 2, '€22,28', '68788-9507');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (16, 1, '€10,92', '63941-449');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (17, 3, '€25,71', '63323-103');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (18, 1, '€41,80', '59137-525');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (19, 1, '€16,97', '54973-0607');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (20, 3, '€17,46', '11528-010');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (21, 4, '€22,48', '53877-001');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (22, 1, '€32,10', '10742-8341');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (23, 1, '€33,13', '49288-0154');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (24, 1, '€23,93', '42254-025');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (25, 4, '€13,30', '61062-0006');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (26, 1, '€26,12', '64763-099');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (27, 4, '€33,73', '43547-274');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (28, 4, '€33,74', '76472-1149');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (29, 4, '€27,76', '0378-8270');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (30, 1, '€22,16', '36987-2175');
insert into reservationGuichet (id_reservationGuichet , nbPlace, prix, codeBarre) values (31, 2, '€17,52', '0074-6633');

insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (1, 2, '€42,02', '54569-5638');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (2, 5, '€27,35', '59883-821');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (3, 2, '€41,53', '41520-179');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (4, 4, '€11,38', '0087-6672');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (5, 3, '€14,84', '0378-6069');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (6, 1, '€40,88', '67046-115');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (7, 5, '€35,56', '43419-019');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (8, 5, '€18,34', '41163-617');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (9, 5, '€40,65', '42023-104');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (10, 4, '€18,07', '41415-056');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (11, 5, '€28,62', '62856-001');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (12, 1, '€16,38', '62011-0223');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (13, 1, '€18,83', '52584-027');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (14, 4, '€37,69', '24236-729');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (15, 2, '€18,66', '0228-2539');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (16, 4, '€18,46', '36987-2460');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (17, 5, '€7,75', '36987-2848');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (18, 2, '€25,59', '37012-734');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (19, 5, '€44,73', '0378-0373');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (20, 2, '€42,94', '58214-100');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (21, 5, '€17,15', '49999-039');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (22, 2, '€23,22', '52125-070');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (23, 5, '€7,01', '63629-3678');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (24, 4, '€24,36', '0009-3475');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (25, 5, '€44,14', '69133-030');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (26, 2, '€14,25', '51672-4105');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (27, 2, '€32,92', '0173-0665');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (28, 2, '€36,11', '0268-0842');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (29, 3, '€25,68', '0268-6524');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (30, 2, '€12,46', '55154-6244');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (31, 5, '€22,66', '62670-4786');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (32, 5, '€25,53', '76354-001');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (33, 5, '€29,45', '0268-6548');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (34, 5, '€35,47', '54868-5464');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (35, 2, '€15,84', '58118-5063');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (36, 5, '€9,24', '33992-1062');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (37, 2, '€20,43', '0093-0813');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (38, 3, '€35,66', '54868-4367');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (39, 4, '€18,49', '47993-200');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (40, 2, '€35,49', '49371-023');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (41, 5, '€20,32', '67457-524');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (42, 4, '€10,97', '0703-5775');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (43, 2, '€29,27', '17856-5725');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (44, 3, '€9,33', '55301-730');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (45, 3, '€20,66', '52584-602');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (46, 1, '€41,32', '51346-040');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (47, 3, '€28,49', '69164-3001');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (48, 5, '€6,70', '63629-2679');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (49, 4, '€44,26', '0409-1141');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (50, 5, '€27,07', '0268-0004');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (51, 3, '€16,47', '55714-4444');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (52, 2, '€34,97', '10191-1857');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (53, 4, '€20,35', '0179-1971');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (54, 2, '€35,88', '21695-122');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (55, 2, '€32,05', '43063-060');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (56, 1, '€24,17', '0054-0523');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (57, 1, '€43,35', '61919-817');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (58, 4, '€35,91', '69103-3503');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (59, 2, '€23,02', '67253-542');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (60, 2, '€43,68', '54868-3043');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (61, 3, '€22,92', '65197-103');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (62, 3, '€37,27', '41520-217');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (63, 4, '€6,55', '49035-908');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (64, 3, '€14,82', '42361-039');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (65, 2, '€13,79', '37000-097');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (66, 4, '€32,27', '50845-0211');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (67, 4, '€19,47', '66908-700');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (68, 2, '€33,91', '53746-110');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (69, 4, '€20,41', '55312-359');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (70, 1, '€33,54', '42549-559');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (71, 4, '€37,36', '55154-0534');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (72, 2, '€31,09', '49348-802');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (73, 1, '€30,36', '0363-0667');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (74, 1, '€44,23', '66715-9752');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (75, 5, '€42,13', '0220-9032');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (76, 3, '€21,73', '55154-6627');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (77, 1, '€35,91', '62750-023');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (78, 2, '€7,70', '14783-266');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (79, 2, '€16,69', '66096-113');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (80, 3, '€8,61', '68382-230');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (81, 2, '€34,42', '68258-7056');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (82, 4, '€36,12', '49527-112');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (83, 2, '€40,07', '50975-011');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (84, 2, '€44,91', '51830-022');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (85, 1, '€15,58', '0065-1433');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (86, 1, '€7,90', '65044-3108');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (87, 5, '€23,68', '55154-4034');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (88, 1, '€24,54', '64725-7544');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (89, 1, '€38,76', '58177-312');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (90, 4, '€11,69', '43857-0280');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (91, 3, '€6,83', '37000-838');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (92, 1, '€31,89', '62011-0096');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (93, 5, '€43,61', '60505-2870');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (94, 4, '€31,02', '55714-2217');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (95, 1, '€22,15', '0713-0633');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (96, 1, '€18,41', '0007-4201');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (97, 5, '€43,44', '49643-130');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (98, 5, '€24,87', '65044-5210');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (99, 1, '€10,92', '57520-0382');
insert into reservationWeb (id_reservationWeb, nbPlace, prix, codeBarre) values (100, 5, '€38,89', '68084-463');
