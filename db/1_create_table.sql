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
    constraint fk_category foreign key(category_id) references category(category_id),
    constraint abv_interval check (abv >= 0 AND abv <= 20),
    constraint ibu_interval check (ibu >= 0 AND ibu <= 150)
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
    constraint fk_beer foreign key(beer_id) references beer(beer_id),
    constraint rate_interval check (rate >= 0 AND rate <= 5)
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
