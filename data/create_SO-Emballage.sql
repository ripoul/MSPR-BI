/*==============================================================*/
/* Table : ACHAT                                                */
/*==============================================================*/
create table IF NOT EXISTS ACHAT 
(
   NO_ACHAT             INTEGER            not null,
   NO_FOURNISSEUR       INTEGER            not null,
   DATE_ACHAT           DATE,
   COMMENT_ACHAT        VARCHAR(100),
   constraint PK_ACHAT primary key (NO_ACHAT)
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table IF NOT EXISTS CATEGORIE 
(
   NO_CATEGORIE         INTEGER            not null,
   CAT_NO_CATEGORIE     INTEGER,
   NOM_CATEGORIE        VARCHAR(50),
   constraint PK_CATEGORIE primary key (NO_CATEGORIE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table IF NOT EXISTS CLIENT 
(
   NO_CLIENT            SERIAL            not null,
   NOM_CLIENT           VARCHAR(50),
   NORUE                VARCHAR(10),
   RUE                  VARCHAR(100),
   CPOSTAL              INTEGER,
   VILLE                VARCHAR(100),
   NOTEL                VARCHAR(10),
   EMAIL                VARCHAR(100),
   NOM_CONTACT          VARCHAR(50),
   constraint PK_CLIENT primary key (NO_CLIENT)
);

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table IF NOT EXISTS COMMANDE 
(
   NO_COMMANDE          INTEGER            not null,
   NO_CLIENT            INTEGER            not null,
   DATE_COMMANDE        DATE,
   constraint PK_COMMANDE primary key (NO_COMMANDE)
);

/*==============================================================*/
/* Table : COMPOSER                                             */
/*==============================================================*/
create table IF NOT EXISTS COMPOSER 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_MATIERE           INTEGER            not null,
   constraint PK_COMPOSER primary key (CODE_PRODUIT, NO_MATIERE)
);

/*==============================================================*/
/* Table : DETAIL_ACHAT                                         */
/*==============================================================*/
create table IF NOT EXISTS DETAIL_ACHAT 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_ACHAT             INTEGER            not null,
   QUANTITE_ACHAT       INTEGER,
   constraint PK_DETAIL_ACHAT primary key (CODE_PRODUIT, NO_ACHAT)
);

/*==============================================================*/
/* Table : DETAIL_COMMANDE                                      */
/*==============================================================*/
create table IF NOT EXISTS DETAIL_COMMANDE 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_COMMANDE          INTEGER            not null,
   QUANTITE_COMMANDE    INTEGER,
   constraint PK_DETAIL_COMMANDE primary key (CODE_PRODUIT, NO_COMMANDE)
);

/*==============================================================*/
/* Table : DETAIL_LIVR_C                                        */
/*==============================================================*/
create table IF NOT EXISTS DETAIL_LIVR_C 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_LIVRAISON_C       INTEGER            not null,
   QUANTITE_LIVR_C      INTEGER,
   constraint PK_DETAIL_LIVR_C primary key (CODE_PRODUIT, NO_LIVRAISON_C)
);

/*==============================================================*/
/* Table : DETAIL_LIVR_F                                        */
/*==============================================================*/
create table IF NOT EXISTS DETAIL_LIVR_F 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_LIVRAISON_F       INTEGER            not null,
   QUANTITE_LIVR_F      INTEGER,
   constraint PK_DETAIL_LIVR_F primary key (CODE_PRODUIT, NO_LIVRAISON_F)
);

/*==============================================================*/
/* Table : EMPLACEMENT                                          */
/*==============================================================*/
create table IF NOT EXISTS EMPLACEMENT 
(
   NO_EMPLACEMENT       INTEGER            not null,
   HANGAR               INTEGER,
   ALLEE                INTEGER,
   constraint PK_EMPLACEMENT primary key (NO_EMPLACEMENT)
);

/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
create table IF NOT EXISTS FOURNISSEUR 
(
   NO_FOURNISSEUR       INTEGER            not null,
   NOM_FOURNISSEUR      VARCHAR(50),
   NORUE                VARCHAR(10),
   RUE                  VARCHAR(100),
   CPOSTAL              INTEGER,
   VILLE                VARCHAR(100),
   NOTEL                VARCHAR(10),
   EMAIL                VARCHAR(100),
   constraint PK_FOURNISSEUR primary key (NO_FOURNISSEUR)
);

/*==============================================================*/
/* Table : LIVRAISON_F                                         */
/*==============================================================*/
create table IF NOT EXISTS LIVRAISON_F 
(
   NO_LIVRAISON_F       INTEGER            not null,
   NO_ACHAT             INTEGER            not null,
   DATE_LIVRAISON_F     DATE,
   constraint PK_LIVRAISON_F primary key (NO_LIVRAISON_F)
);

/*==============================================================*/
/* Table : LIVRAISON_C                                          */
/*==============================================================*/
create table IF NOT EXISTS LIVRAISON_C 
(
   NO_LIVRAISON_C       INTEGER            not null,
   NO_COMMANDE          INTEGER            not null,
   DATE_LIVRAISON_C     DATE,
   constraint PK_LIVRAISON_C primary key (NO_LIVRAISON_C)
);

/*==============================================================*/
/* Table : MATIERE                                              */
/*==============================================================*/
create table IF NOT EXISTS MATIERE 
(
   NO_MATIERE           INTEGER            not null,
   NOM_MATIERE          VARCHAR(70),
   constraint PK_MATIERE primary key (NO_MATIERE)
);

/*==============================================================*/
/* Table : MOUVEMENT_STOCK                                      */
/*==============================================================*/
create table IF NOT EXISTS MOUVEMENT_STOCK 
(
   NO_MOUVEMENT         INTEGER            not null,
   CODE_PRODUIT         VARCHAR(8)          not null,
   TYPE_MOUVEMENT       CHAR(1),
   DATE_MOUVEMENT       DATE,
   QUANTITE_MOUVEMENT   INTEGER,
   constraint PK_MOUVEMENT_STOCK primary key (NO_MOUVEMENT)
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table IF NOT EXISTS PRODUIT 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_CATEGORIE         INTEGER            not null,
   NO_EMPLACEMENT       INTEGER            not null,
   UTILISATION          VARCHAR(50),
   DESCRIPTION          VARCHAR(100),
   QUANTITE_STOCK       INTEGER,
   DATE_STOCK           DATE,
   COMMENT_PRODUIT      VARCHAR(100),
   LONGEUR              INTEGER,
   LARGEUR              INTEGER,
   HAUTEUR              INTEGER,
   PRIX_PIECE_HT        INTEGER,
   constraint PK_PRODUIT primary key (CODE_PRODUIT)
);

/*==============================================================*/
/* Table : PROPOSER                                             */
/*==============================================================*/
create table IF NOT EXISTS PROPOSER 
(
   CODE_PRODUIT         VARCHAR(8)          not null,
   NO_FOURNISSEUR       INTEGER            not null,
   constraint PK_PROPOSER primary key (CODE_PRODUIT, NO_FOURNISSEUR)
);

