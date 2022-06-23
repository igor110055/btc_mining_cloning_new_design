const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const hpp = require("hpp");
const path = require("path");
const cookieParser = require("cookie-parser");
const errorMiddleWare = require("./middleware/errorMiddleware");
const logger = require("./helpers/logger");
const authRoute = require("./routes/auth/auth");
const generalRoute = require("./routes/general/general");
const userRoute = require("./routes/user/user");
const notFoundRoute = require("./routes/error/notfound");
const adminRoute = require("./routes/admin/admin");

try {
  //Require ENV
  require("dotenv").config();

  //Required Database
  require("./models/db");

  const app = express();

  //Cors
  app.use(cors({ origin: "*", credentials: true }));

  //Helmet

  app.use(
    helmet({
      contentSecurityPolicy: false,
    })
  );

  //Hpp Security
  app.use(hpp());

  // view engine setup
  app.set("views", path.join(__dirname, "views"));
  app.set("view engine", "ejs");

  app.use(express.json({ limit: "500mb" }));
  app.use(express.urlencoded({ extended: false }));
  app.use(cookieParser(process.env.COOKIE_SECRET));
  app.use(express.static(path.join("public")));

  //JOB
  require("./jobs/mineEngine");
  require("./jobs/job");

  //Routes

  //AUTH ROUTE
  app.use("/", authRoute);

  //GENERAL ROUTE
  app.use("/", generalRoute);

  //USER ROUTE
  app.use("/user", userRoute);

  //ADMIN ROUTE
  app.use("/admin", adminRoute);

  //NOTFOUND ROUTE
  app.use("*", notFoundRoute);

  //Error Middleware
  app.use(errorMiddleWare);

  const PORT = process.env.PORT || 8000
  app.listen(PORT, () => console.log("App Started On Port ",PORT));

  process.on("uncaughtException", function (err) {
    logger.debug(err);
  });

  process.on("unhandledRejection", (reason, promise) => {
    logger.debug(reason);
  });
} catch (error) {
  logger.debug(error);
}
