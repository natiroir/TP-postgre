-- Permet de connaitre le nombre de reservation commencer entre les 2 dates suivantes 

-- "2025-05-16 11:00:00"
-- "2025-06-16 11:00:00"

SELECT COUNT(reservation.id_reservation) FROM reservation WHERE reservation.date_debut > '2025-05-16 11:00:00' AND reservation.date_debut < '2025-06-16 11:00:00';


-- Permet de savoir le nombre d'element emprunter durant une période par exemple si il a été emprunté avant ou après la période mais que pendant celle ci elle est emprunté alors on la compte quand même

SELECT COUNT(reservation.id_reservation) FROM reservation WHERE
	(reservation.date_debut > '2025-05-16 11:00:00' AND reservation.date_debut < '2025-06-16 11:00:00')
	OR
	(reservation.date_fin > '2025-05-16 11:00:00' AND reservation.date_fin < '2025-06-16 11:00:00')
	OR 
	(reservation.date_debut < '2025-05-16 11:00:00' AND reservation.date_fin > '2025-06-16 11:00:00') -- Permet de savoir si un emprunt a été réaliser avant et continue pendant
	;


-- Requête d’aggrégation pour calculer le nombre d’utilisateur ayant emprunté du matériel

SELECT COUNT(DISTINCT utilisateur.id_utilisateur) FROM utilisateur INNER JOIN reservation ON reservation.id_utilisateur = utilisateur.id_utilisateur;