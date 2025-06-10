-- On fait un case puis ou on count le nombre d'element pour vérifié si il y a quelque chose si oui alors c'est que ce n'est pas bon sinon si il y a rien c'est que les condition de dates sont bien respecté sont bien respecté 

SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN 'OK'
        ELSE 'KO'
    END AS disponibilite
FROM reservation r
JOIN disponibilite d ON r.id_materiel = d.id_materiel
WHERE r.id_materiel = "1"
  AND (
      ('2025-06-10 10:00:00', d.date_fin) OVERLAPS ('2025-07-10 17:00:00', r.date_fin)
  )
  AND (
      ('2025-06-10 10:00:00' < d.date_debut OR '2025-07-10 16:00:00' > d.date_fin)
  );
