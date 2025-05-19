-- Permet d'avoir les emprunts où la date de fin est minimum le 18 juin 2025

SELECT * FROM public.reservation WHERE (date_fin > '2025-06-18 11:30:00')
ORDER BY id_reservation;



-- Permet d'avoir le matériel où la quantité est inférieur à 5

SELECT * FROM public.materiel WHERE (quantite < 5 ) ORDER BY quantite ASC;


-- Permet d'avoir le nom de tout les Sophie de la BDD
SELECT prenom, nom FROM public.utilisateur WHERE prenom = 'Sophie';
