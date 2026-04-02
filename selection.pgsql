SELECT * FROM capsule_activite;
-- 1

SELECT alias, courriel, date_inscription
	FROM joueur
	ORDER BY date_inscription;
-- 2
SELECT  nom, 
		((couleur1 >> 16) & 255) || ',' || ((couleur1 >> 8) & 255) || ',' || (couleur1 & 255) AS "couleur préférer",
		to_char(date_creation, 'DD | MM | YYYY')
	FROM avatar
	WHERE nom LIKE '%*';
	
-- 3
SELECT  habilete_avatar.avatar, '[' || habilete.sigle || ' , ' || habilete.nom || ']' AS Habileté,
		date_obtention,
		niveau,
		habilete.coef1 * POWER(niveau, 2) + habilete.coef2 * niveau + habilete.coef3 AS "Valeur niveau courant",
		habilete.coef1 * POWER((niveau + 1), 2) + habilete.coef2 * (niveau + 1) + habilete.coef3 AS "Coût du prochain niveau"
		
	FROM habilete_avatar
		INNER JOIN habilete
			ON habilete_avatar.habilete = habilete.sigle
	WHERE habilete_avatar.avatar LIKE '%*';
	
-- 5

SELECT  capsule_activite.jeu, SUM(capsule_activite.duree)
	FROM avatar
		INNER JOIN capsule_activite
			ON capsule_activite.avatar = avatar.nom
	WHERE avatar.nom IN (SELECT nom
							FROM avatar
							WHERE joueur LIKE '%*')
	GROUP BY jeu
	ORDER BY capsule_activite.jeu






