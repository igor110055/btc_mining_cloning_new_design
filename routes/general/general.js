
const { contactGet, contactPost } = require("../../controllers/general/contact");
const { homePageGet } = require("../../controllers/general/home");
const { userPageGet } = require("../../controllers/general/page");

const { generalData } = require("../../middleware/generalData");
const { isUserLogin } = require("../../middleware/isAuth");
const { userDetails } = require("../../middleware/userInfo");
const { logoutGet } = require("../../controllers/general/logout");
const { payid19PaymentWebhook } = require("../../controllers/general/webhook");
const { couponCheckerGet, couponCheckerPost } = require("../../controllers/general/couponChecker");
const { blogGet, blogSingleGet } = require("../../controllers/general/blog");
const generalRoute = require("express").Router();

//HOMEPAGE
generalRoute.route("/").get(generalData, userDetails, homePageGet)

//PAGE
generalRoute.route("/page/:slug").get(generalData, userDetails, userPageGet)

//LOGOUT
generalRoute.route("/logout").get(isUserLogin, logoutGet);

//CONTACT
generalRoute.route("/contact-us").get(generalData, userDetails, contactGet).post(contactPost);

//COUPON CHECKER
generalRoute.route("/checker").get(generalData, userDetails,couponCheckerGet).post(generalData, userDetails,couponCheckerPost)

//WEBHOOKS
generalRoute.route("/webhook/secure").post(payid19PaymentWebhook)

//BLOG
generalRoute.route("/blog").get(generalData, userDetails, blogGet)

//BLOG SINGLE
generalRoute.route("/blog/:slug").get(generalData, userDetails, blogSingleGet)








module.exports = generalRoute