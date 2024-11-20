create table users (
	user_id serial primary key,
	email varchar(255) unique not null,
	password varchar(255) not null,
	username varchar(255),
	firstname varchar(255),
	lastname varchar(255)
);

create table brewery (
    brewery_id serial primary key,
    name varchar(255) not null,
    address varchar(255) not null,
    country varchar(255),
    description text,
    link varchar(255),
    email varchar(255)
);

create table category (
    category_id serial primary key,
    name varchar(255) not null,
    description text
);

create table beer (
    beer_id serial primary key,
    brewery_id int,
    category_id int not null,
    name varchar(255) not null,
    description text,
    abv decimal(4, 2),
    ibu int,
    constraint fk_brewery foreign key(brewery_id) references brewery(brewery_id),
    constraint fk_category foreign key(category_id) references category(category_id)
);

create table photo (
    photo_id serial primary key,
    beer_id int not null,
    url varchar(2048),
    constraint fk_beer foreign key(beer_id) references beer(beer_id) on delete cascade
);

create table favorite (
    favorite_id serial primary key,
    user_id int not null,
    beer_id int not null,
    constraint fk_user foreign key(user_id) references users(user_id) on delete cascade,
    constraint fk_beer foreign key(beer_id) references beer(beer_id) on delete cascade
);

create table review (
    review_id serial primary key,
    user_id int,
    beer_id int,
    rate int,
    comment text,
    created_at timestamp default now(),
    constraint fk_user foreign key(user_id) references users(user_id),
    constraint fk_beer foreign key(beer_id) references beer(beer_id)
);

create table ingredient (
    ingredient_id serial primary key,
    name varchar(255)
);

create table beer_ingredient (
    beer_ingredient_id serial primary key,
    beer_id int,
    ingredient_id int,
    constraint fk_beer foreign key(beer_id) references beer(beer_id),
    constraint fk_ingredient foreign key(ingredient_id) references ingredient(ingredient_id)
);

insert into users (email, password, username, firstname, lastname) values
  ('lucas.martin@example.com', 'md5password123', 'lucas_martin', 'Lucas', 'Martin'),
  ('sophie.dupuis@example.com', 'md5password234', 'sophie_dupuis', 'Sophie', 'Dupuis'),
  ('tom.dubois@example.com', 'md5password345', 'tom_dubois', 'Tom', 'Dubois'),
  ('laura.leclerc@example.com', 'md5password456', 'laura_leclerc', 'Laura', 'Leclerc'),
  ('nicolas.moreau@example.com', 'md5password567', 'nicolas_moreau', 'Nicolas', 'Moreau'),
  ('emilie.brunet@example.com', 'md5password678', 'emilie_brunet', 'Emilie', 'Brunet'),
  ('benjamin.bernard@example.com', 'md5password789', 'benjamin_bernard', 'Benjamin', 'Bernard'),
  ('anais.klein@example.com', 'md5password890', 'anais_klein', 'Anaïs', 'Klein'),
  ('quentin.durand@example.com', 'md5password901', 'quentin_durand', 'Quentin', 'Durand'),
  ('victor.lambert@example.com', 'md5password012', 'victor_lambert', 'Victor', 'Lambert'),
  ('clara.carpentier@example.com', 'md5password1234', 'clara_carpentier', 'Clara', 'Carpentier'),
  ('matthew.smith@example.com', 'md5password2345', 'matthew_smith', 'Matthew', 'Smith'),
  ('julia.robin@example.com', 'md5password3456', 'julia_robin', 'Julia', 'Robin'),
  ('geoffrey.white@example.com', 'md5password4567', 'geoffrey_white', 'Geoffrey', 'White'),
  ('olivier.perez@example.com', 'md5password5678', 'olivier_perez', 'Olivier', 'Perez'),
  ('marie.wilson@example.com', 'md5password6789', 'marie_wilson', 'Marie', 'Wilson'),
  ('simon.roux@example.com', 'md5password7890', 'simon_roux', 'Simon', 'Roux'),
  ('victor.bourgeois@example.com', 'md5password8901', 'victor_bourgeois', 'Victor', 'Bourgeois'),
  ('audrey.fabre@example.com', 'md5password9012', 'audrey_fabre', 'Audrey', 'Fabre'),
  ('alice.smith@example.com', 'hashed_password_456', 'alicesmith', 'Alice', 'Smith');


