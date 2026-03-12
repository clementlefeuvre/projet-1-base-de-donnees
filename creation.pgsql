DROP TABLE IF EXISTS item_avatar;
DROP TABLE IF EXISTS habilete_avatar;
DROP TABLE IF EXISTS habilete;
DROP TABLE IF EXISTS jeu;
DROP TABLE IF EXISTS phrase;
DROP TABLE IF EXISTS avatar;
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

CREATE TABLE avatar(
    nom                varchar(32)        NOT NULL,
    couleur1        integer            NOT NULL    DEFAULT 4294967295,
    couleur2        integer,
    couleur3        integer,
    date_creation    date            NOT NULL    DEFAULT NOW(),
    moX              decimal(9,2)    NOT NULL    DEFAULT 100.0,
    joueur             varchar(32),
    actif            bool            NOT NULL    DEFAULT false,

    CONSTRAINT pk_avatar_nom PRIMARY KEY(nom)
);

CREATE TABLE phrase(
    contenu     varchar(64), 
    avatar         varchar(32)
);

CREATE TABLE jeu(
    nom            varchar(16)     NOT NULL,
    sigle         char(6),
    description varchar(2048)
);

CREATE TABLE habilete(
    nom                varchar(32)            NOT NULL     UNIQUE,
    sigle             char(3)             NOT NULL,
    max_energie     DECIMAL(8,3)        NOT NULL     DEFAULT 100.0,
    coef1             double precision     NOT NULL,
    coef2             double precision,
    coef3             double precision,
    description        varchar(1024)         NOT NULL,
    jeu                char(6),

    CONSTRAINT pk_habilete_sigle PRIMARY KEY(sigle)
);

CREATE TABLE habilete_avatar(
    avatar             varchar(32),
    habilete        char(3),
    date_obtention    date             NOT NULL,
    niveau             integer            DEFAULT 1
);
CREATE TABLE item_avatar(
    avatar             varchar(32),
    item        char(3),
    date_obtention    date             NOT NULL,
    quantite             integer            DEFAULT 1
);






