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
	
-- 4
SELECT (SELECT SUM(h.coef1 * POWER(ha.niveau, 2) + h.coef2 * ha.niveau + h.coef3)
        FROM avatar AS av
                INNER JOIN habilete_avatar AS ha
                ON av.nom = ha.avatar
                INNER JOIN habilete AS h
                ON ha.habilete = h.sigle
                WHERE av.nom  LIKE '%')
                +
        (SELECT SUM(it.moX)
            FROM avatar AS av
                INNER JOIN item_avatar AS ia
                ON av.nom = ia.avatar
                INNER JOIN item AS it
                ON ia.item = it.sigle
                WHERE av.nom  LIKE '%');
-- 5

SELECT  capsule_activite.jeu, SUM(capsule_activite.duree)
	FROM avatar
		INNER JOIN capsule_activite
			ON capsule_activite.avatar = avatar.nom
	WHERE avatar.nom IN (SELECT nom
							FROM avatar
							WHERE joueur LIKE '%*')
	GROUP BY jeu
	ORDER BY capsule_activite.jeu;
	
-- 6

SELECT avatar.joueur ,avatar.nom, item_avatar.quantite 
  	FROM avatar
	   INNER JOIN item_avatar
	   		ON avatar.nom = item_avatar.avatar
	WHERE item_avatar.quantite > 1;

-- 7 : Olivier Simoneau --> retourne le joueur qui à jouer au plus de jeu
SELECT joueur.alias AS "Joueur", COUNT(DISTINCT capsule_activite.jeu)
		FROM joueur
			INNER JOIN activite
				ON activite.joueur = joueur.alias
			INNER JOIN capsule_activite 
				ON capsule_activite.activite = activite.id
			INNER JOIN avatar
				ON avatar.nom = capsule_activite.avatar
			INNER JOIN jeu
				ON jeu.sigle = capsule_activite.jeu
		GROUP BY joueur.alias
		ORDER BY COUNT(DISTINCT capsule_activite.jeu) DESC
		LIMIT 1;
		
-- 7 : Jacob Dury --> Retourne les propriétaire de chaque items

SELECT item.nom, joueur.alias
		FROM item
			INNER JOIN item_avatar AS ita
				ON item.sigle = ita.item
			INNER JOIN avatar
				ON ita.avatar = avatar.nom
			INNER JOIN joueur
				ON avatar.joueur = joueur.alias
			ORDER BY joueur.alias;







