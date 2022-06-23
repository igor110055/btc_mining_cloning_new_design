const { bonusInfo } = require("../../extras/bonusInfo");
const asyncHandler = require("../../helpers/asyncHandler");
const { getBonuses } = require("../../helpers/bonus");
const { stripTextFromHtml } = require("../../helpers/dataManipulator");
const { getDateFormatForPost, extractTime } = require("../../helpers/dateTime");
const formatNumber = require("../../helpers/formatNumber");
const { insertIntoEarningHistory } = require("../../helpers/history");
const { openToken } = require("../../helpers/jwt");
const manipulateDate = require("../../helpers/manipulateDate");
const { getNextOffset, paginateData } = require("../../helpers/pagination");
const { getPostFunction, getPostBySlug, updatePostViews, getTopViewPosts, checkIfEarnOnPost, getPostById, addToSponsoredPostTrack } = require("../../helpers/post");
const { getUserById, editUserById } = require("../../helpers/user");

exports.blogGet = asyncHandler(async (req, res, next) => {
   
    const limit = req.query.limit || parseInt(process.env.LIMIT),currentPage = parseInt(req.query.page)|| 1,search = req.query.search;
    
    //Pagination VAR
    let paginationArr,link,prevBtn = null, nextBtn = null;

    const posts = await getPostFunction(search, limit, getNextOffset(currentPage, limit));
    
    await posts.map(p => {
        p.date = extractTime(p.post_created_at,"D")
        p.month = extractTime(p.post_created_at,"MMM")
        p.post_views = formatNumber(p.post_views);

        //Truncating
        const stripText = stripTextFromHtml(p.post_description);
        p.short_des = stripText.substr(0, 80) + "..."
      
    });

    //POPULAR POST
    const popular = await getTopViewPosts(10, 0);
    await popular.map(p => p.post_created_at = manipulateDate(p.post_created_at));

    
    //Pagination
    const pageData = await getPostFunction(search, 9999999999, 0);
    paginationArr = paginateData(limit, pageData.length);
  
    //Prev
    if (currentPage > 1) {
        prevBtn = currentPage - 1;
    }

    //Next
    if (currentPage !== "" && paginationArr[paginationArr.length - 1] > currentPage) {
        nextBtn = currentPage + 1
    };


    //Pagination Link
    if (search) link = `/blog?search=${search}&`
    else link = `/blog?`

    res.render("general/page/blog/bloglist", {
        title: "Sponsored Posts",
        posts,
        popular,
        prevBtn,
        nextBtn,
        currentPage,
        paginationArr,
        link
    })
})


//GET SINGLE BLOGPOST
exports.blogSingleGet = asyncHandler(async (req, res, next) => {
   
    
    const post = await getPostBySlug(req.params.slug);
    
    if (!post) return res.render("error/error", {
        title: "Post Not Found",
        text: "The post you are looking for might have been moved to another address or has been deleted"
    })
    
    await updatePostViews(post.post_id);

    //Manipulate Data
    post.date = extractTime(post.post_created_at,"D")
    post.month = extractTime(post.post_created_at,"MMM")
    post.post_created_at = getDateFormatForPost(post.post_created_at);
    post.post_views2 = formatNumber(post.post_views);

    //POPULAR POST
    const popular = await getTopViewPosts(10, 0);
    await popular.map(p => p.post_created_at = manipulateDate(p.post_created_at));

    res.render("general/page/blog/blogSingle", {
        title: post.post_title,
        post,
        popular
    })
})



//USER SHARE
exports.blogSharePost = asyncHandler(async (req, res, next) => {
   
    const { id } = await openToken(req.signedCookies[process.env.TOKEN_NAME]);

    //CHeck if has already earn on it
    const hasAlreadyEarn = await checkIfEarnOnPost(req.body.id, id);
    
    if (hasAlreadyEarn) return res.json({ status: false, message: "You have already earn reward on this post" })
    
    //Check If Post Is Earnable
    const post = await getPostById(req.body.id);
    if (!post) return res.json({ status: false, message: "Post Not Found" });
    if (!post.post_earnable) return res.json({ status: false, message: "Post Is Not Earnable" });
    

    //Reward Bonus
    const { b_share_bonus } = await getBonuses();
    const { activities_balance } = await getUserById(id);

    await editUserById(id, {
        activities_balance: activities_balance + b_share_bonus
    });

    //Assign To Earning History
    await insertIntoEarningHistory(b_share_bonus, {
        h_user_id: id,
        h_amount: b_share_bonus,
        h_text: bonusInfo.click.text
    });
    
    await addToSponsoredPostTrack({
        t_post_id: req.body.id,
        t_user_id: id
    });

    //Reponse To User
    return res.json({ status: true, message: "Reward Earned" })
    
})