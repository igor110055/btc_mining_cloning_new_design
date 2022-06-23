const { getRandomID } = require("../../helpers/uniqueID");
const asyncHandler = require("../../helpers/asyncHandler");
const { fetcher } = require("../../helpers/fetcher");
const { couponPay } = require("../../helpers/gateway");
const { openToken } = require("../../helpers/jwt");
const { getPackages,getPackageById } = require("../../helpers/packages");
const { getWebSettings } = require("../../helpers/settings");
const { getUserById } = require("../../helpers/user");

//PACKAGE (GET)
exports.packagesListGet = asyncHandler(async (req, res, next) => {
    
    const packages = await getPackages();

    return res.render("user/pages/package/package", {
        title: "Subscription Plans",
        packages
    })

})

//PACKAGE (PUT)
exports.packagesListPut = asyncHandler(async (req, res, next) => {
    const { id } = await openToken(req.signedCookies[process.env.TOKEN_NAME]);

    if (req.body.gateway === "coupon") {
        try {
            await couponPay(id, req.body.code, req.body.plan);
            return res.json({ status: true, message: "Action Successfully", goto: "/user/dashboard" })
            
        } catch (error) {
            return res.json({ status: false, message: new Error(error).message })

            
        }
    } else if (req.body.gateway === "crypto") {

        //Get Plan Details
        const plan = await getPackageById(req.body.plan);
        
        if(!plan) return res.json({ status: false, message: "Plan Not Found"});

        const { website_coin_public, website_coin_secret,website_currency,website_url } = await getWebSettings();

        const randomId = getRandomID(6)
        const homeUrl = req.protocol + "://" + req.get('host');
        const user = await getUserById(id);
        
        fetcher({
            "public_key": website_coin_public,
            "private_key": website_coin_secret,
            "price_amount": plan.plan_price,
            "order_id": randomId,
            "title": `${plan.plan_name} Subscription`,
            "description" : `${plan.plan_name} Subscription At ${website_currency}${plan.plan_price.toLocaleString()} `,
            "email": user.email,
            "merchant_id": req.body.plan,
            "customer_id": id,
            "add_fee_to_price": 0,
            "cancel_url": `${website_url}/user/dashboard`,
            "success_url": `${website_url}/user/dashboard`,
            "callback_url": `${homeUrl}/webhook/secure`,
            "expiration_date": 64
        },"https://payid19.com/api/v1/create_invoice","POST").then(async result =>{


            if(result.status != "success") {
                return res.json({ status: false, message:result.message[0]})
            }

            return res.json({ status:true, message:"Invoice generated", text:"Click OK to continue", goto:result.message})
        }).catch(async err =>{
            
            return res.json({status: true, message:err.message})
        })

       
    } else {
        return res.json({ status: false, message: "Invalid Paramater" })
    }
    

})

