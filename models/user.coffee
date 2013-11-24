mongoose = require("mongoose")
schema = new mongoose.Schema(
	name: "string"
	username: "string"
	email: "string"
	password: "string"
)
module.exports = mongoose.model("User", schema)