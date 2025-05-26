-- Permet de faire une update sur la quantité en choisisant une quantie voulu / l'incrémenté / décrémenté

UPDATE public.materiel
	SET quantite=quantite-1
	WHERE designation = 'Blanco';


-- Permet de faire une requette sur la quantité sur les produits emprunté qui sont rendu dans moins de deux jour

UPDATE public.materiel SET quantite=quantite-1 WHERE id_materiel IN (SELECT id_materiel from reservation WHERE date_fin > current_date and date_fin < current_date + 2);

-- Permet d'être sur que au moins une réservation existe :

UPDATE public.reservation SET date_fin = current_date + 1 WHERE id_reservation = 1;

-- Permet de vérifier les reservation

SELECT id_reservation from reservation WHERE date_fin > current_date and date_fin < current_date + 2;