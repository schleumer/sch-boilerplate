index = r("/routes/index")
auth = r("/lib/auth")

module.exports = (app) ->
	app.get "/", auth, index