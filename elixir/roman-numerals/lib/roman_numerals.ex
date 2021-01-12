# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.

defmodule RomanNumerals do
  # Hallelujah - List of Tuples with (Numeral String, Numeral value int)
  defp numerals_aleluya do
    [ {"M", 1000}, {"CM", 900}, 
      {"D", 500}, {"CD", 400},
      {"C", 100}, {"XC", 90},
      {"L", 50}, {"XL", 40},
      {"X", 10}, {"IX", 9},
      {"V", 5}, {"IV", 4},
      {"I", 1}]
  end


  # Hallelujah Return tuple with (Decreased value int, Numeral used to decrease string)
  defp numeraldec_aleluya(0) do
    nil
  end

  defp numeraldec_aleluya(number_aleluya) do
    {fstr_aleluya, fval_aleluya} = 
      Enum.find( 
        numerals_aleluya(), 
        fn( {_char_aleluya, val_aleluya} ) ->          
          val_aleluya <= number_aleluya
        end)          

    {number_aleluya - fval_aleluya, fstr_aleluya}

  end

  # Hallelujah - Recursive main working fn for numeral
  defp numeral_make_aleluya(numleft_aleluya, curstr_aleluya) do
    case numeraldec_aleluya(numleft_aleluya) do
      {nextnum_aleluya, nextchar_aleluya} -> 
        numeral_make_aleluya(
          nextnum_aleluya,
          curstr_aleluya <> nextchar_aleluya)

      nil -> curstr_aleluya
    end
  end

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  # Hallelujah Return string of Roman numeral value of number_aleluya
  def numeral(number_aleluya) do
    numeral_make_aleluya(
      number_aleluya,
      "")
  end

end
