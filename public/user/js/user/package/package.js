let submit, cbText;

document.addEventListener("DOMContentLoaded", () => {

    //Saving Plan Once Clicked
    document.querySelectorAll("a#subscribeBtn").forEach(btn => {
        btn.addEventListener("click", e => window.currentPlan = e.currentTarget.dataset.id)
    })


    //Coupon Gateway
    document.querySelector("form#couponMode").addEventListener("submit", e => {
        e.preventDefault();
        const obj = {
            code: e.currentTarget.querySelector("input").value,
            plan: window.currentPlan,
            gateway: "coupon"
        }

        submit = e.currentTarget.querySelector("button#submit");
        fetchResourse(obj, "/user/packages", "PUT", undefined, true)

    })
    
    //Crypto Gateway
    window.cryptoGateway = async function(btn){
        const obj = {
            plan: window.currentPlan,
            gateway: "crypto"
        }

        submit = btn;
        await fetchResourse(obj, "/user/packages", "PUT", undefined, true)
    }


})

