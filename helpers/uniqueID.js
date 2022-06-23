const uuid = require("uuid-random");

exports.getUniqueID = () => {
    const ID = uuid().split("-");
    if (ID[4]) {
        return ID[4]
    } else {
        return ID[0]
    }
}


exports.getRandomNumber = (limit) => {
    let result = "";
    for (i = 0; i < limit; i++){
        result += Math.floor(Math.random() * 10)
    };

    return result;

}

exports.getRandomID = (limit) => {
    let result = "";
    let ext = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    for (i = 0; i < limit; i++){
        result += ext[Math.floor(Math.random() * ext.length)]
    };

    return result;

}