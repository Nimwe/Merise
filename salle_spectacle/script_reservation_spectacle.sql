CREATE TABLE salle(
   id SERIAL,
   nom VARCHAR(250) ,
   adresse VARCHAR(250) ,
   telephone INTEGER,
   mail VARCHAR(250) ,
   site_internet VARCHAR(250) ,
   PRIMARY KEY(id)
);

CREATE TABLE type_spectacle(
   id SERIAL,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE spectacle(
   id SERIAL,
   nom VARCHAR(250) ,
   date_debut DATE,
   date_fin DATE,
   prix_ticket NUMERIC(15,2)  ,
   id_salle INTEGER,
   id_type_spectacle INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_salle) REFERENCES salle(id),
   FOREIGN KEY(id_type_spectacle) REFERENCES type_spectacle(id)
);

CREATE TABLE representation(
   id SERIAL,
   heure_debut TIME,
   heure_fin TIME,
   id_spectacle INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id)
);

CREATE TABLE spectateur(
   id SERIAL,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   adresse VARCHAR(250) ,
   mail VARCHAR(250) ,
   telephone INTEGER,
   PRIMARY KEY(id)
);

CREATE TABLE role_intervenant(
   id SERIAL,
   nom VARCHAR(250) ,
   PRIMARY KEY(id)
);

CREATE TABLE mode_reservation(
   id SERIAL,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE reservation(
   id SERIAL,
   nb_place INTEGER,
   date_reservation DATE,
   montant_total NUMERIC(15,2)  ,
   id_mode_reservation INTEGER NOT NULL,
   id_representation INTEGER NOT NULL,
   id_spectacteur INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_mode_reservation) REFERENCES mode_reservation(id),
   FOREIGN KEY(id_representation) REFERENCES representation(id),
   FOREIGN KEY(id_spectacteur) REFERENCES spectateur(id)
);

CREATE TABLE intervenants_theatre(
   id SERIAL,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   id_intervenant INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_intervenant) REFERENCES role_intervenant(id)
);

CREATE TABLE intervenir(
   id_spectacle INTEGER,
   id_intervenants INTEGER,
   PRIMARY KEY(id_spectacle, id_intervenants),
   FOREIGN KEY(id_spectacle) REFERENCES spectacle(id),
   FOREIGN KEY(id_intervenants) REFERENCES intervenants_theatre(id)
);
