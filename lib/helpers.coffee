module.exports = (req, res, next) ->
	res.locals.__p = (count, singular, plural, none) ->
		count = parseInt(count or 0)
		if count <= 0
			__ none
		else if count is 1
			__ singular
		else
			__ plural

	next()