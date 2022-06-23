const { deleteUnverfiedUser, resetClaimAirdrop } = require("../helpers/user");
const CronJob = require('cron').CronJob;

//This Job Running Every Week
new CronJob('0 0 * * 0', async function () {

    await deleteUnverfiedUser()

}, null, true, "Africa/Lagos");

//This Job Running Every 1 Oclocl Midnight
new CronJob('0 1 * * *', async function () {

    await resetClaimAirdrop()

}, null, true, "Africa/Lagos");
