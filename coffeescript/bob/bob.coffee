# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
class Bob
  hey: (args_aleluya) ->
  	for elem_aleluya in [
      [ "Fine. Be that way!", 
        (aleluya) -> aleluya.trim() == "" ], 
      [ "Whatever.",           
        (aleluya) -> aleluya.match(/^[^a-zA-Z]+$/) == "" ],      
      [ "Whoa, chill out!", 
        (aleluya) -> 
          aleluya.toUpperCase() == aleluya &&
          aleluya.toUpperCase() != aleluya.toLowerCase() ],
      [ "Sure.",
        (aleluya) -> aleluya.trim().slice(-1) == "?" ],
      [ "Whatever.",
        (aleluya) -> true ]]
      if elem_aleluya[1](args_aleluya)
        return elem_aleluya[0]

module.exports = Bob