insert into brewery (name, address, country, description, link, email) values
  ('Brasserie Dupont', 'Rue de l''Industrie, 10, 7340 Pipaix', 'Belgique', 'Brasserie belge traditionnelle, célèbre pour sa saison Dupont.', 'https://www.brasseriedupont.com', 'contact@brasseriedupont.com'),
  ('Stone Brewing', '1999 Citracado Parkway, Escondido, CA 92029', 'États-Unis', 'Brasserie californienne connue pour ses bières IPA audacieuses.', 'https://www.stonebrewing.com', 'contact@stonebrewing.com'),
  ('Zennebier', 'Boulevard des Sports 12, 1000 Bruxelles', 'Belgique', 'Brasserie artisanale bruxelloise spécialisée dans les bières locales.', 'https://www.zennebier.be', 'info@zennebier.be'),
  ('BrewDog', '8, Brewery Place, Fraserburgh, AB43 8TH', 'Royaume-Uni', 'Brasserie pionnière dans l''innovation de bières artisanales.', 'https://www.brewdog.com', 'info@brewdog.com'),
  ('Brasserie Chimay', 'Chimay, Belgique', 'Belgique', 'Brasserie trappiste renommée pour ses bières riches en goût.', 'https://www.chimay.com', 'contact@chimay.com'),
  ('Sierra Nevada', '1075 E. 20th St., Chico, CA 95928', 'États-Unis', 'Brasserie emblématique des États-Unis, connue pour ses bières artisanales équilibrées.', 'https://www.sierranevada.com', 'contact@sierranevada.com'),
  ('La Brasserie de la Goutte d''Or', '18 Rue de la Goutte d''Or, Paris, France', 'France', 'Brasserie locale à Paris, créant des bières artisanales uniques.', 'https://www.brgouttedor.fr', 'contact@brgouttedor.fr'),
  ('London Craft Brewery', '45 Brick Lane, London, E1 6PU, United Kingdom', 'United Kingdom', 'Brasserie artisanale située à Londres, spécialisée dans les bières innovantes avec une touche de tradition britannique.', 'https://www.londoncraftbrewery.com', 'info@londoncraftbrewery.com'),
  ('Mikkeller', 'Vesterbrogade 53, 1620 København', 'Danemark', 'Brasserie danoise innovante, connue pour ses bières expérimentales.', 'https://www.mikkeller.dk', 'info@mikkeller.dk'),
  ('Ommegang', '656 County Route 33, Cooperstown, NY 13326', 'États-Unis', 'Brasserie américaine produisant des bières belges authentiques.', 'https://www.ommegang.com', 'info@ommegang.com'),
  ('Westmalle Brewery', 'Westmalle 1, 2390 Malle', 'Belgique', 'Brasserie trappiste belge produisant des bières riches et complexes.', 'https://www.westmalle.be', 'info@westmalle.be'),
  ('Pilsner Urquell', 'Plzeň 1, Czech Republic', 'République tchèque', 'Première pilsner au monde, brassée à Plzeň depuis 1842.', 'https://www.pilsnerurquell.com', 'info@pilsnerurquell.com'),
  ('The Kernel Brewery', 'Arch 13, Druid Street, SE1 2EZ', 'Royaume-Uni', 'Brasserie londonienne spécialisée dans les IPA et les bières houblonnées.', 'https://www.thekernelbrewery.com', 'contact@thekernelbrewery.com'),
  ('St. Bernardus', 'Beauvoorde 1, 8640 Watou', 'Belgique', 'Brasserie trappiste belge produisant des bières fortes et aromatiques.', 'https://www.saintbernardus.be', 'info@saintbernardus.be'),
  ('Brouwerij Boon', 'Dorpstraat 46, 1653 Beersel', 'Belgique', 'Brasserie belge spécialisée dans les bières lambic et gueuze.', 'https://www.boon.be', 'info@boon.be'),
  ('Brouwerij De Halve Maan', 'Walplein 26, 8000 Brugge', 'Belgique', 'Brasserie belge historique, productrice de bières comme la Brugse Zot.', 'https://www.halvemaan.be', 'info@halvemaan.be'),
  ('Brasserie St. Feuillien', 'Rue du Mont 4, 7180 Le Roeulx', 'Belgique', 'Brasserie belge produisant des bières riches et pleines de caractère.', 'https://www.stfeuillien.be', 'info@stfeuillien.be'),
  ('Brasserie de la Senne', 'Drève de l''Industrialisation 2, 1650 Jodoigne', 'Belgique', 'Brasserie artisanale belge spécialisée dans les bières houblonnées et complexes.', 'https://www.brasseriedelassenne.be', 'contact@brasseriedelassenne.be'),
  ('Brasserie d''Orval', 'Orval, 6823 Villers-devant-Orval', 'Belgique', 'Brasserie trappiste belge, célèbre pour sa bière Orval.', 'https://www.orval.be', 'info@orval.be'),
  ('Brasserie des Sources', '32 Rue de la Gare, 08440 Les Mazures', 'France', 'Brasserie artisanale française produisant des bières locales de qualité.', 'https://www.brasseriedessources.fr', 'contact@brasseriedessources.fr');

