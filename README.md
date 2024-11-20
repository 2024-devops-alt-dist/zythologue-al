* Installation du projet

Installation:
    DBeaver
    Docker

Cloner le projet, puis ouvrir un terminal et exécuter la commande suivante à la racine:
```
docker compose up
```

Ouvrir DBeaver etl'aide des variables définis dans le fichier de configuration docker-compose.yaml (POSTGRES_USER, POSTGRES_PASSWORD et POSTGRES_DB) créer une nouvelle connexion.

* Requêtes SQL

Lister les bières par taux d'alcool, de la plus légère à la plus forte.
```
SELECT * 
FROM beer 
ORDER BY beer.abv;
```

Afficher le nombre de bières par catégorie.
```
select c.name, count(b.beer_id)
from category c
left join beer b on c.category_id = b.beer_id 
group by c.category_id;
```

Trouver toutes les bières d'une brasserie donnée.
```
SELECT * 
FROM beer
WHERE brewery_id = 1;
```

Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.
```
SELECT u.username, count(f.beer_id) as favorite_number
FROM users u 
LEFT JOIN favorite f ON u.user_id = f.favorite_id
GROUP BY u.username 
```

Ajouter une nouvelle bière à la base de données.
```
INSERT INTO beer (brewery_id, category_id, name, description, abv, ibu) 
VALUES (7, 2, 'Stone IPA', 'Test', 6.9, 71);
```

Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.
```
SELECT b.name as beer_name, br.name as brewery_name, br.country
FROM brewery br
JOIN beer b
USING(brewery_id)
order by br.country
```

Lister les bières avec leurs ingrédients.
```
select b.name as beers_name, i.name as ingredients_name
from beer b 
inner join beer_ingredient bi on b.beer_id = bi.beer_id
inner join ingredient i on bi.ingredient_id = i.ingredient_id 
```

Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.
```
select br.name as brewery_name, count(b.beer_id) as beers_number
from brewery br
join beer b ON br.brewery_id = b.brewery_id
group by br.name
having count(b.beer_id) > 5;
```

Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.
```
select b.name
from beer b
left join favorite f on b.beer_id = f.beer_id
where f.beer_id is null;
```

Trouver les bières favorites communes entre deux utilisateurs.
```
select f1.beer_id, b.name
from favorite f1
join favorite f2 on f1.beer_id = f2.beer_id 
join beer b on b.beer_id = f2.beer_id
where f1.user_id = 1 and f2.user_id = 9;
```

Afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur.
```
select br.name, avg(r.rate)
from brewery br
join beer b on br.brewery_id = b.brewery_id 
join review r on b.beer_id = r.beer_id 
group by br.name
having avg(r.rate) > 4; 
```

Mettre à jour les informations d'une brasserie.
```
update brewery
set description = 'description test'
where brewery_id = 20;
```

Supprimer les photos d'une bière en particulier.
```
delete from photo 
where photo.beer_id = 20;
```
