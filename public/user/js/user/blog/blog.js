let submit, cbText;

document.addEventListener("DOMContentLoaded", () => {

    //CHECKING IF COMING FROM FACEBOOK
  
    if (document.referrer.includes("facebook") && window.location.hash.includes("_=_")) {
        const obj = {
            id: localStorage.getItem("share_id")
        }
        window.postShare(JSON.stringify(obj))
        
    }
    

    //FACEBOOK SHARE
    window.facebookShare = function (postId,faebookCode,blogUrl,homeurl) {
        
        localStorage.setItem("share_id", postId);
            
        let url = `https://www.facebook.com/dialog/share?app_id=${faebookCode}&display=popup&href=${blogUrl}&redirect_uri=${homeurl}/user/dashboard`


        window.location.href = url;
        
    }
    
    //WHATSAPP SHARE
    window.whatsappShare = function (postId,title,url) {
 
        postShare({id:postId});

        window.open(`https://api.whatsapp.com/send?text=${title} - ${url}`)
        
    }
    
    //TWITTER SHARE
    window.twitterShare = function (postId,title,url) {
 
        postShare({id:postId});

        window.open(`https://twitter.com/share?url=${url}&text=${title}`)
        
    }

    


    
})


window.postShare = function (id) {
  if (!userId) return;

  submit = document.querySelector("button#Load")
  fetchResourse(id, "/user/share", "POST", "nothing",true);
};