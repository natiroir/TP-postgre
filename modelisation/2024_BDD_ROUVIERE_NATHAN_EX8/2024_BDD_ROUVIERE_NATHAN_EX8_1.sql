

CREATE TABLE disponibilite (
   id_disponibilite SERIAL PRIMARY KEY,
   date_debut TIMESTAMP NOT NULL,
   date_fin TIMESTAMP NOT NULL,
   id_materiel INT NOT NULL REFERENCES materiel(id_materiel)
);



ALTER TABLE reservation
ADD COLUMN id_disponibilite INT REFERENCES disponibilite(id_disponibilite);