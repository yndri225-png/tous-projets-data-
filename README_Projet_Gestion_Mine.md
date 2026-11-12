# ⛏️ Gestion des Activités Minières au Mali

## 📌 Description

Ce projet a été réalisé avec PostgreSQL dans le but de concevoir et gérer une base de données relationnelle simulant les activités minières au Mali.

Le système permet de stocker et d'exploiter des informations sur les sociétés minières, les sites d'exploitation, les employés et la production minière afin de réaliser différentes analyses à l'aide du langage SQL.

---

## 🎯 Objectifs du projet

- Concevoir une base de données relationnelle.
- Mettre en œuvre les bonnes pratiques de modélisation.
- Créer des tables reliées par des clés primaires et étrangères.
- Manipuler les données avec SQL.
- Réaliser des analyses à l'aide de requêtes SQL.

---

## 🛠️ Technologies utilisées

- PostgreSQL
- pgAdmin 4
- SQL

---

## 🗄️ Structure de la base de données

La base de données est composée des tables suivantes :

### 1. societes

Contient les informations des sociétés minières.

| Champ | Description |
|---------|-------------|
| id_societe | Identifiant de la société |
| nom_societe | Nom de la société |
| pays_origine | Pays d'origine |

### 2. sites_miniers

Contient les sites exploités par les sociétés.

| Champ | Description |
|---------|-------------|
| id_site | Identifiant du site |
| nom_site | Nom du site minier |
| region | Région d'exploitation |
| id_societe | Société propriétaire |

### 3. employes

Contient les informations des employés.

| Champ | Description |
|---------|-------------|
| id_employe | Identifiant |
| nom | Nom de l'employé |
| fonction | Poste occupé |
| salaire | Salaire |
| id_site | Site d'affectation |

### 4. productions

Enregistre la production minière.

| Champ | Description |
|---------|-------------|
| id_production | Identifiant |
| date_production | Date |
| minerai | Type de minerai |
| quantite | Quantité produite |
| id_site | Site concerné |

---

## 🔗 Relations entre les tables

```text
societes
    |
    | 1 ---- N
    |
sites_miniers
    |
    | 1 ---- N
    |
employes

sites_miniers
    |
    | 1 ---- N
    |
productions
```

---

## 📊 Analyses réalisées

Le projet permet notamment de :

- Afficher la liste des sociétés minières.
- Afficher les sites miniers par région.
- Compter le nombre d'employés par site.
- Calculer la masse salariale.
- Analyser la production par site.
- Analyser la production par minerai.
- Effectuer des jointures entre plusieurs tables.
- Produire des statistiques à partir des données.

---

## 💡 Exemples de requêtes SQL

### Production totale par site

```sql
SELECT s.nom_site,
       SUM(p.quantite) AS production_totale
FROM productions p
JOIN sites_miniers s
ON p.id_site = s.id_site
GROUP BY s.nom_site;
```

### Nombre d'employés par site

```sql
SELECT s.nom_site,
       COUNT(e.id_employe) AS nombre_employes
FROM employes e
JOIN sites_miniers s
ON e.id_site = s.id_site
GROUP BY s.nom_site;
```

---

## 📈 Résultats obtenus

✅ Création d'une base de données relationnelle complète

✅ Gestion des sociétés minières et des sites d'exploitation

✅ Gestion des employés

✅ Gestion des données de production

✅ Réalisation de requêtes SQL avancées

✅ Exploitation des données pour l'analyse décisionnelle

---

## 📚 Compétences développées

- Conception de bases de données
- Modélisation relationnelle
- PostgreSQL
- SQL
- Création de tables
- Clés primaires et étrangères
- Jointures SQL
- Fonctions d'agrégation
- Analyse de données

---

## 🚀 Perspectives d'amélioration

- Création de vues SQL
- Développement de procédures stockées
- Création de déclencheurs (Triggers)
- Connexion à Power BI pour la visualisation des données
- Création de tableaux de bord interactifs

---

## 👨‍💻 Auteur

**NDRI Yves Allan Roland**
