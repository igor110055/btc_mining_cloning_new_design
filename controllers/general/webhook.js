const { alertNewPlan } = require("../../email/mails/newPlan");
const { bonusInfo } = require("../../extras/bonusInfo");
const asyncHandler = require("../../helpers/asyncHandler");
const { getBonuses } = require("../../helpers/bonus");
const { creditUplineGeneration } = require("../../helpers/generation");
const { insertIntoEarningHistory } = require("../../helpers/history");
const { getPackageById } = require("../../helpers/packages");
const { getWebSettings } = require("../../helpers/settings");
const { getUserById, editUserById } = require("../../helpers/user");

//PAYID19 MERCHANT CHARGE WEBHOOK
exports.payid19PaymentWebhook = asyncHandler(async (req, res, next) => {
  //First Check If The Invoice Is Actually On The External SYstem

  const { website_coin_secret } = await getWebSettings();
  if (req.body.privatekey != website_coin_secret)
    return res.json({ status: false, message: "Private Key Not Matched" });

  //Get User For Further Interrogation
  const user = await getUserById(req.body.customer_id);

  //Get Plan
  const plan = await getPackageById(req.body.merchant_id);

  if (parseFloat(req.body.amount) >= plan.plan_price) {
    //Reward Bonus
    const bonus = await getBonuses();

    let a = {
      plan_id: plan.plan_id,
      plan_name: plan.plan_name,
      plan_mining_amount: plan.plan_mining_amount,
      plan_mining_minute: plan.plan_mining_minute,
      plan_daily_airdrop: plan.plan_daily_airdrop
    };

    if (!user.is_paid) {
      a.is_paid = 1;
      a.activities_balance = user.activities_balance + bonus.b_register_bonus || 0;
    }

    await editUserById(req.body.customer_id, a);

    //Add Earning To History
    if (!user.is_paid)
      await insertIntoEarningHistory(bonus.b_register_bonus, {
        h_user_id: req.body.customer_id,
        h_amount: bonus.b_register_bonus,
        h_text: bonusInfo.register.text,
      });

    //Send Mail
    alertNewPlan({
      fullname: user.fullname,
      email: user.email,
      ...plan,
      gateway: "Crypto",
    });

    let type = user.is_paid ? "old" : "new";

    //Reward Referral Only If This New User Have Not Paid
    if (!user.is_paid)
      await creditUplineGeneration(req.body.customer_id, plan.plan_price, type);
  }

  return res.json({ status: true, message: "Order Completed" });
});
