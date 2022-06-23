const asyncHandler = require("../../helpers/asyncHandler");
const { getDateFormatForPost } = require("../../helpers/dateTime");
const { getPageBySlug } = require("../../helpers/page");


exports.userPageGet = asyncHandler(async (req, res, next) => {
    
    const page = await getPageBySlug(req.params.slug);
 
    if (!page) return res.render("error/error", {
        title: "Page Not Found",
        text: "The page you are looking for might have been moved to another address or has been deleted"
    })

    page.page_created_at = getDateFormatForPost(page.page_created_at);

    return res.render("general/page/page", {
        title: page.page_title,
        page
    })
    
})
