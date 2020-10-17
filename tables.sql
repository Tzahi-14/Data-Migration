USE sql_pokemon;

-- CREATE TABLE pokemon (
--     pokemon_id INT PRIMARY KEY,
--     name VARCHAR(20),
--     type INT,
--     height int(3),
--     weight INT(8),
--     FOREIGN KEY(type) REFERENCES pokemon_type(id)
-- );

-- CREATE TABLE pokemon_type(
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     type VARCHAR(20)
-- );

-- CREATE TABLE trainer (
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     trainer VARCHAR(40),
--     town INT(40),
--     FOREIGN KEY(town) REFERENCES town(id)
-- );

-- CREATE TABLE pokemon_type(
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(25)
-- );


-- CREATE TABLE town(
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(25)
-- );


-- CREATE TABLE trainer(
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(25),
--     town INT,


--     FOREIGN KEY(town) REFERENCES town(id)
-- );


-- CREATE TABLE pokemon(
--     id INT PRIMARY KEY,
--     name VARCHAR(25),
--     type INT,
--     height SMALLINT,
--     weight SMALLINT,


--     FOREIGN KEY(type) REFERENCES pokemon_type(id)
-- );


-- CREATE TABLE pokemon_trainer(
--     p_id INT,
--     t_id INT,


--     FOREIGN KEY(p_id) REFERENCES pokemon(id),
--     FOREIGN KEY(t_id) REFERENCES trainer(id)
-- );

-- DROP TABLE trainer ; 
-- DROP TABLE town ; 
-- DROP TABLE pokemon ; 
-- DROP TABLE pokemon_type ;
-- DROP TABLE pokemon_trainer ;

-- DROP DATABASE sql_pokemon 
-- ALTER TABLE trainer
-- ADD town INT(40);

-- ALTER TABLE trainer
-- DROP COLUMN town;

-- CREATE TABLE town (
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     town VARCHAR (40)
-- );


-- CREATE TABLE pokemon_trainer(
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     pokemon_id INT,
--     trainer_id INT,
--     FOREIGN KEY(pokemon_id) REFERENCES pokemon(pokemon_id),
--     FOREIGN KEY(trainer_id) REFERENCES trainer(id)
-- );

-- SELECT * FROM pokemon_type
-- SELECT * FROM pokemon_trainer
-- SELECT * FROM town
-- DELETE FROM pokemon_type
-- WHERE type = "undefined"

-- SHOW CREATE TABLE town
-- SHOW CREATE TABLE trainer
-- DELETE FROM trainer

-- DELETE FROM trainer
-- WHERE name=name AND town= town

-- SELECT *
-- FROM trainer
-- ORDER BY name

-- SELECT COUNT(*)
-- FROM trainer
-- GROUP BY name,town
-- HAVING COUNT(*)>1

-- SELECT DISTINCT name,town
-- FROM trainer
