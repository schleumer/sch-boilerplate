#!/usr/bin/env coffee

express = require("express")
app = express()
r = require("./lib/r")
routes = require("./routes")
path = require("path")
mongoose = require("mongoose")

GLOBAL.r = r
GLOBAL.config = r("/config")
GLOBAL.__ = r("/lib/i18n")

routes = require("./config/routes")
mongoOpts =
  server:
    auto_reconnect: true

mongoose.connect "mongodb://localhost/test-boilerplate", mongoOpts
SessionStore = require("session-mongoose")(express)
store = new SessionStore(
  interval: 120000
  connection: mongoose.connection
)

app.configure "development", ->
  app.set "port", process.env.PORT or 3000
  app.set "views", path.join(__dirname, "views")
  app.set "view engine", "jade"
  app.set "view options",
    layout: false

  app.use express.cookieParser("123456")
  app.use express.session(
    store: store
    cookie: # expire session in 15 min or 900 seconds
      maxAge: 900000
  )
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.static(path.join(__dirname, "public"))
  app.use express.errorHandler()
  helpers = r("/lib/helpers")
  app.use helpers
  app.locals.pretty = true
  app.locals.basedir = path.join(__dirname, "views")
  app.use app.router
  routes app

app.on "close", ->
  console.log "Closed"

app.listen app.get("port"), ->
  console.log "Escutando em " + app.get("port")

