SELECT * FROM avatar;
-- 1

SELECT alias, courriel, date_inscription
	FROM joueur
	ORDER BY date_inscription;
-- 2
SELECT  nom, 
		((couleur1 >> 16) & 255) || ',' || ((couleur1 >> 8) & 255) || ',' || (couleur1 & 255) AS "couleur préférer"
		--ajouter la date
	FROM avatar
	WHERE joueur = 'alfonso *';
	
	