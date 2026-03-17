SELECT * FROM joueur;
SELECT * FROM avatar;


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
	   ('Carlos Alfonso', x'9BBB5F'::int, x'74A12E'::int,x'91B500'::int, now(), 5000000,'Jacob', true),
	   ('clem', x'000FF'::int, x'74A12E'::int,x'B22222'::int, now(), 500000, 'Clément', true);
	   
INSERT INTO jeu (nom, sigle, description)
VALUES  ('Racing', 'ga0001', 'Jeu de course'),
		('Kombat', 'ga0002', 'Jeu de combat'),
		('Tenis', 'ga0003', 'Jeu de tennis');
		
INSERT INTO habilete (nom, sigle, max_energie, coef1, coef2, coef3, description, jeu)
VALUES  ('Invincibilité_temporaire', '001', 105.301, 10.90, 40.30, 20.76, 'Devient invincible temporairement', 'ga0001' ),
		('RAGE', '002', 233.333, 10.33,20.33,33.33,'Devient plus fort temporairement', 'ga0002'),
		('slow_motion', '003', 322.232, 11.11,22.22,33.33, 'Ralentie le temp temporairement', 'ga0003');
		
-- INSERT INTO item (nom, sigle, probabilite, desvription, mox, jeu)
		
	   