# Revue de projet

Projet de Juliette SUC : https://github.com/2024-devops-alt-dist/zythologue-js.

## Dictionnaire de données et règle de gestion

Le dictionnaire de données est très complet et détaillé, je trouve la colonne usage et contexte d'utilisation très intéressante. L'ajout des règles de gestion dans le dictionnaire de données est une très bonne idée pour une meilleur clarté.

## Base de données 
Dans le MCD, la relation user/beer pour les favoris est en 1,n. J'aurais plutôt mis cette relation en 0,n car un utilisateur peu ne pas avoir de favoris et une bière peu ne pas être ajouter par un utilisateur. Même remarque pour la relation à user/review/beer.

## Installation du projet
L'installation de la base de donnée fonctionne et la procédure est bien expliquée dans le README. Attention à la ligne DROP TRIGGER dans le fichier 2_triggers.sql à retirer pour éviter les erreurs d'exècution de la suite des scripts.

## Requêtes sql
Toutes les requêtes s'exécutent sans erreurs et retournent les bons résultats.
