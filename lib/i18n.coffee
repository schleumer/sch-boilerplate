_ = require("underscore")
_.str = require("underscore.string")
module.exports = (string, replaces) ->
	replaces = replaces or null
	if replaces
		_.str.sprintf.apply null, arguments_
	else
		string