CREATE TABLE salle(
   id_salle VARCHAR(50),
   nom VARCHAR(250),
   adresse VARCHAR(250),
   telephone INT,
   mail VARCHAR(250),
   site_internet VARCHAR(250),
   PRIMARY KEY(id_salle)
);

CREATE TABLE type_spectacle(
   id_type_spectacle VARCHAR(50),
   nom VARCHAR(50),
   PRIMARY KEY(id_type_spectacle)
);

CREATE TABLE spectacle(
   id_spectacle VARCHAR(50),
   nom VARCHAR(250),
   date_debut DATE,
   date_fin DATE,
   prix_ticket DECIMAL(15,2),
   id_salle VARCHAR(50),
   id_type_spectacle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_spectacle),
   FOREIGN KEY(id_salle) REFERENCES salle(id_salle),
   FOREIGN KEY(id_type_spectacle) REFERENCES type_spectacle(id_type_spectacle)
);

CREATE TABLE representation(
   id_representation VARCHAR(50),
   heure_debut TIME,
   heure_fin TIME,
   id_spectacle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_representation),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle)
);

CREATE TABLE spectateur(
   id_spectateur INT,
   nom VARCHAR(250),
   prenom VARCHAR(250),
   adresse VARCHAR(250),
   mail VARCHAR(250),
   telephone INT,
   PRIMARY KEY(id_spectateur)
);

CREATE TABLE role_intervenant(
   id_role_intervenant INT,
   nom VARCHAR(250),
   PRIMARY KEY(id_role_intervenant)
);

CREATE TABLE mode_reservation(
   id_mode_reservation INT,
   nom VARCHAR(50),
   PRIMARY KEY(id_mode_reservation)
);

CREATE TABLE reservation(
   id_reservation VARCHAR(50),
   nb_place INT,
   date_reservation DATE,
   montant_total DECIMAL(15,2),
   id_mode_reservation INT NOT NULL,
   id_representation VARCHAR(50) NOT NULL,
   id_spectateur INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_mode_reservation) REFERENCES mode_reservation(id_mode_reservation),
   FOREIGN KEY(id_representation) REFERENCES representation(id_representation),
   FOREIGN KEY(id_spectateur) REFERENCES spectateur(id_spectateur)
);

CREATE TABLE intervenants_theatre(
   id_intervenants_theatre VARCHAR(50),
   nom VARCHAR(250),
   prenom VARCHAR(250),
   id_role_intervenant INT NOT NULL,
   PRIMARY KEY(id_intervenants_theatre),
   FOREIGN KEY(id_role_intervenant) REFERENCES role_intervenant(id_role_intervenant)
);

CREATE TABLE intervenir(
   id_spectacle VARCHAR(50),
   id_intervenants_theatre VARCHAR(50),
   PRIMARY KEY(id_spectacle, id_intervenants_theatre),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id_spectacle),
   FOREIGN KEY(id_intervenants_theatre) REFERENCES intervenants_theatre(id_intervenants_theatre)
);
