path = require("path")

full = path.join(__dirname, "..")

module.exports = (file) ->
	require path.join(full, file)