-- Création de la table retour_materiel

CREATE TABLE retour_materiel (
    id_retour SERIAL PRIMARY KEY,
    id_reservation INT NOT NULL REFERENCES reservation(id_reservation),
    date_retour TIMESTAMP NOT NULL,
    retard BOOLEAN NOT NULL
);

--  Ajout de la column date_retour_effectif

ALTER TABLE reservation
ADD COLUMN date_retour_effectif TIMESTAMP;

-- Ajout d'une nouvelle fonction 

CREATE OR REPLACE FUNCTION enregistrer_retour(
    p_id_reservation INT,
    p_date_retour TIMESTAMP
) RETURNS TEXT AS $$
DECLARE
    v_date_fin TIMESTAMP;
    v_retard BOOLEAN;
BEGIN
    SELECT date_fin INTO v_date_fin
    FROM reservation
    WHERE id_reservation = p_id_reservation;

    RAISE NOTICE 'Retour : %, Date fin : %, Retard ? %',
        p_date_retour, v_date_fin, p_date_retour::date > v_date_fin::date;

    v_retard := p_date_retour::date > v_date_fin::date;

    UPDATE reservation
    SET date_retour_effectif = p_date_retour
    WHERE id_reservation = p_id_reservation;

    INSERT INTO retour_materiel (id_reservation, date_retour, retard)
    VALUES (p_id_reservation, p_date_retour, v_retard);

    IF v_retard THEN
        RETURN 'Retour enregistré avec retard';
    ELSE
        RETURN 'Retour enregistré à temps';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Fonction pour le calcule de penaltite

CREATE OR REPLACE FUNCTION calculer_penalite(
    p_id_reservation INT
) RETURNS TEXT AS $$
DECLARE
    v_date_fin TIMESTAMP;
    v_date_retour TIMESTAMP;
    v_jours_retard INT;
    v_penalite NUMERIC;
BEGIN
    -- Récupère la date de fin de réservation
    SELECT date_fin INTO v_date_fin
    FROM reservation
    WHERE id_reservation = p_id_reservation;

    -- Récupère la date de retour
    SELECT date_retour INTO v_date_retour
    FROM retour_materiel
    WHERE id_reservation = p_id_reservation;

    -- Si le retour n'a pas encore été effectué
    IF v_date_retour IS NULL THEN
        RETURN 'Aucun retour enregistré pour cette réservation.';
    END IF;

    -- Si retour à l’heure ou avant
    IF v_date_retour <= v_date_fin THEN
        RETURN 'Aucune pénalité. Retour à l’heure.';
    END IF;

    -- Calcul du nombre de jours de retard (arrondi vers le haut)
    v_jours_retard := CEIL(EXTRACT(EPOCH FROM (v_date_retour - v_date_fin)) / 86400.0);
    v_penalite := v_jours_retard * 5;

    RETURN FORMAT('Retour en retard de %s jour(s). Pénalité : %s €', v_jours_retard, v_penalite);
END;
$$ LANGUAGE plpgsql;


-- Afin de tester voici quelque commande 

INSERT INTO materiel (designation, quantite)
VALUES ('Vidéo-projecteur-test-enregistrer', 1)
RETURNING id_materiel;

-- Prendre l'id_materiel;

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel)
VALUES ('2025-06-08 10:00:00', '2025-06-10 17:00:00', 1, "Mettre_l'id_materiel_du_retour")
RETURNING id_reservation;

-- On test avec un retour le jour même 

SELECT enregistrer_retour(1, '2025-06-10 16:00:00');

-- On test avec un retour en retard 

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel)
VALUES ('2025-06-12 09:00:00', '2025-06-15 12:00:00', 1, "Mettre_l'id_materiel_du_retour")
RETURNING id_reservation;

-- 
SELECT enregistrer_retour(1, '2025-06-13 16:00:00');


-- On test les penalité normalement il y a une sur la dernière réservation

SELECT calculer_penalite("Dernière ID_reservation");

-- On est sensé avoir une pénalité de 5 euros on a : Retour en retard de 1 jour(s). Pénalité : 5 €


-- On test un moment sans pénalité


SELECT calculer_penalite("Avant-dernière ID_reservation");

-- On a bien comme retours : Aucune pénalité. Retour à l’heure.