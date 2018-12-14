DROP DATABASE IF EXISTS fb_api;
CREATE DATABASE fb_api;

\c fb_api;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    age INT 
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body TEXT NOT NULL
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    commenter_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id)
);

CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    album_id INT REFERENCES albums(id),
    url TEXT
);

INSERT INTO users (name, age) VALUES ('Alex Park', 25), ('Scooby Doo', 3000), ('Courage Doge', 20), ('Sean Carter', 45), ('Jermaine Cole', 33), ('Scarlett Johansson', 34);

INSERT INTO posts (poster_id, body) VALUES (1, 'I like to move it move it'), (2, 'Ruh-roh--RAGGY!!!'), (4, 'I''m not a businessman, I''m a business, man!');