insert into category (name, description) values
  ('Lager', 'Bière fermentée à basse température, légère et rafraîchissante.'),
  ('IPA', 'Bière riche en houblon avec des arômes floraux et fruités, souvent amère.'),
  ('Stout', 'Bière foncée aux arômes de café et chocolat, souvent crémeuse et riche.'),
  ('Pilsner', 'Bière claire, légère, souvent houblonnée, provenant de la République Tchèque.'),
  ('Pale Ale', 'Bière amère et houblonnée, plus légère que l''IPA, avec des notes de fruits.'),
  ('Wheat Beer', 'Bière à base de blé, souvent trouble, avec un goût léger et épicé.'),
  ('Belgian Dubbel', 'Bière belge foncée et maltée, aux arômes de fruits secs et caramel.'),
  ('Porter', 'Bière foncée, avec des notes de café, chocolat et malt grillé.'),
  ('Amber Ale', 'Bière de couleur ambrée, au goût légèrement sucré et malté.'),
  ('Saison', 'Bière belge de fermentation haute, épicée et légèrement fruitée.'),
  ('Bock', 'Bière allemande forte, souvent douce et maltée, au goût riche et rond.'),
  ('Lambic', 'Bière belge fermentée naturellement, souvent fruitée, utilisée pour les gueuzes.'),
  ('Barleywine', 'Bière forte, sucrée, aux arômes de fruits secs et caramel.'),
  ('Saison', 'Bière rustique de fermentation haute, avec des notes épicées et légèrement acidulées.'),
  ('Cider', 'Boisson fermentée à base de pommes, souvent légère et sucrée.');

