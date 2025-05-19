INSERT INTO utilisateur (nom, mail, prenom) VALUES
('ROUVIERE', 'nathan.rouviere@exemple.com','Nathan')
('MARTIN', 'jean.martin@example.com', 'Jean'),
('DURAND', 'sophie.durand@example.com', 'Sophie'),
('LEGRAND', 'paul.legrand@example.com', 'Paul'),
('BERTRAND', 'lucie.bertrand@example.com', 'Lucie'),
('BENOIT', 'alain.benoit@example.com', 'Alain'),
('DUPONT', 'catherine.dupont@example.com', 'Catherine'),
('MARTIN', 'claire.martin@example.com', 'Claire'),
('GIRARD', 'charles.girard@example.com', 'Charles'),
('ROBERT', 'emilie.robert@example.com', 'Emilie'),
('FOURNIER', 'jean.fournier@example.com', 'Jean'),
('LEFEBVRE', 'franck.lefebvre@example.com', 'Franck'),
('MOREAU', 'isabelle.moreau@example.com', 'Isabelle'),
('LOPEZ', 'jean-luc.lopez@example.com', 'Jean-Luc'),
('PERRIN', 'laura.perrin@example.com', 'Laura'),
('GUILLAUME', 'lucas.guillaume@example.com', 'Lucas'),
('FONTAINE', 'marie.fontaine@example.com', 'Marie'),
('VIGNERON', 'pierre.vigneron@example.com', 'Pierre'),
('LEROY', 'victor.leroy@example.com', 'Victor'),
('TESSIER', 'valerie.tessier@example.com', 'Valerie');




INSERT INTO materiel (designation, quantite) VALUES
('Ordinateur portable', 10),
('Projecteur', 5),
('Imprimante', 8),
('Tablette', 12),
('Casque audio', 15),
('Microphone', 6),
('Caméra', 4),
('Clavier sans fil', 20),
('Souris', 18),
('Écran', 10),
('Chaises de bureau', 30),
('Table de réunion', 7),
('Tapis de sol', 3),
('Meuble de rangement', 10),
('Vidéo-projecteur', 3),
('Webcam', 12),
('Station de travail', 6),
('Téléphone portable', 9),
('Table de conférence', 4),
('Mélangeur audio', 5);




INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-10 09:00', '2025-06-10 12:00', 1, 1);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-11 14:00', '2025-06-11 16:00', 3, 2);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-12 10:00', '2025-06-12 13:00', 4, 4);


INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-13 09:30', '2025-06-13 11:30', 5, 6);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-14 15:00', '2025-06-14 17:00', 2, 5);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-15 10:00', '2025-06-15 12:00', 6, 7);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-16 11:00', '2025-06-16 13:00', 7, 8);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-17 13:00', '2025-06-17 15:00', 8, 9);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-18 09:00', '2025-06-18 11:00', 9, 10);

INSERT INTO reservation (date_debut, date_fin, id_utilisateur, id_materiel) VALUES
('2025-06-19 14:00', '2025-06-19 16:00', 10, 11);
