ALTER TABLE item_avatar 		
	DROP CONSTRAINT IF EXISTS fk_item_avatar_item, 
	DROP CONSTRAINT IF EXISTS fk_item_avatar_avatar;
ALTER TABLE habilete_avatar 	
	DROP CONSTRAINT IF EXISTS fk_habilete_avatar_habilete,
	DROP CONSTRAINT IF EXISTS fk_habilete_avatar_avatar;
ALTER TABLE habilete
	DROP CONSTRAINT IF EXISTS fk_habilete_jeu;
ALTER TABLE phrase
	DROP CONSTRAINT IF EXISTS fk_phrase_avatar;
ALTER TABLE avatar
	DROP CONSTRAINT IF EXISTS fk_avatar_joueur;
ALTER TABLE capsule_activite
	DROP CONSTRAINT IF EXISTS fk_caps_acti_avt,
	DROP CONSTRAINT IF EXISTS fk_avt_caps_acti,
	DROP CONSTRAINT IF EXISTS fk_caps_acti_jeu;
ALTER TABLE activite
	DROP CONSTRAINT IF EXISTS fk_acti_joueur;
ALTER TABLE item
	DROP CONSTRAINT IF EXISTS fk_item_jeu;


DROP TABLE IF EXISTS item_avatar;
DROP TABLE IF EXISTS habilete_avatar;
DROP TABLE IF EXISTS habilete;
DROP TABLE IF EXISTS jeu;
DROP TABLE IF EXISTS phrase;
DROP TABLE IF EXISTS avatar;
DROP TABLE IF EXISTS capsule_activite;
DROP TABLE IF EXISTS activite;
DROP TABLE IF EXISTS joueur;
DROP TABLE IF EXISTS item;
DROP TYPE IF EXISTS genre;
DROP TYPE IF EXISTS statut;

CREATE TYPE genre AS ENUM(
  'femme_cis',
  'homme_cis',
  'femme_trans',
  'homme_trans',
  'non_binaire',
  'genre_fluid',
  'agenré',
  'autre'
);

CREATE TYPE statut AS ENUM(
	'invité',
	'payant'
);


CREATE TABLE joueur(
	alias 				varchar(32),
	courriel 			varchar(128) 	UNIQUE NOT NULL,
	mot_de_passe		varchar(32) 	NOT NULL,
	genre				genre,
	date_inscription	date			NOT NULL,
	date_naissance		date,
	statut				statut			NOT NULL,
	
	CONSTRAINT pk_joueur_alias PRIMARY KEY(alias)
);

CREATE TABLE item(
	nom 				varchar(32)		NOT NULL UNIQUE,
	sigle				char(4),
	probabilite			decimal(9,2)	DEFAULT(0.025) NOT NULL,
	description			varchar(1024)	NOT NULL,
	moX					decimal(9,2)	DEFAULT(100.0) NOT NULL,
	jeu					char(6)			NOT NULL,
	
	CONSTRAINT pk_item_sigle PRIMARY KEY(sigle)
);

CREATE TABLE activite(
	id					integer,
	joueur				varchar(32)		NOT NULL,
	date_debut			date			NOT NULL,
	dureé				integer			NOT NULL,
	
	CONSTRAINT pk_activite_id PRIMARY KEY(id)
);
CREATE TABLE capsule_activite(
	id			integer,
	avatar		varchar(32)		NOT NULL,
	activite	integer			NOT NULL,
	jeu			char(5)			NOT NULL,
	duree		integer			NOT NULL
);

CREATE TABLE avatar(
    nom                	varchar(32)        	NOT NULL,
    couleur1        	integer            	NOT NULL    DEFAULT 4294967295,
    couleur2        	integer,
    couleur3        	integer,
    date_creation    	date            	NOT NULL    DEFAULT NOW(),
    moX              	decimal(9,2)    	NOT NULL    DEFAULT 100.0,
    joueur             varchar(32),
    actif            	bool            	NOT NULL    DEFAULT false,

    CONSTRAINT pk_avatar_nom PRIMARY KEY(nom)
);

CREATE TABLE phrase(
	id				integer,
    contenu     	varchar(64), 
    avatar         	varchar(32),
	
	CONSTRAINT pk_phrase_id PRIMARY KEY(id)
);


CREATE TABLE jeu(
    nom            	varchar(16)     NOT NULL,
    sigle         	char(6),
    description 	varchar(2048),
	
	CONSTRAINT pk_jeu_sigle PRIMARY KEY(sigle)
);

CREATE TABLE habilete(
    nom                	varchar(32)            	NOT NULL     UNIQUE,
    sigle             	char(3)             	NOT NULL,
    max_energie     	DECIMAL(8,3)        	NOT NULL     DEFAULT 100.0,
    coef1             	double precision     	NOT NULL,
    coef2             	double precision,
    coef3             	double precision,
    description        	varchar(1024)         	NOT NULL,
    jeu                	char(6),

    CONSTRAINT pk_habilete_sigle PRIMARY KEY(sigle)
);


CREATE TABLE habilete_avatar(
    avatar             	varchar(32),
    habilete        	char(3),
    date_obtention    	date             	NOT NULL,
    niveau             	integer            	DEFAULT 1
);
	
CREATE TABLE item_avatar(
    avatar             	varchar(32),
    item        		char(3),
    date_obtention    	date             NOT NULL,
    quantite            integer          DEFAULT 1
);


ALTER TABLE item
	ADD CONSTRAINT fk_item_jeu 
		FOREIGN KEY(jeu) REFERENCES jeu(sigle);

ALTER TABLE activite
	ADD CONSTRAINT fk_acti_joueur 
		FOREIGN KEY(joueur) REFERENCES joueur(alias);

ALTER TABLE capsule_activite
	ADD CONSTRAINT fk_caps_acti_avt 
		FOREIGN KEY(avatar) 		REFERENCES avatar(nom),
	ADD	CONSTRAINT fk_avt_caps_acti 
		FOREIGN KEY(activite) 		REFERENCES activite(id),
	ADD CONSTRAINT fk_caps_acti_jeu 
		FOREIGN KEY(jeu) 			REFERENCES jeu(sigle);

ALTER TABLE avatar
	ADD CONSTRAINT fk_avatar_joueur 
		FOREIGN KEY(joueur) REFERENCES joueur(alias);

ALTER TABLE phrase
	ADD CONSTRAINT fk_phrase_avatar 
		FOREIGN KEY(avatar) REFERENCES avatar(nom);

ALTER TABLE habilete
	ADD CONSTRAINT fk_habilete_jeu 
		FOREIGN KEY(jeu) REFERENCES jeu(sigle);
		
ALTER TABLE habilete_avatar
	ADD CONSTRAINT fk_habilete_avatar_habilete 		
		FOREIGN KEY(habilete) 		REFERENCES habilete(sigle),
	ADD CONSTRAINT fk_habilete_avatar_avatar		
		FOREIGN KEY(avatar) 		REFERENCES avatar(nom);

ALTER TABLE item_avatar
	ADD CONSTRAINT fk_item_avatar_item 		
		FOREIGN KEY(item) 		REFERENCES item(sigle),
	ADD CONSTRAINT fk_item_avatar_avatar 	
		FOREIGN KEY(avatar) 	REFERENCES avatar(nom);






