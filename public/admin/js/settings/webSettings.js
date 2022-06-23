let submit, cbText;

document.addEventListener("DOMContentLoaded", () => {
    
    //Submit Form
    document.querySelectorAll("form#settings").forEach(form => {
        form.addEventListener("submit", e => {
            e.preventDefault();
            const obj = {
                website_title: e.currentTarget.querySelector("input#title").value,
                website_description: e.currentTarget.querySelector("textarea#description").value,
                website_keyword: e.currentTarget.querySelector("textarea#keyword").value,
                website_tagline: e.currentTarget.querySelector("input#tagline").value,
                website_url: e.currentTarget.querySelector("input#url").value,
                website_phone_number: e.currentTarget.querySelector("input#number").value,
                website_address: e.currentTarget.querySelector("input#address").value,
                website_email: e.currentTarget.querySelector("input#email").value,
                website_author: e.currentTarget.querySelector("input#author").value,
                website_currency: e.currentTarget.querySelector("input#currency").value,
                website_header_code: e.currentTarget.querySelector("textarea#header").value,
                website_footer_code: e.currentTarget.querySelector("textarea#footer").value,
                website_per_coin: e.currentTarget.querySelector("input#percoin").value,
                website_reward_name: e.currentTarget.querySelector("input#reward_name").value,
                website_facebook_code: e.currentTarget.querySelector("input#facebookcode").value,
                website_coin_secret: e.currentTarget.querySelector("input#website_coin_secret").value,
                website_coin_public: e.currentTarget.querySelector("input#website_coin_public").value,
            };

        
            submit = e.currentTarget.querySelector("button");
            fetchResourse(obj,"/admin/saved","POST","reload")
        })
    })
})