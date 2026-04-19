-- Index Creation

-- Composite Index

CREATE INDEX idx_film_1 ON
film_1 (film_id, film_title, release_year)

-- Separate Index

CREATE INDEX idx_film_2 ON
film_1 (film_id)

CREATE INDEX idx_film_3 ON
film_1 (film_title)

CREATE INDEX idx_film_4 ON
film_1 (release_year)


-- Table Film Creation and primary key costraint setting

CREATE TABLE film_1
(
film_id INT NOT NULL,
film_title VARCHAR(100) NOT NULL,
film_description VARCHAR(255),
release_year INT NOT NULL,
CONSTRAINT pk_film_id PRIMARY KEY (film_id)
)


-- Not required category name delete

DELETE
FROM category
WHERE name = 'Mystery'

-- Insert Data

INSERT INTO film
(film_id, title, description, release_year, language_id)
VALUES
(1001, 'The Matrix', 'Sci-Fi Cult Movie', 2022, 1)

-- Find Movies with a Rental Rate Lower than 1.99 USD

SELECT *
FROM film
WHERE rental_rate < 1.99

-- Update Wrong Year Release for a movie

UPDATE film
SET release_year = 1999
WHERE title = 'The Matrix'