insert into beer (brewery_id, category_id, name, description, abv, ibu) values 
  (1, 2, 'Duvel', 'Bière belge blonde et forte, avec une amertume légère et un goût fruité.', 8.5, 35),
  (2, 4, 'Stone IPA', 'IPA houblonnée, amère, avec des arômes de pamplemousse et d''agrumes.', 7.0, 70),
  (3, 7, 'Zennebier', 'Bière belge de style saison, légèrement épicée avec des notes de fruits.', 6.0, 30),
  (4, 2, 'Punk IPA', 'IPA avec des arômes de fruits tropicaux et un goût amer audacieux.', 5.6, 60),
  (5, 1, 'Chimay Blue', 'Bière trappiste belge forte, aux arômes de fruits noirs et de caramel.', 9.0, 25),
  (6, 3, 'Sierra Nevada Pale Ale', 'Bière avec un mélange de malt sucré et un arôme de houblon frais.', 5.6, 38),
  (7, 5, 'West Coast IPA', 'IPA sèche et amère, avec des notes d''agrumes et de pin.', 6.5, 75),
  (8, 6, 'Goutte d''Or Wheat', 'Bière de blé légère et rafraîchissante avec des notes d''agrumes.', 5.0, 20),
  (9, 8, 'Brasserie Chimay', 'Bière trappiste riche et complexe avec des arômes de fruits mûrs et de caramel.', 8.0, 20),
  (10, 3, 'Mikkeller IPA', 'IPA créative et équilibrée, avec des arômes tropicaux intenses.', 6.9, 65),
  (11, 1, 'Brasserie de la Goutte d''Or', 'Bière locale de Paris, fruitée et légèrement épicée.', 5.5, 20),
  (12, 4, 'Saison Dupont', 'Bière belge de saison, légère avec un goût d''épices et une touche de houblon.', 6.5, 35),
  (13, 7, 'Ommegang Abbey Ale', 'Bière belge de style abbaye, riche en arômes de fruits et de malt.', 7.5, 40),
  (14, 9, 'Brasserie St. Bernardus', 'Bière trappiste douce avec des arômes de fruits et de caramel.', 10.5, 20),
  (15, 2, 'BrewDog Punk IPA', 'IPA amère avec des saveurs de mangue et de citron.', 6.0, 55),
  (16, 1, 'Chimay Red', 'Bière trappiste belge avec des arômes de caramel et de fruits.', 7.0, 18),
  (17, 10, 'Brasserie Mikkeller', 'Bière houblonnée avec une amertume marquée et un goût floral.', 7.0, 65),
  (18, 5, 'Pilsner Urquell', 'Pilsner légère avec une amertume marquée et un goût frais.', 4.4, 35),
  (19, 6, 'La Chouette Blanche', 'Bière blanche légère, légèrement sucrée avec des notes de céréales.', 5.0, 10),
  (20, 4, 'The Kernel IPA', 'IPA anglaise avec des saveurs de fruits tropicaux et une amertume équilibrée.', 6.3, 55),
  (1, 1, 'Mountain Lager', 'Bière légère, rafraîchissante, idéale pour les randonnées en montagne.', 4.5, 15),
  (1, 2, 'Alpine IPA', 'IPA aux arômes intenses de fruits tropicaux, avec une amertume marquée.', 6.8, 60),
  (1, 3, 'Glacier Stout', 'Bière noire, riche en saveurs de café et de chocolat.', 7.2, 40),
  (2, 1, 'Lakeside Pilsner', 'Pilsner légère et rafraîchissante, parfaite pour les journées en bord de lac.', 5.0, 20),
  (2, 4, 'Golden Pale Ale', 'Pale Ale équilibrée, avec des arômes floraux et une légère amertume.', 5.5, 25),
  (3, 1, 'Ocean Breeze Lager', 'Lager à la saveur douce et légère, inspirée par l''air marin.', 4.2, 10),
  (3, 2, 'Hop Fusion IPA', 'IPA aux notes de houblon intense avec un arrière-goût fruité.', 6.5, 70),
  (3, 3, 'Midnight Stout', 'Stout sombre, crémeuse et intense avec des notes de chocolat noir.', 8.0, 45),
  (4, 5, 'Heritage Bock', 'Bock traditionnelle, riche et maltée avec une légère douceur.', 7.4, 30),
  (4, 1, 'Sunset Lager', 'Lager dorée, facile à boire avec une douceur maltée et une légère amertume.', 5.1, 18),
  (5, 6, 'Spring Wheat Beer', 'Bière de blé, légère et légèrement trouble, avec des notes de citron et d''épices.', 4.8, 20),
  (5, 7, 'Amber Brew', 'Bière ambrée, douce et maltée, avec des arômes de fruits secs.', 6.2, 35),
  (6, 1, 'Mountain Trail Lager', 'Lager douce, idéale pour les sorties en montagne, avec une légère note d''herbes.', 4.4, 12),
  (6, 2, 'Pineapple IPA', 'IPA aux saveurs exotiques d''ananas et de mangue, avec une forte amertume.', 6.9, 65),
  (7, 1, 'Brewmaster''s Pilsner', 'Pilsner élégante avec une finale nette et sèche.', 5.0, 22),
  (7, 8, 'Dark Harvest Porter', 'Porter riche en arômes de caramel, chocolat et grains grillés.', 6.0, 30),
  (8, 9, 'Lime Wheat Beer', 'Bière de blé agrémentée de notes de lime pour une sensation de fraîcheur.', 4.6, 15),
  (8, 5, 'Hazy Saison', 'Saison légère et fruitée, légèrement épicée avec une touche de levure.', 5.8, 28),
  (9, 6, 'Citrus Wheat', 'Bière de blé aux arômes d''agrumes, avec une touche de coriandre.', 4.3, 25),
  (9, 3, 'Black Forest Stout', 'Stout riche avec des saveurs de chocolat, cerises et café grillé.', 7.5, 50);

