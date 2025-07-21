CREATE TABLE equipe(
   id SERIAL,
   code VARCHAR(50) ,
   nom VARCHAR(250) ,
   date_creation DATE,
   PRIMARY KEY(id)
);

CREATE TABLE joueur(
   id SERIAL,
   numero_immatriculation INTEGER,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   date_naissance DATE,
   id_equipe INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id)
);

CREATE TABLE arbitre(
   id SERIAL,
   numero INTEGER,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   PRIMARY KEY(id)
);

CREATE TABLE rencontre(
   id SERIAL,
   numero INTEGER,
   date_ DATE,
   heure_debut TIME,
   id_arbitre INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_arbitre) REFERENCES arbitre(id)
);

CREATE TABLE equipe_rencontre(
   id_equipe INTEGER,
   id_rencontre INTEGER,
   resultat INTEGER,
   PRIMARY KEY(id_equipe, id_rencontre),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id),
   FOREIGN KEY(id_rencontre) REFERENCES rencontre(id)
);
