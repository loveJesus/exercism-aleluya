# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class Bob
  hey: (args_aleluya) ->
  	resp_aleluya =
  		fine_aleluya : "Fine. Be that way!"
  		whatever_aleluya : "Whatever."
  		whoa_aleluya : "Whoa, chill out!"
  		sr_aleluya : "Sure."

  	return resp_aleluya.fine_aleluya if args_aleluya.trim() == ""
  	return resp_aleluya.whatever_aleluya if args_aleluya.match(/^[^a-zA-Z]+$/)
  	return resp_aleluya.whoa_aleluya if args_aleluya.toUpperCase() == args_aleluya
  	return resp_aleluya.sr_aleluya if args_aleluya.trim().slice(-1) == "?"
  	return resp_aleluya.whatever_aleluya

module.exports = Bob
