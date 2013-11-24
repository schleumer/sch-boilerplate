User = r("/models/user")
crypto = require("crypto")
exports.login = (req, res) ->
	res.render "users/login"

exports.doLogin = (req, res) ->
	m = crypto.createHash("md5")
	m.update req.body.password
	pass = m.digest("hex")
	User.find
		username: req.body.username
		password: pass, (err, data) ->
			if data.length
				req.session.user = data[0].toObject()
				res.redirect "/"
			else
				res.redirect "/login"
