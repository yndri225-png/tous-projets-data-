CREATE TABLE societes (
    id_societe      INTEGER PRIMARY KEY,
    nom_societe     VARCHAR(100) NOT NULL,
    pays_origine    VARCHAR(50)  NOT NULL,
    annee_creation  INTEGER      NOT NULL
);
 
CREATE TABLE sites_miniers (
    id_site           INTEGER PRIMARY KEY,
    nom_site          VARCHAR(100) NOT NULL,
    region            VARCHAR(50)  NOT NULL,
    minerai_principal VARCHAR(50)  NOT NULL,
    date_ouverture    DATE,
    statut            VARCHAR(30)  NOT NULL
                      CHECK (statut IN ('En exploitation', 'En développement', 'Suspendu')),
    id_societe        INTEGER NOT NULL,
    FOREIGN KEY (id_societe) REFERENCES societes(id_societe)
);
 
CREATE TABLE employes (
    id_employe            INTEGER PRIMARY KEY,
    nom                   VARCHAR(50) NOT NULL,
    prenom                VARCHAR(50) NOT NULL,
    poste                 VARCHAR(60) NOT NULL,
    salaire_mensuel_fcfa  INTEGER     NOT NULL,
    date_embauche         DATE        NOT NULL,
    id_site               INTEGER     NOT NULL,
    FOREIGN KEY (id_site) REFERENCES sites_miniers(id_site)
);
 
CREATE TABLE productions (
    id_production                  INTEGER PRIMARY KEY,
    id_site                        INTEGER       NOT NULL,
    mois                           DATE          NOT NULL,  -- 1er jour du mois
    quantite_tonnes                NUMERIC(12,2) NOT NULL,  -- tonnes de minerai extrait
    cout_exploitation_millions_fcfa NUMERIC(10,2) NOT NULL, -- en millions de FCFA
    nb_incidents_securite          INTEGER       NOT NULL DEFAULT 0,
    FOREIGN KEY (id_site) REFERENCES sites_miniers(id_site)
);

-- =====================================================================
-- ÉTAPE 3 : INSÉRER LES DONNÉES
-- =====================================================================
 
-- ---------- SOCIÉTÉS (15 lignes) ----------
INSERT INTO societes (id_societe, nom_societe, pays_origine, annee_creation) VALUES
(1,  'Sahel Gold Mining SA',        'Mali',               2008),
(2,  'Niger Valley Resources',      'Canada',             2005),
(3,  'Baoulé Minerals Ltd',         'Australie',          2010),
(4,  'Kayes Or Exploration',        'Mali',               2012),
(5,  'Zhongmali Lithium Co.',       'Chine',              2016),
(6,  'Afrimine Holdings',           'Afrique du Sud',     1999),
(7,  'Atlas Ressources SAS',        'France',             2003),
(8,  'Savane Mining Group',         'Royaume-Uni',        2007),
(9,  'Tilemsi Phosphates SA',       'Mali',               2014),
(10, 'Bamako Fer & Acier',          'Mali',               2011),
(11, 'Golden Dune Corp',            'Émirats arabes unis',2013),
(12, 'Ankara Maden AŞ',             'Turquie',            2009),
(13, 'Ganga Minerals Pvt',          'Inde',               2015),
(14, 'Falémé Resources',            'Canada',             2018),
(15, 'Ouest-Africain Bauxite SA',   'Ghana',              2017);
 
-- ---------- SITES MINIERS (15 lignes) ----------
INSERT INTO sites_miniers (id_site, nom_site, region, minerai_principal, date_ouverture, statut, id_societe) VALUES
(1,  'Kéniéba Nord',        'Kayes',     'Or',         '2006-03-15', 'En exploitation',   2),
(2,  'Sadiola Est',         'Kayes',     'Or',         '1996-10-01', 'En exploitation',   6),
(3,  'Loulo Sud',           'Kayes',     'Or',         '2005-11-20', 'En exploitation',   2),
(4,  'Syama Ouest',         'Sikasso',   'Or',         '2008-06-12', 'En exploitation',   3),
(5,  'Kalana Centre',       'Sikasso',   'Or',         '2013-02-25', 'En exploitation',   4),
(6,  'Fourou Aurifère',     'Sikasso',   'Or',         '2010-09-09', 'En exploitation',   1),
(7,  'Goulamina Lithium',   'Sikasso',   'Lithium',    '2024-12-05', 'En exploitation',   5),
(8,  'Bafing Manganèse',    'Koulikoro', 'Manganèse',  '2015-04-18', 'En exploitation',   13),
(9,  'Tilemsi Phosphate',   'Gao',       'Phosphate',  '2018-01-30', 'En exploitation',   9),
(10, 'Kolokani Fer',        'Koulikoro', 'Fer',        '2012-07-23', 'En exploitation',   10),
(11, 'Bougouni Lithium II', 'Sikasso',   'Lithium',    NULL,         'En développement',  12),
(12, 'Kobada Aurifère',     'Koulikoro', 'Or',         NULL,         'En développement',  11),
(13, 'Nara Manganèse',      'Koulikoro', 'Manganèse',  NULL,         'En développement',  14),
(14, 'Djidian Fer',         'Kayes',     'Fer',        '2009-05-11', 'Suspendu',          8),
(15, 'Faléa Bauxite',       'Kayes',     'Bauxite',    '2016-08-02', 'Suspendu',          15);
 
