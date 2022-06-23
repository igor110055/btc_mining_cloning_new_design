const asyncHandler = require("../helpers/asyncHandler");
const logger = require("../helpers/logger");
const db = require("../models/db");


exports.generalData = asyncHandler(async(req, res, next) => {
    
    db.query("SELECT * FROM f_website_settings", async (err, datas) => {
        if (err) {
            logger.debug(err)
        } else {
            let data = datas[0];

            res.locals.shortUrl = req.originalUrl
            res.locals.longUrl = req.protocol + "://" + req.get('host') + req.originalUrl
            res.locals.homeUrl = req.protocol + "://" + req.get('host');
            
            //UI Mode
            res.locals.mode = req.cookies["is_visited"];

            res.locals.websiteDetails = data;

            res.locals.shortDesc = null
            res.locals.isPost = false
            res.locals.user = null
            res.locals.title = ""
            res.locals.description = ""
            
            next()
        }
    })
    
})