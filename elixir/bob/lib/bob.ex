# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
defmodule Bob do
  def is_question_trimmed_aleluya(input_aleluya) do
    String.ends_with?(input_aleluya, "?")
  end

  def is_blank_trimmed_aleluya(input_aleluya) do
    String.length(input_aleluya) == 0
  end 

  def is_shouting_trimmed_aleluya(input_aleluya) do
    ucase_aleluya = String.upcase(input_aleluya)
    dcase_aleluya = String.downcase(input_aleluya)
    ucase_aleluya == input_aleluya and ucase_aleluya != dcase_aleluya
  end

  def hey(input_aleluya) do
    trimmed_aleluya = String.trim(input_aleluya)

    cond do
      is_blank_trimmed_aleluya(trimmed_aleluya) -> 
        "Fine. Be that way!"
      is_shouting_trimmed_aleluya(trimmed_aleluya) ->
        if is_question_trimmed_aleluya(trimmed_aleluya) do
          "Calm down, I know what I'm doing!"
        else
          "Whoa, chill out!"
        end
      is_question_trimmed_aleluya(trimmed_aleluya) -> 
        "Sure."
      true -> 
        "Whatever."
    end
  end
end

# Matthew 18:3 And said, Verily I say unto you, 
# Except ye be converted, and become as little children, 
# ye shall not enter into the kingdom of heaven. /kjv

