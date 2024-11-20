# Installation du projet

Prérequis :
* [DBeaver](https://dbeaver.io/)
* [Docker](https://www.docker.com/)

Cloner le projet, puis ouvrir un terminal et exécuter la commande suivante à la racine:
```
$ docker compose up
```

A l'aide des variables du fichier de configuration docker-compose.yaml (POSTGRES_USER, POSTGRES_PASSWORD et POSTGRES_DB) créer une nouvelle connexion sur DBeaver.

# Requêtes SQL

Lister les bières par taux d'alcool, de la plus légère à la plus forte.
```
SELECT * 
FROM beer 
ORDER BY beer.abv;
```

Afficher le nombre de bières par catégorie.
```
SELECT c.name, count(b.beer_id)
FROM category c
left JOIN beer b ON c.category_id = b.beer_id 
GROUP BY c.category_id;
```

Trouver toutes les bières d'une brasserie dONnée.
```
SELECT * 
FROM beer
WHERE brewery_id = 1;
```

Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.
```
SELECT u.username, count(f.beer_id) AS favorite_number
FROM users u 
LEFT JOIN favorite f ON u.user_id = f.favorite_id
GROUP BY u.username 
```

Ajouter une nouvelle bière à la base de données.
```
INSERT INTO beer (brewery_id, category_id, name, descriptiON, abv, ibu) 
VALUES (7, 2, 'StONe IPA', 'Test', 6.9, 71);
```

Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.
```
SELECT b.name AS beer_name, br.name AS brewery_name, br.country
FROM brewery br
JOIN beer b
USING(brewery_id)
ORDER BY br.country
```

Lister les bières avec leurs ingrédients.
```
SELECT b.name AS beers_name, i.name AS ingredients_name
FROM beer b 
INNER JOIN beer_ingredient bi ON b.beer_id = bi.beer_id
INNER JOIN ingredient i ON bi.ingredient_id = i.ingredient_id 
```

Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.
```
SELECT br.name AS brewery_name, count(b.beer_id) AS beers_number
FROM brewery br
JOIN beer b ON br.brewery_id = b.brewery_id
GROUP BY br.name
HAVING count(b.beer_id) > 5;
```

Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.
```
SELECT b.name
FROM beer b
LEFT JOIN favorite f ON b.beer_id = f.beer_id
WHERE f.beer_id is null;
```

Trouver les bières favorites communes entre deux utilisateurs.
```
SELECT f1.beer_id, b.name
FROM favorite f1
JOIN favorite f2 ON f1.beer_id = f2.beer_id 
JOIN beer b ON b.beer_id = f2.beer_id
WHERE f1.user_id = 1 and f2.user_id = 9;
```

Afficher les brasseries dont les bières ONt une moyenne de notes supérieure à une certaine valeur.
```
SELECT br.name, AVG(r.rate)
FROM brewery br
JOIN beer b ON br.brewery_id = b.brewery_id 
JOIN review r ON b.beer_id = r.beer_id 
GROUP BY br.name
HAVING AVG(r.rate) > 4; 
```

Mettre à jour les informations d'une brasserie.
```
UPDATE brewery
SET description = 'description test'
WHERE brewery_id = 20;
```

Supprimer les photos d'une bière en particulier.
```
DELETE FROM photo 
WHERE photo.beer_id = 20;
```

Instruction de test pour la procédure de mise à jour de la note.
```
CALL beers_rate(1, 5, 2, 'test');
```
