const nodemailer = require("nodemailer")
const transporter = nodemailer.createTransport({
  service: 'gmail',
  secureConnection: true,
  auth: {
    user: 'dextraptech@gmail.com',
    pass: 'gluoueebojykfcbe'
      },
  tls: {
      rejectUnauthorized: false
    },
});

module.exports = transporter


