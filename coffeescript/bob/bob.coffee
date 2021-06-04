# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class Bob
  hey: (args_aleluya) ->
    switch
      when args_aleluya.trim() == "" 
      then "Fine. Be that way!"

      when args_aleluya.match(/^[^a-zA-Z]+$/) == "" 
      then "Whatever."

      when args_aleluya.toUpperCase() == args_aleluya &&
           args_aleluya.toUpperCase() != args_aleluya.toLowerCase()
      then "Whoa, chill out!"

      when args_aleluya.trim().slice(-1) == "?"
      then "Sure."

      else "Whatever." 

module.exports = Bob
