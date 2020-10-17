-- -- ex2
-- SELECT name,weight FROM pokemon
-- WHERE weight=(SELECT MAX(weight) FROM pokemon)

-- -- ex3
-- SELECT pokemon_type.name AS type, pokemon.name AS name
-- FROM pokemon,pokemon_type
-- WHERE pokemon.type=pokemon_type.id AND pokemon_type.name="grass"


-- SELECT name
-- FROM pokemon

-- --ex4
-- SELECT trainer.name 
-- FROM pokemon, trainer, pokemon_trainer
-- WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id 
-- AND pokemon.name="venusaur"

-- ex5
-- SELECT pokemon.name
-- FROM pokemon,trainer,pokemon_trainer
-- WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id AND trainer.name="LOGA"

SELECT COUNT(*) AS count , pokemon.name
FROM pokemon,trainer,pokemon_trainer
WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id
GROUP BY pokemon.name
ORDER BY COUNT(*) DESC
LIMIT 10

-- SELECT COUNT(*), pokemon.name
-- FROM pokemon,trainer,pokemon_trainer
-- WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id
-- GROUP BY pokemon.name
-- ORDER BY COUNT(*) DESC
-- LIMIT 10

-- SELECT MAX (mypoke)
-- FROM (SELECT pokemon.name,  COUNT(*) mypoke)
-- FROM pokemon,trainer,pokemon_trainer
-- WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id
-- GROUP BY pokemon.name;

-- SELECT pokemon.name, COUNT(*)
-- FROM pokemon,trainer,pokemon_trainer
-- WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id
-- HAVING COUNT (pokemon.name) =(
--     SELECT MAX(mycount)
--     FROM (SELECT pokemon.name,COUNT (pokemon.name) mycount
--     FROM pokemon
--     GROUP BY pokemon.name
--     )
-- )


-- SELECT name,weight FROM pokemon
-- WHERE weight=(SELECT MAX(weight) FROM pokemon)