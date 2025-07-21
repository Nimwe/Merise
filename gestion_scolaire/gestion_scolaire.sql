CREATE TABLE professeur(
   id SERIAL,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   PRIMARY KEY(id)
);

CREATE TABLE matiere(
   id SERIAL,
   nom VARCHAR(50) ,
   id_professeur INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_professeur) REFERENCES professeur(id)
);

CREATE TABLE classe(
   id SERIAL,
   niveau VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE eleve(
   id SERIAL,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   date_naissance DATE,
   sexe BOOLEAN,
   id_classe INTEGER,
   PRIMARY KEY(id),
   FOREIGN KEY(id_classe) REFERENCES classe(id)
);

CREATE TABLE salle_cours(
   id SERIAL,
   numero VARCHAR(50) ,
   id_classe INTEGER NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_classe),
   FOREIGN KEY(id_classe) REFERENCES classe(id)
);

CREATE TABLE eleve_matiere(
   id_eleve INTEGER,
   id_matiere INTEGER,
   notes NUMERIC(15,2)  ,
   PRIMARY KEY(id_eleve, id_matiere),
   FOREIGN KEY(id_eleve) REFERENCES eleve(id),
   FOREIGN KEY(id_matiere) REFERENCES matiere(id)
);

CREATE TABLE classe_matiere(
   id_matiere INTEGER,
   id_classe INTEGER,
   nb_heure INTEGER,
   PRIMARY KEY(id_matiere, id_classe),
   FOREIGN KEY(id_matiere) REFERENCES matiere(id),
   FOREIGN KEY(id_classe) REFERENCES classe(id)
);
