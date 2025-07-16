CREATE TABLE equipe(
   id_equipe INTEGER,
   code_equipe VARCHAR(50) ,
   nom_equipe VARCHAR(250) ,
   date_creation DATE,
   PRIMARY KEY(id_equipe)
);

CREATE TABLE joueur(
   id_joueur VARCHAR(50) ,
   numero_immatriculation INTEGER,
   nom_joueur VARCHAR(250) ,
   prenom_joueur VARCHAR(250) ,
   date_naissance DATE,
   id_equipe INTEGER NOT NULL,
   PRIMARY KEY(id_joueur),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id_equipe)
);

CREATE TABLE arbitre(
   id_arbitre VARCHAR(50) ,
   numero_arbitre INTEGER,
   nom_arbitre VARCHAR(250) ,
   prenom_arbitre VARCHAR(250) ,
   PRIMARY KEY(id_arbitre)
);

CREATE TABLE rencontre(
   id_rencontre VARCHAR(50) ,
   numero_rencontre INTEGER,
   date_rencontre DATE,
   heure_debut TIME,
   resultat VARCHAR(250) ,
   id_arbitre VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_rencontre),
   FOREIGN KEY(id_arbitre) REFERENCES arbitre(id_arbitre)
);

CREATE TABLE jouer(
   id_equipe INTEGER,
   id_rencontre VARCHAR(50) ,
   PRIMARY KEY(id_equipe, id_rencontre),
   FOREIGN KEY(id_equipe) REFERENCES equipe(id_equipe),
   FOREIGN KEY(id_rencontre) REFERENCES rencontre(id_rencontre)
);
