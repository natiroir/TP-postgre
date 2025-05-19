CREATE TABLE utilisateur (
   id_utilisateur SERIAL PRIMARY KEY,
   nom VARCHAR(256) NOT NULL,
   mail VARCHAR(256) NOT NULL,
   prenom VARCHAR(256) NOT NULL
);

CREATE TABLE materiel (
   id_materiel SERIAL PRIMARY KEY,
   designation VARCHAR(256) NOT NULL,
   quantite INT NOT NULL
);

CREATE TABLE reservation (
   id_reservation SERIAL PRIMARY KEY,
   date_debut TIMESTAMP NOT NULL,
   date_fin TIMESTAMP,
   id_utilisateur INT REFERENCES utilisateur(id_utilisateur),
   id_materiel INT REFERENCES materiel(id_materiel)
);
