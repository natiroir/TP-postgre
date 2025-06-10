-- Permet de delete une reservation avec son id

DELETE FROM public.reservation WHERE id_reservation = 5;

-- Permet de delete les reservation où la date de fin est déjà passer

DELETE FROM public.reservation WHERE date_fin < current_date;