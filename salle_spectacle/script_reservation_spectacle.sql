CREATE TABLE type_spectacle(
   id_type_spectacle VARCHAR(50),
   theatre LOGICAL,
   concert LOGICAL,
   PRIMARY KEY(id_type_spectacle)
);

CREATE TABLE representation(
   id_representation VARCHAR(50),
   id_spectacle VARCHAR(50),
   heure_debut TIME,
   heure_fin TIME,
   PRIMARY KEY(id_representation, id_spectacle)
);

CREATE TABLE spectateur(
   id_spectateur VARCHAR(50),
   nom VARCHAR(250),
   prenom VARCHAR(250),
   adresse VARCHAR(250),
   mail VARCHAR(250),
   telephone INT,
   PRIMARY KEY(id_spectateur)
);

CREATE TABLE reservation(
   id_reservation VARCHAR(50),
   date_reservation DATE,
   nb_place INT,
   montant_total DECIMAL(15,2),
   PRIMARY KEY(id_reservation)
);

CREATE TABLE mode_reservation(
   id_mode_reservation VARCHAR(50),
   telephone LOGICAL,
   en_ligne LOGICAL,
   id_reservation VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_mode_reservation),
   FOREIGN KEY(id_reservation) REFERENCES reservation(id_reservation)
);

CREATE TABLE intervenants_theatre(
   id_intervenants_theatre VARCHAR(50),
   comedien LOGICAL,
   equipe_technnique LOGICAL,
   nom VARCHAR(250),
   prenom VARCHAR(250),
   role VARCHAR(250),
   fonctio VARCHAR(250),
   PRIMARY KEY(id_intervenants_theatre)
);

CREATE TABLE spectacle(
   id_spectacle VARCHAR(50),
   id_salle VARCHAR(50),
   nom VARCHAR(250),
   date_debut DATE,
   date_fin DATE,
   prix_ticket DECIMAL(15,2),
   id_representation VARCHAR(50) NOT NULL,
   id_spectacle_1 VARCHAR(50) NOT NULL,
   id_type_spectacle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_spectacle, id_salle),
   FOREIGN KEY(id_representation, id_spectacle_1) REFERENCES representation(id_representation, id_spectacle),
   FOREIGN KEY(id_type_spectacle) REFERENCES type_spectacle(id_type_spectacle)
);

CREATE TABLE salle(
   id_salle VARCHAR(50),
   nom VARCHAR(250),
   adresse VARCHAR(250),
   telephone INT,
   mail VARCHAR(250),
   site_internet VARCHAR(250),
   id_spectacle VARCHAR(50) NOT NULL,
   id_salle_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_salle),
   UNIQUE(id_spectacle, id_salle_1),
   FOREIGN KEY(id_spectacle, id_salle_1) REFERENCES spectacle(id_spectacle, id_salle)
);

CREATE TABLE intervenir(
   id_spectacle VARCHAR(50),
   id_salle VARCHAR(50),
   id_intervenants_theatre VARCHAR(50),
   PRIMARY KEY(id_spectacle, id_salle, id_intervenants_theatre),
   FOREIGN KEY(id_spectacle, id_salle) REFERENCES spectacle(id_spectacle, id_salle),
   FOREIGN KEY(id_intervenants_theatre) REFERENCES intervenants_theatre(id_intervenants_theatre)
);

CREATE TABLE voir(
   id_representation VARCHAR(50),
   id_spectacle VARCHAR(50),
   id_spectateur VARCHAR(50),
   PRIMARY KEY(id_representation, id_spectacle, id_spectateur),
   FOREIGN KEY(id_representation, id_spectacle) REFERENCES representation(id_representation, id_spectacle),
   FOREIGN KEY(id_spectateur) REFERENCES spectateur(id_spectateur)
);

CREATE TABLE reserver(
   id_spectateur VARCHAR(50),
   id_reservation VARCHAR(50),
   PRIMARY KEY(id_spectateur, id_reservation),
   FOREIGN KEY(id_spectateur) REFERENCES spectateur(id_spectateur),
   FOREIGN KEY(id_reservation) REFERENCES reservation(id_reservation)
);
