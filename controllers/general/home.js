const asyncHandler = require("../../helpers/asyncHandler");
const { getWebSettings } = require("../../helpers/settings");
const { adminGetAllMember } = require("../../helpers/user");
const { getAllWithdrawalAmountHome } = require("../../helpers/withdrawal");
const { getAllActiveMiners } = require("../../helpers/mine");


exports.homePageGet = asyncHandler(async (req, res, next) => {
    
    const { website_title } = await getWebSettings();
    
    const totalUsers = await adminGetAllMember()
    const totalWithdrawal = await getAllWithdrawalAmountHome()
    const liveMiners = await getAllActiveMiners()

    res.render("general/page/home", {
        title: website_title,
        totalUsers,
        totalWithdrawal,
        liveMiners: liveMiners.length
    })
})

