const asyncHandler = require("../../helpers/asyncHandler");
const { openToken } = require("../../helpers/jwt");
const { newMine, hasActiveMine, updateUserMines, getUserCompeletedMine, getUserMinerHistory, countActiveMine } = require("../../helpers/mine");
const { addMinuteToDate, extractTime } = require("../../helpers/dateTime");
const { bonusInfo } = require("../../extras/bonusInfo");
const { getUserById } = require("../../helpers/user");
const { getNextOffset, paginateData } = require("../../helpers/pagination");

exports.mineGet = asyncHandler(async (req, res, next) => {

    //Mine Counts
    const mineCount = await getUserCompeletedMine(req.user.uid);

    const limit = req.query.limit || parseInt(process.env.LIMIT),currentPage = parseInt(req.query.page)|| 1;
    
    //Pagination VAR
    let paginationArr,link,prevBtn = null, nextBtn = null;

    const history = await getUserMinerHistory(req.user.uid, limit, getNextOffset(currentPage, limit));
    
    await history.map(eh => {
      eh.m_start_time = extractTime(eh.m_start_time, "MMM D, YYYY h:mm:ss a")
      eh.m_end_time = extractTime(eh.m_end_time, "MMM D, YYYY h:mm:ss a")
    })
    //Pagination
    const pageData = await getUserMinerHistory(req.user.uid,99999999999, 0);
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
    const url = req.originalUrl.split("?")[0];

    link = `${url}?`

    //Response Back
    return res.render("user/pages/mine", {
        title: "Mining",
        mineCount,
        history,
        activeMine: await countActiveMine(req.user.uid),
        prevBtn,
        nextBtn,
        currentPage,
        paginationArr,
        link
    })


});


exports.mineRefresh = asyncHandler(async (req, res, next) => {
    const { id } = await openToken(req.signedCookies[process.env.TOKEN_NAME]);

    //Get Active Mine
    const mine = await hasActiveMine(id);

    return res.json({ status: true, data: mine, date:new Date })
    
})

//STARTING NEW MINE
exports.mineStart = asyncHandler(async (req, res, next) => {
    const { id } = await openToken(req.signedCookies[process.env.TOKEN_NAME]);

    //Check If Have Active Mine
    const activeMine = await hasActiveMine(id);
 
    if (activeMine) return res.json({ status: false, message: "You have already active the engine" })
    
    //Complete All User Mines
    await updateUserMines(id)

    //Get User Info
    const user = await getUserById(id);
    
    const obj = {
        m_user_id: id,
        m_start_time: new Date(),
        m_end_time: addMinuteToDate(user.plan_mining_minute),
        m_seconds: user.plan_mining_minute * 60,
        m_amount: user.plan_mining_amount,
        m_text: bonusInfo.mine.text
    }
    await newMine(obj);

    return res.json({ status: true, message: "Engine Activated", data: { seconds: user.plan_mining_minute * 60, endDate: obj.m_end_time, amount: obj.m_amount } });
    
    
})