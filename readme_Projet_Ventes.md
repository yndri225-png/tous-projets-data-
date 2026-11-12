# 📊 Analyse des Ventes avec Power Query

## 📌 Description

Ce projet a été réalisé avec Microsoft Excel et Power Query dans le but de nettoyer, transformer et analyser des données de ventes provenant de plusieurs sources.

L'objectif était de construire un processus automatisé permettant de consolider les ventes mensuelles, enrichir les données à partir de tables de référence et comparer les performances réelles aux objectifs commerciaux.

---

## 🎯 Objectifs du projet

- Importer plusieurs tables dans Power Query
- Nettoyer et standardiser les données
- Fusionner des tables de référence
- Créer des colonnes calculées
- Calculer le chiffre d'affaires par boutique et par mois
- Comparer les résultats obtenus aux objectifs fixés
- Mettre en place un modèle actualisable automatiquement

---

## 🛠️ Outils utilisés

- Microsoft Excel
- Power Query
- Fonctions M (Power Query)

---

## 📂 Données utilisées

Le projet repose sur plusieurs tables :

### Tables de ventes

- Janvier
- Février
- Mars

### Tables de référence

- Produits
- Boutiques
- Objectifs

---

## 🔄 Étapes réalisées

### 1. Importation des données

Importation des 5 tables dans Power Query en mode « Connexion uniquement ».

### 2. Regroupement des ventes

Ajout des tables Janvier, Février et Mars dans une seule requête :

```text
Ventes = Jan + Fév + Mar
