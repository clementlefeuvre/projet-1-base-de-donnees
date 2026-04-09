
INSERT INTO joueur (alias, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut)
VALUES ('alfonso *', 'carlo17@gmail.com', 'xxgzuqta$', 'homme_cis', now(), '1997-06-20', 'payant'),
		('Olivier', 'simOli@gmail.com','qwerty', 'autre', now(), '2007-05-27', 'payant'),
		('Clément', 'cle-element@gmail.com', 'elementKey', 'autre', now(), '2006-09-27', 'invité'),
		('Jacob', 'jacobcasino@gmail.com', 'jakesully', 'agenré', now(), '2007-05-13', 'invité');
		
INSERT INTO avatar (nom, couleur1, couleur2, couleur3, date_creation, mox, joueur, actif)
VALUES ('Aang *', x'FFD700'::int,x'FFA500'::int, x'000FF'::int, now(), 50000, 'alfonso *', true),
 	   ('Roku', x'8B0000'::int , x'DC143C'::int, x'B22222'::int, now(), 50000, 'alfonso *', false),
	   ('Zuko', x'D0F0C0'::int , x'DC143C'::int, x'B22222'::int, now(), 50000, 'alfonso *', false),
	   ('Iroh', x'D0F0C0'::int , x'DC143C'::int, x'B22222'::int, now(), 5, 'Olivier', true),
	   ('Carlos Alfonso', x'9BBB5F'::int, x'74A12E'::int,x'91B500'::int, now(), 5000,'Jacob', true),
	   ('clem', x'000FF'::int, x'74A12E'::int,x'B22222'::int, now(), 500000, 'Clément', true);
	   
INSERT INTO jeu (nom, sigle, description)
VALUES  ('Racing', 'ga0001', 'Jeu de course'),
		('Kombat', 'ga0002', 'Jeu de combat'),
		('Tenis', 'ga0003', 'Jeu de tennis');
		
INSERT INTO habilete (nom, sigle, max_energie, coef1, coef2, coef3, description, jeu)
VALUES  ('Invincibilité_temporaire', '01P', 105.301, 10.90, 40.30, 20.76, 'Devient invincible temporairement', 'ga0001' ),
		('RAGE_P', '02P',233.333, 10.33,20.33,33.33,'Devient plus fort temporairement', 'ga0002'),
		('slow_motion_P', '03P',322.232, 11.11,22.22,33.33, 'Ralentie le temp temporairement', 'ga0003');
		
INSERT INTO item (nom, sigle, probabilite, description, mox, jeu)
VALUES  ('Propulseur', 'I001', 0.05, 'augmente la vitesse du joueur', 10000, 'ga0001'),
		('Épé', 'I002', 0.09, 'augmente les dégats du joueur', 5000, 'ga0002'),
		('Raquette en or', 'I003', 0.01, 'augmente la valeur des objet vendu', 100000, 'ga0003'),
		('Boules de feu', 'I004', 0.30, 'Le joueur peut lancer des boules de feu', 10000, 'ga0002'),
		('Spike ball', 'I005', 0.20, 'Blesse le joueur lors de son obtention', 1, 'ga0003'),
		('Bouclier de bois', 'I006', 0.15, 'Réduit les dégats reçus de 10%', 2000, 'ga0002'),
        ('Potion de soin', 'I007', 0.25, 'Restaure 50 PV', 500, 'ga0002'),
        ('Balles explosives', 'I008', 0.05, 'Les balles créent une petite explosion au rebond', 15000, 'ga0003'),
        ('Bandeau de concentration', 'I009', 0.12, 'Augmente la précision des coups', 3500, 'ga0003'),
        ('Cape d''invisibilité', 'I010', 0.02, 'Rend le joueur difficile à voir', 25000, 'ga0002');
		
INSERT INTO activite(id,joueur,date_debut,duree)
VALUES  (01, 'alfonso *', '2026-01-23', 500),
		(02, 'alfonso *', '2026-01-24', 5000),
		(03, 'alfonso *', '2026-01-25', 6000),
		(04, 'alfonso *', '2026-01-26', 2000),
		(05, 'Olivier', '2026-01-26', 1300),
		(06, 'Jacob', '2026-01-26',10000),
		(07, 'Clément', '2026-01-26', 1400);
		

INSERT INTO capsule_activite (id,activite, avatar, jeu, duree)
VALUES  (01, 01,'Aang *', 'ga0003', 250),
		(02, 01,'Aang *', 'ga0001', 250),
		(03, 02,'Aang *', 'ga0002', 2500),
		(04, 02,'Roku', 'ga0003', 2500),
		(05, 03,'Aang *', 'ga0001', 2000),
		(06, 03,'Aang *', 'ga0002', 4000),
		(07, 04,'Aang *', 'ga0003', 500),
		(08, 04,'Zuko', 'ga0001', 1500),
		(06, 05,'Iroh', 'ga0002', 300),
		(07, 05,'Iroh', 'ga0003', 700),
		(08, 05,'Iroh', 'ga0001', 300),
		(06, 06,'Carlos Alfonso', 'ga0001', 3000),
		(07, 06,'Carlos Alfonso', 'ga0003', 2000),
		(08, 06,'Carlos Alfonso', 'ga0001', 5000),
		(06, 07,'clem', 'ga0002', 300),
		(07, 07,'clem', 'ga0001', 600),
		(08, 07,'clem', 'ga0003', 500);
		
INSERT INTO habilete_avatar (avatar, habilete, date_obtention, niveau)
VALUES  ('Aang *', '01P',now(), 1),
		('clem', '02P',now(), 1),
		('Iroh', '03P',now(), 1);
		
INSERT INTO item_avatar (avatar, item, date_obtention, quantite)
VALUES  ('Aang *', 'I001', now(), 3),
		('Carlos Alfonso', 'I004',now(), 1),
		('Iroh', 'I005', now(), 8),
        ('Carlos Alfonso', 'I009', now(), 1);
		
INSERT INTO phrase (id, contenu, avatar)
VALUES  (1,'yip yip!','Aang *'),
		(2,'I love tea','Iroh'),
		(3,'I need to reclaim my honor!','Zuko')
		

		
		

		
	   