-- ---------- EMPLOYÉS (20 lignes) ----------
INSERT INTO employes (id_employe, nom, prenom, poste, salaire_mensuel_fcfa, date_embauche, id_site) VALUES
(1,  'Traoré',    'Moussa',      'Chef de site',             1850000, '2012-03-01', 1),
(2,  'Coulibaly', 'Aminata',     'Géologue',                  880000, '2016-09-15', 1),
(3,  'Keïta',     'Ibrahim',     'Ingénieur minier',         1250000, '2014-01-20', 2),
(4,  'Diarra',    'Fatoumata',   'Responsable HSE',           720000, '2018-05-07', 2),
(5,  'Konaté',    'Seydou',      'Foreur',                    460000, '2019-11-04', 3),
(6,  'Sidibé',    'Awa',         'Comptable',                 610000, '2017-02-13', 3),
(7,  'Camara',    'Mamadou',     'Conducteur d''engins',      390000, '2020-06-22', 4),
(8,  'Doumbia',   'Kadiatou',    'Géologue',                  900000, '2015-10-05', 4),
(9,  'Dembélé',   'Oumar',       'Technicien de maintenance', 530000, '2021-01-18', 5),
(10, 'Sangaré',   'Mariam',      'Opérateur d''usine',        410000, '2022-03-28', 5),
(11, 'Touré',     'Bakary',      'Chef de site',             1750000, '2011-08-09', 6),
(12, 'Cissé',     'Salimata',    'Ingénieur minier',         1180000, '2013-04-30', 7),
(13, 'Diallo',    'Abdoulaye',   'Foreur',                    470000, '2020-09-14', 7),
(14, 'Maïga',     'Rokia',       'Responsable HSE',           740000, '2019-07-01', 8),
(15, 'Bagayoko',  'Souleymane',  'Conducteur d''engins',      400000, '2021-05-17', 8),
(16, 'Samaké',    'Nana',        'Technicien de maintenance', 550000, '2018-12-03', 9),
(17, 'Sissoko',   'Cheick',      'Opérateur d''usine',        420000, '2023-02-06', 9),
(18, 'Togola',    'Hawa',        'Comptable',                 630000, '2016-06-20', 10),
(19, 'Koné',      'Boubacar',    'Géologue',                  920000, '2017-11-27', 10),
(20, 'Diakité',   'Djénéba',     'Ingénieur minier',         1300000, '2015-03-16', 1);
 
-- ---------- PRODUCTIONS (30 lignes : 10 sites x 3 mois, T1 2026) ----------
INSERT INTO productions (id_production, id_site, mois, quantite_tonnes, cout_exploitation_millions_fcfa, nb_incidents_securite) VALUES
(1,  1,  '2026-01-01', 185000.50, 5420.75, 1),
(2,  1,  '2026-02-01', 192300.00, 5610.20, 0),
(3,  1,  '2026-03-01', 201450.25, 5890.40, 2),
(4,  2,  '2026-01-01', 240500.00, 7120.50, 2),
(5,  2,  '2026-02-01', 236800.75, 7005.10, 1),
(6,  2,  '2026-03-01', 251200.00, 7440.00, 3),
(7,  3,  '2026-01-01', 310000.00, 9150.25, 0),
(8,  3,  '2026-02-01', 298750.50, 8870.60, 1),
(9,  3,  '2026-03-01', 322400.00, 9520.80, 0),
(10, 4,  '2026-01-01', 150200.00, 4630.00, 2),
(11, 4,  '2026-02-01', 148900.25, 4590.30, 3),
(12, 4,  '2026-03-01', 160750.00, 4910.45, 4),
(13, 5,  '2026-01-01',  98400.50, 3120.75, 1),
(14, 5,  '2026-02-01', 102300.00, 3240.00, 0),
(15, 5,  '2026-03-01',  95600.25, 3050.20, 1),
(16, 6,  '2026-01-01', 120000.00, 3700.00, 0),
(17, 6,  '2026-02-01', 126450.75, 3880.90, 1),
(18, 6,  '2026-03-01', 131200.00, 4010.15, 0),
(19, 7,  '2026-01-01',  88500.00, 4250.60, 1),
(20, 7,  '2026-02-01',  91200.50, 4380.25, 0),
(21, 7,  '2026-03-01',  94800.00, 4560.70, 2),
(22, 8,  '2026-01-01',  62300.25, 1830.40, 3),
(23, 8,  '2026-02-01',  58900.00, 1760.10, 2),
(24, 8,  '2026-03-01',  65400.75, 1920.55, 3),
(25, 9,  '2026-01-01',  44200.00,  980.30, 0),
(26, 9,  '2026-02-01',  46800.50, 1030.75, 1),
(27, 9,  '2026-03-01',  43100.00,  950.20, 0),
(28, 10, '2026-01-01', 270500.00, 6800.00, 1),
(29, 10, '2026-02-01', 265300.75, 6690.40, 2),
(30, 10, '2026-03-01', 280900.00, 7050.65, 1);


