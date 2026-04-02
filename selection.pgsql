SELECT * FROM avatar;
-- 1

SELECT alias, courriel, date_inscription
	FROM joueur
	ORDER BY date_inscription;
-- 2
SELECT  nom, 
		((couleur1 >> 16) & 255) || ',' || ((couleur1 >> 8) & 255) || ',' || (couleur1 & 255) AS "couleur préférer",
		to_char(date_creation, 'DD | MM | YYYY')
	FROM avatar
	WHERE joueur = 'alfonso *';
	
	