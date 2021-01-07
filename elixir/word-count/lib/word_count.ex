# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map  

  def add_map_aleluya("", map_aleluya) do 
    map_aleluya 
  end

  def add_map_aleluya(word_aleluya, map_aleluya) do
    Map.update( 
      map_aleluya,
      word_aleluya, 
      1, 
      fn oval_aleluya -> oval_aleluya + 1 end)
  end

  def count(sentence_aleluya) do
    words_aleluya = 
      sentence_aleluya 
      |> String.downcase
      |> String.replace(~r/_/, " ")
      |> String.replace(~r/[!&:@$%^&,.]/, "")
      |> String.split(" ")

    List.foldl( words_aleluya, %{}, &add_map_aleluya/2)
  end
end