-- =====================================================================
-- VÉRIFICATION RAPIDE (doit afficher 15 / 15 / 20 / 30)
-- =====================================================================

SELECT
    (SELECT COUNT(*) FROM societes)      AS nb_societes,
    (SELECT COUNT(*) FROM sites_miniers) AS nb_sites,
    (SELECT COUNT(*) FROM employes)      AS nb_employes,
    (SELECT COUNT(*) FROM productions)   AS nb_productions;

-- Q1. Combien de sites miniers sont actuellement "En exploitation" ?
--     (COUNT, WHERE)

SELECT COUNT(*)
FROM sites_miniers
WHERE statut = 'En exploitation';

 
-- Q2. Quels sont les 5 sites miniers les plus anciens (selon la date
--     d'ouverture) ? Affiche le nom, la région et la date d'ouverture.
--     (ORDER BY, LIMIT)

 SELECT nom_site, region, date_ouverture
FROM sites_miniers
WHERE date_ouverture IS NOT NULL
ORDER BY date_ouverture ASC
LIMIT 5;

-- Q3. Quels sont le salaire mensuel moyen, minimum et maximum des
--     employés ? Utilise des alias.
--     (AVG, MIN, MAX, AS)
 
 SELECT
    AVG(salaire_mensuel_fcfa) AS salaire_moyen,
    MIN(salaire_mensuel_fcfa) AS salaire_minimum,
    MAX(salaire_mensuel_fcfa) AS salaire_maximum
FROM employes;

-- Q4. Quelle est la production totale (en tonnes) du mois de mars 2026
--     tous sites confondus ?
--     (SUM, WHERE)
 
SELECT SUM(quantite_tonnes) AS production_totale_mars_2026
FROM productions
WHERE mois = '2026-03-01';

-- Q5. Combien de sites miniers y a-t-il par minerai principal ?
--     Classe du minerai le plus fréquent au moins fréquent.
--     (COUNT, GROUP BY, ORDER BY)

SELECT
    minerai_principal,
    COUNT(*) AS nombre_sites
FROM sites_miniers
GROUP BY minerai_principal
ORDER BY COUNT(*) DESC;

-- Q6. Quels minerais sont exploités sur au moins 2 sites miniers ?
--     (COUNT, GROUP BY, HAVING)
 
 SELECT minerai_principal,
       COUNT(*) AS nombre_sites
FROM sites_miniers
GROUP BY minerai_principal
HAVING COUNT(*) >= 2;

-- Q7. Quelles sont les 5 plus fortes productions mensuelles enregistrées
--     (id_site, mois, quantité) ?
--     (ORDER BY DESC, LIMIT)

SELECT
    id_site,
    mois,
    quantite_tonnes
FROM productions
ORDER BY quantite_tonnes DESC
LIMIT 5;

-- Q8. Quels sites (id_site) ont cumulé au moins 5 incidents de sécurité
--     sur le trimestre ? Affiche le total d'incidents par site.
--     (SUM, GROUP BY, HAVING)

SELECT
    id_site,
    SUM(nb_incidents_securite) AS total_incidents
FROM productions
GROUP BY id_site
HAVING SUM(nb_incidents_securite) >= 5;


-- Q9. Quels postes ont un salaire moyen supérieur à 700 000 FCFA ?
--     Affiche le poste, le nombre d'employés et le salaire moyen,
--     du plus élevé au plus bas.
--     (COUNT, AVG, GROUP BY, HAVING, ORDER BY)

SELECT
    poste,
    COUNT(*) AS nombre_employes,
    AVG(salaire_mensuel_fcfa) AS salaire_moyen
FROM employes
GROUP BY poste
HAVING AVG(salaire_mensuel_fcfa) > 700000
ORDER BY AVG(salaire_mensuel_fcfa) DESC;

-- Q10. Pour chaque mois, quels sont la production totale (tonnes) et le
--      coût d'exploitation moyen (millions FCFA) ? Classe par mois.
--      (SUM, AVG, GROUP BY, ORDER BY)

SELECT
    mois,
    SUM(quantite_tonnes) AS production_totale,
    AVG(cout_exploitation_millions_fcfa) AS cout_moyen
FROM productions
GROUP BY mois
ORDER BY mois;