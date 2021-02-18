# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
import strformat # vs joining with &
proc twoFer*(name_aleluya = "you" ): string =
  fmt"One for {name_aleluya}, one for me." 