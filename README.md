# 📊 Projets Data Analyst

## 1. ⛏️ Secteur minier au Mali — SQL

Base de données relationnelle simulant l'industrie minière malienne, puis analyse par requêtes SQL.

- **Modèle** : 4 tables liées par clés étrangères — `societes` (15), `sites_miniers` (15), `employes` (20), `productions` (30 lignes, T1 2026)
- **Données** : or, lithium, manganèse, fer, phosphate, bauxite — régions Kayes, Sikasso, Koulikoro, Gao
- **Analyses** : sites actifs, sites les plus anciens, salaires (moy/min/max), production mensuelle, top productions, incidents de sécurité par site, salaire moyen par poste, coût d'exploitation par mois
- **Compétences** : `CREATE TABLE`, `PRIMARY/FOREIGN KEY`, `CHECK`, `INSERT`, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`, `COUNT/SUM/AVG/MIN/MAX`, sous-requêtes

## 2. 🛒 Analyse des ventes — Excel & Power Query

Processus ETL automatisé pour consolider et analyser des ventes mensuelles multi-sources.

- **Données** : ventes Janvier, Février, Mars + tables de référence Produits, Boutiques, Objectifs
- **Étapes** : import (connexion uniquement) → nettoyage/standardisation → ajout des 3 mois (`Ventes = Jan + Fév + Mar`) → fusion avec les références → colonnes calculées
- **Résultats** : chiffre d'affaires par boutique et par mois, comparaison **réel vs objectifs**, modèle actualisable en un clic
- **Compétences** : Power Query, langage M, ajout/fusion de requêtes, transformation de données

---

🛠️ **Outils** : SQL · Excel · Power Query (M)
