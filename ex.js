const Sequelize = require('sequelize')
const sequelize = new Sequelize('mysql://root:@localhost/sql_pokemon')

//ex2
const maxWeight = async function () {
    let dataOfMaxWeight = await sequelize.query(`SELECT name,weight FROM pokemon WHERE weight=(SELECT MAX(weight) FROM pokemon)`)
    console.log(dataOfMaxWeight[0])
    return dataOfMaxWeight[0]
}

// maxWeight()

//ex3
const findByType = async function (type) {
    let checkType = await sequelize.query(`SELECT pokemon_type.name AS type, pokemon.name AS name 
    FROM pokemon,pokemon_type
    WHERE pokemon.type=pokemon_type.id AND pokemon_type.name='${type}'
    `)
    console.log(checkType[0])
    return checkType[0]
}

// findByType("grass")

//ex4
const findOwners = async function (pokemon) {
    let trainer = await sequelize.query(`SELECT trainer.name
    FROM pokemon,trainer,pokemon_trainer
    WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id AND pokemon.name='${pokemon}'
    `)
    console.log(trainer[0])
    return trainer[0]
}

// findOwners("venusaur")

//ex5
const findRoster = async function (trainer) {
    let pokemon = await sequelize.query(`SELECT pokemon.name
    FROM pokemon,trainer,pokemon_trainer
    WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id AND trainer.name="${trainer}"
    `)
    console.log(pokemon[0])
    return pokemon[0]
}

// findRoster("Loga")

//ex6
const mostOwned = async function () {
    let top10Owned = await sequelize.query(`SELECT COUNT(*) AS count , pokemon.name
    FROM pokemon,trainer,pokemon_trainer
    WHERE pokemon.id=pokemon_trainer.p_id AND trainer.id=pokemon_trainer.t_id
    GROUP BY pokemon.name
    ORDER BY COUNT(*) DESC
    `)
    let max = 0
    let arrMax = []
    top10Owned[0].forEach(a=>{
        if(a.count>=max){
            max= a.count
            arrMax.push(a.name)
        }
    })
    console.log(arrMax)
}

mostOwned()
