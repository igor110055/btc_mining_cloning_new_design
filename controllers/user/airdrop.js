const asyncHandler = require("../../helpers/asyncHandler");
const { insertIntoEarningHistory } = require("../../helpers/history");
const { editUserById } = require("../../helpers/user");
const { getPackageById } = require("../../helpers/packages");
const { bonusInfo } = require("../../extras/bonusInfo");

//USER AIRDROP
exports.userAirdropPost = asyncHandler(async (req, res, next) => {
    
    if(!req.user.can_claim_airdrop) return res.json({ status: false, message:"You've recently claim Airdrop",text:"Claim it again after 24hrs"});

    //Get User Plan
    const plan = await getPackageById(req.user.plan_id);
    if(!plan) return res.json({ status: false, message: "Plan Not Found",text:"Subscribe to a Plan, before you can claim airdrop"});

    await editUserById(req.user.uid, { can_claim_airdrop: 0, activities_balance: req.user.activities_balance + req.user.plan_daily_airdrop })

    //Insert Into History
    await insertIntoEarningHistory(req.user.plan_daily_airdrop,{
        h_user_id: req.user.uid,
        h_amount: req.user.plan_daily_airdrop,
        h_text: bonusInfo.airDrop.text
    });

    return res.json({status:true, message:"Airdrop Claimed Successfully",text:"Claim it again after 24hrs"});

})