const { type } = require('os')
const Sequelize = require('sequelize')
const sequelize = new Sequelize('mysql://root:@localhost/sql_pokemon')
const data = require('./pokemon.json')

const addType = async function (array) {
    const obj = {}
    array.forEach(i => {
        if (!obj[i.type]) {
            obj[i.type] = i.type
        }
    })
    const typesArr = Object.keys(obj)
    await typesArr.forEach(type => {
        let typePokemon = sequelize.query(`INSERT INTO pokemon_type VALUES(null,'${type}')`)
        console.log(typePokemon)
    })
}

// addType(data)


const town = async function (array) {
    const townObj = {}
    array.forEach(t => {
        if (t.ownedBy) {
            t.ownedBy.forEach(o => {
                if (!townObj[o.town]) {
                    townObj[o.town] = o.town
                }
            })
        }
    })
    const keys = Object.keys(townObj)
    await keys.forEach(town => {
        let addingTowns = sequelize.query(`INSERT INTO town VALUES(null,'${town}')`)
        console.log(addingTowns)
    })

}
// town(data)

const trainer = async function (array) {
    const objTrainer = {}
    const arrTrainer = []
    let town = await sequelize.query(`SELECT * FROM town`)
    array.forEach(t => {
        t.ownedBy.forEach(n => {
            if (!objTrainer[n.name]) {
                let obj = {
                    name: n.name,
                    town: n.town,
                    id: 0
                }
                arrTrainer.push(obj)
            }
        })
    });
    town[0].forEach(i => {
        arrTrainer.forEach(j => {
            if (i.name == j.town) {
                j.id = i.id
            }
        })
    });
    const newArray = [];
    const uniqueObject = {};
    for (let i in arrTrainer) {
        objTitle = arrTrainer[i].name;
        uniqueObject[objTitle] = arrTrainer[i];
    }
    for (i in uniqueObject) {
        newArray.push(uniqueObject[i]);
    }
    newArray.forEach(i => {
        let addingTowns = sequelize.query(`INSERT INTO trainer2 VALUES(null,'${i.name}','${i.id}')`)
        console.log(addingTowns)
    });

}

// trainer(data)


const pokemon = async function (array) {
    let typePokemon = await sequelize.query(`SELECT * FROM pokemon_type`)
    array.forEach(p => {
        typePokemon[0].forEach(t => {
            if (t.name == p.type) {
                p.type = t.id
                let pokeInsert = sequelize.query(`INSERT INTO pokemon VALUES(${p.id},'${p.name}',${p.type},${p.height},${p.weight})`)
                console.log(pokeInsert)
            }
        })
    });
}
// pokemon(data)

const pokemonAndTrainer = async function (array) {
    const arrPokemonNTrainer = []
    array.forEach(p => {
        p.ownedBy.forEach(t => {
            arrPokemonNTrainer.push({ p_id: p.id, t_name: t.name })
        })
    })
    await arrPokemonNTrainer.forEach(pt => {
        try {
            let ptData = sequelize.query(`INSERT INTO pokemon_trainer VALUES
            ((SELECT id FROM pokemon 
                WHERE id=${pt.p_id}),(SELECT id FROM trainer WHERE name='${pt.t_name}'))`)
            console.log(ptData)
        } catch (err) {
            console.log(err)
        }
    })
}
pokemonAndTrainer(data)


