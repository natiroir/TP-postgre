ALTER TABLE disponibilite
ADD CONSTRAINT chk_dates CHECK (date_debut < date_fin);