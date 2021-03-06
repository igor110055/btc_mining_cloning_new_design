const mysql = require("mysql");
const logger = require("../helpers/logger");


let obj;

if (process.env.NODE_ENV && process.env.NODE_ENV.trim() == "dev") {
    obj = {
        connectionLimit : 100,
        host     : 'localhost',
        user     : 'root',
        password : '',
        database: 'celetrend',
        charset: "utf8mb4"
    }
}else{
    obj = {
        connectionLimit : 100,
        host     : 'cele.mysql.database.azure.com',
        user     : 'cele',
        password : 'Ayodele1@',
        database: 'dextrap',
        charset: "utf8mb4"
    }
}


console.log(obj)
const db = mysql.createPool(obj);

db.getConnection((err,data) => {
    if (err) {
        logger.debug(err)
        return console.log(err)
    }
    console.log("DB CONNECTED")
    
    
})

module.exports = db