insert into photo (beer_id, url) values
  (1, 'https://example.com/photos/duvel.jpg'),
  (2, 'https://example.com/photos/stone_ipa.jpg'),
  (3, 'https://example.com/photos/zennebier.jpg'),
  (4, 'https://example.com/photos/punk_ipa.jpg'),
  (5, 'https://example.com/photos/chimay_blue.jpg'),
  (6, 'https://example.com/photos/sierra_nevada.jpg'),
  (7, 'https://example.com/photos/west_coast_ipa.jpg'),
  (8, 'https://example.com/photos/goutte_or_wheat.jpg'),
  (9, 'https://example.com/photos/chimay.jpg'),
  (10, 'https://example.com/photos/mikkeller_ipa.jpg'),
  (11, 'https://example.com/photos/goutte_dor.jpg'),
  (12, 'https://example.com/photos/saison_dupont.jpg'),
  (13, 'https://example.com/photos/ommegang_abbey_ale.jpg'),
  (14, 'https://example.com/photos/st_bernardus.jpg'),
  (15, 'https://example.com/photos/brewdog_ipa.jpg'),
  (16, 'https://example.com/photos/chimay_red.jpg'),
  (17, 'https://example.com/photos/mikkeller.jpg'),
  (18, 'https://example.com/photos/pilsner_urquell.jpg'),
  (19, 'https://example.com/photos/chouette_blanche.jpg'),
  (20, 'https://example.com/photos/kernel_ipa.jpg');

insert into favorite (user_id, beer_id) values
(1, 5),
(2, 3),
(3, 8),
(4, 7),
(5, 1),
(6, 10),
(7, 12),
(8, 19),
(9, 20),
(10, 4),
(11, 13),
(12, 9),
(13, 14),
(14, 2),
(15, 18),
(16, 6),
(17, 15),
(18, 11),
(19, 17),
(20, 16),
(1, 20),
(2, 18),
(3, 4),
(4, 6),
(5, 15),
(6, 10),
(7, 12),
(8, 13),
(9, 5);

insert into review (user_id, beer_id, rate, comment) values
  (1, 5, 5, 'Une bière complexe et délicieuse, j''adore la richesse de ses arômes.'),
  (2, 7, 4, 'Excellente IPA, un peu amère mais bien équilibrée.'),
  (3, 3, 3, 'Bon goût de fruits mais manque de corps.'),
  (4, 2, 5, 'Ma IPA préférée, parfaite pour les amateurs de houblon.'),
  (5, 8, 4, 'Bière légère et rafraîchissante, idéale pour l''été.'),
  (6, 4, 2, 'Trop amère pour mon goût, mais bien faite.'),
  (7, 6, 5, 'Superbe bière, je suis fan de sa fraîcheur et de ses arômes tropicaux.'),
  (8, 9, 5, 'La meilleure trappiste que j''ai goûtée.'),
  (9, 12, 4, 'Très bonne saison, avec un goût léger mais intéressant.'),
  (10, 14, 3, 'Bien mais un peu trop sucrée à mon goût.'),
  (11, 10, 4, 'Très bonne IPA, mais j''attendais un peu plus de saveurs.'),
  (12, 19, 4, 'Très bonne bière blanche, mais trop légère pour être mémorable.'),
  (13, 13, 5, 'Un goût parfait de malt et de fruits.'),
  (14, 5, 4, 'Bonne bière, mais je préfère d''autres trappistes.'),
  (15, 20, 3, 'Bonne IPA, mais un peu trop de houblon pour moi.'),
  (16, 3, 4, 'Bien équilibrée avec des saveurs intéressantes.'),
  (17, 9, 5, 'Une bière magnifique, riche en arômes de caramel et de fruits.'),
  (18, 17, 4, 'Bonne bière mais manquant un peu d''intensité.'),
  (19, 1, 5, 'Une bière iconique, toujours au top.'),
  (20, 6, 4, 'Bonne saison, agréable mais pas exceptionnelle.');


insert into ingredient (name) values
('Houblon'),
('Malt'),
('Levure'),
('Blé'),
('Céréales'),
('Sucre'),
('Fruits'),
('Café'),
('Chocolat'),
('Épices'),
('Herbes'),
('Eau'),
('Caramel'),
('Banane'),
('Orge');

insert into beer_ingredient (beer_id, ingredient_id) values
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 3),
(9, 2),
(9, 4),
(10, 1),
(10, 5),
(11, 3),
(12, 2),
(12, 5),
(13, 6),
(14, 7),
(15, 1),
(16, 2),
(17, 8),
(18, 9),
(19, 10),
(20, 11),
(3, 12),
(5, 13),
(7, 14),
(9, 2),
(10, 15),
(11, 13),
(12, 1),
(13, 6),
(14, 5),
(15, 9),
(16, 10),
(17, 8),
(18, 3),
(19, 6),
(20, 2);