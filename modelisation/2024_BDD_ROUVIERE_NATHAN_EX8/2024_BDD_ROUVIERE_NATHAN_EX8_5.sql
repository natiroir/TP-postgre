-- Ajouter une disponibilté 

INSERT INTO disponibilite (date_debut, date_fin, id_materiel)
VALUES ('2025-06-17 14:30:00', '2025-06-15 14:30:00', 1);

-- Modifier une disponibilité 

UPDATE disponibilite
SET date_debut = '2025-06-15 14:30:00',
    date_fin = '2025-06-17 14:30:00',
    id_materiel = 1,
WHERE id_disponibilite = 1;

-- Enlever une disponibiltié 

DELETE FROM disponibilite
WHERE id_disponibilite = 1;

