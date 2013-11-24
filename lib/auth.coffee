async = require("async")
module.exports = (err, req, res, next) ->
	async.waterfall [(callback) ->
		unless "user" in req.session
			res.redirect "/login"
			next()
		else
			res.locals.user = req.session.user
			next()
	]