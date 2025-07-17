CREATE TABLE professeur(
   id_professeur VARCHAR(50) ,
   nom VARCHAR(250) ,
   prenom VARCHAR(250) ,
   matiere_enseignee VARCHAR(250) ,
   niveau_classe VARCHAR(50) ,
   PRIMARY KEY(id_professeur)
);

CREATE TABLE matiere(
   id_matiere VARCHAR(50) ,
   math VARCHAR(50) ,
   francais VARCHAR(50) ,
   histoire VARCHAR(50) ,
   geographie VARCHAR(50) ,
   physique VARCHAR(50) ,
   chimie VARCHAR(50) ,
   techno VARCHAR(50) ,
   id_professeur VARCHAR(50) ,
   PRIMARY KEY(id_matiere),
   FOREIGN KEY(id_professeur) REFERENCES professeur(id_professeur)
);

CREATE TABLE cours(
   id_cours VARCHAR(50) ,
   nom VARCHAR(250) ,
   nb_heures NUMERIC(15,2)  ,
   niveau VARCHAR(250) ,
   PRIMARY KEY(id_cours)
);

CREATE TABLE classe(
   id_classe VARCHAR(50) ,
   nombre_eleves INTEGER,
   nom_eleve VARCHAR(250) ,
   prenom_eleve VARCHAR(250) ,
   nb_fille INTEGER,
   nb_garcon INTEGER,
   age_moyen NUMERIC(15,2)  ,
   age_min NUMERIC(15,2)  ,
   age_max NUMERIC(15,2)  ,
   note_min NUMERIC(15,2)  ,
   moyenne NUMERIC(15,2)  ,
   note_max NUMERIC(15,2)  ,
   PRIMARY KEY(id_classe)
);

CREATE TABLE eleve(
   id_eleve VARCHAR(50) ,
   nom VARCHAR(250) ,
   date_naissance DATE,
   prenom VARCHAR(250) ,
   sexe BOOLEAN,
   niveau VARCHAR(250) ,
   redoublement BOOLEAN,
   id_classe VARCHAR(50) ,
   PRIMARY KEY(id_eleve),
   FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE salle_cours(
   id VARCHAR(50) ,
   numero VARCHAR(50) ,
   classe VARCHAR(50) ,
   id_classe VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_classe),
   FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE suivre(
   id_cours VARCHAR(50) ,
   id_classe VARCHAR(50) ,
   PRIMARY KEY(id_cours, id_classe),
   FOREIGN KEY(id_cours) REFERENCES cours(id_cours),
   FOREIGN KEY(id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE dispenser(
   id_professeur VARCHAR(50) ,
   id_cours VARCHAR(50) ,
   PRIMARY KEY(id_professeur, id_cours),
   FOREIGN KEY(id_professeur) REFERENCES professeur(id_professeur),
   FOREIGN KEY(id_cours) REFERENCES cours(id_cours)
);

CREATE TABLE notes_par_matieres(
   id_eleve VARCHAR(50) ,
   id_matiere VARCHAR(50) ,
   notes NUMERIC(15,2)  ,
   PRIMARY KEY(id_eleve, id_matiere),
   FOREIGN KEY(id_eleve) REFERENCES eleve(id_eleve),
   FOREIGN KEY(id_matiere) REFERENCES matiere(id_matiere)
);
