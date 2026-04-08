SELECT * FROM capsule_activite;
-- 1  Donnez la liste de tous les joueurs, on désire : alias, courriel, date d’inscription. Le tout trié par
    --date d’inscription (croissant).
-- Fonctionnelle : oui

SELECT alias, courriel, date_inscription
	FROM joueur
	ORDER BY date_inscription;
-- 2  Donnez la liste des avatars d’un joueur quelconque (pour l’exemple, prendre le joueur principal),
    --en donnant : nom, la couleur préférée transformée en trois composantes rouge, vert, bleu (dans
    --une seule colonne selon ce format : « (127, 0, 255) »), date de création suivant le format
    --2000 | 12 | 25, le nombre de moX.
-- Fonctionnelle : oui
SELECT  nom, 
		((couleur1 >> 16) & 255) || ',' || ((couleur1 >> 8) & 255) || ',' || (couleur1 & 255) AS "couleur préférer",
		to_char(date_creation, 'DD | MM | YYYY')
	FROM avatar
	WHERE nom LIKE '%*';
	
-- 3  Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
    --entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
    --du niveau courant et le coût en moX pour acheter le prochain niveau.
-- Fonctionnelle : oui
SELECT  habilete_avatar.avatar, '[' || habilete.sigle || ' , ' || habilete.nom || ']' AS Habileté,
		date_obtention,
		niveau,
		habilete.coef1 * POWER(niveau, 2) + habilete.coef2 * niveau + habilete.coef3 AS "Valeur niveau courant",
		habilete.coef1 * POWER((niveau + 1), 2) + habilete.coef2 * (niveau + 1) + habilete.coef3 AS "Coût du prochain niveau"
		
	FROM habilete_avatar
		INNER JOIN habilete
			ON habilete_avatar.habilete = habilete.sigle
	WHERE habilete_avatar.avatar LIKE '%*';
	
-- 4 Pour l’avatar principal, donnez sa valeur totale : pour les habilités on considère le niveau et pour
   --les items on considère la quantité.
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
                WHERE av.nom  LIKE '%')
		AS "Valeur totale de l'avatar principal";
-- 5  Pour le joueur principal, donnez le nombre total d’heures passées dans chaque jeu joué.
-- Fonctionnelle : oui
SELECT  capsule_activite.jeu, ROUND(SUM(capsule_activite.duree/60)/60.0, 2) AS "Heures jouées"
	FROM avatar
		INNER JOIN capsule_activite
			ON capsule_activite.avatar = avatar.nom
	WHERE avatar.nom IN (SELECT nom
							FROM avatar
							WHERE joueur LIKE '%*')
	GROUP BY jeu
	ORDER BY capsule_activite.jeu;
	
-- 6 Donnez la liste de tous les avatars qui possèdent plus de 1 item : nom du joueur, nom de l’avatar
   --et nombre d’items
-- Fonctionnelle : oui
SELECT avatar.joueur ,avatar.nom AS "Nom de l'avatar", item_avatar.quantite AS "Quantité d'items"
  	FROM avatar
	   INNER JOIN item_avatar
	   		ON avatar.nom = item_avatar.avatar
	WHERE item_avatar.quantite > 1;

-- 7 : Olivier Simoneau --> retourne le joueur qui a joué au plus de jeux différents
-- Fonctionnelle : oui
SELECT joueur.alias AS "Joueur", COUNT(DISTINCT capsule_activite.jeu) AS "Nombre de jeux joués"
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
-- Fonctionnelle : oui
SELECT item.nom AS "Item", joueur.alias AS "Propriétaire"
		FROM item
			INNER JOIN item_avatar AS ita
				ON item.sigle = ita.item
			INNER JOIN avatar
				ON ita.avatar = avatar.nom
			INNER JOIN joueur
				ON avatar.joueur = joueur.alias
			ORDER BY item.nom;

-- 7 : Clément Lefeuvre --> Retourne tous les avatars qui ont plus de 1h de jeu
-- Fonctionnelle: Oui
SELECT nom AS "Nom de l'avatar", joueur AS "Joueur propriétaire", ROUND(SUM(capsule_activite.duree/60.0)/60.0, 2) AS "Heures de jeu"
	FROM avatar
		INNER JOIN capsule_activite
    		ON capsule_activite.avatar = avatar.nom
	GROUP BY nom
	HAVING SUM(capsule_activite.duree/60.0)/60.0 > 1
	ORDER BY SUM(capsule_activite.duree) DESC;



