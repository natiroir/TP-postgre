--- Exercice 1 : Selectionner les utilisateur ayant fait au moins une reservation (reprise exerci))

SELECT DISTINCT prenom, nom FROM utilisateur INNER JOIN reservation ON reservation.id_utilisateur = utilisateur.id_utilisateur;

--- Exercice 2 : Selectionner les materiels qui n'ont pas encore était reservé

SELECT designation FROM materiel WHERE id_materiel NOT IN (SELECT id_materiel FROM reservation);

-- Exercice 3 : Selectionner les materiels qui ont était emprunté plus de 3 fois

-- On change deux reservation pour l'avoir dans un autre

UPDATE public.reservation
	SET id_materiel=1
	WHERE id_reservation = 2;

UPDATE public.reservation
	SET id_materiel=1
	WHERE id_reservation = 3;

UPDATE public.reservation
	SET id_materiel=1
	WHERE id_reservation = 4;
	
SELECT designation, count(materiel.id_materiel) FROM materiel INNER JOIN reservation ON reservation.id_materiel = materiel.id_materiel GROUP BY designation HAVING count(materiel.id_materiel) > 2;

--- Exercice 4 : Permet d'avoir le nombre de materielle emprunté par tout les utilisateurs trié par ID 

SELECT prenom, nom, utilisateur.id_utilisateur, count(reservation.id_utilisateur) FROM utilisateur LEFT JOIN reservation ON reservation.id_utilisateur = utilisateur.id_utilisateur GROUP BY prenom, nom, utilisateur.id_utilisateur ORDER BY utilisateur.id_utilisateur