defmodule BeanSong do
  @doc """
  Get a single verse of the bean song
  """
  @spec verse(integer) :: String.t()

  def verse(number_aleluya) when number_aleluya == 0 do    
    "No more bottles of beans on the wall, no more bottles of beans.\n" <>
    "Go to the store and buy some more, 99 bottles of beans on the wall.\n"
  end

  def verse(number_aleluya) when number_aleluya == 1 do
    "1 bottle of beans on the wall, 1 bottle of beans.\n" <>
    "Take it down and pass it around, no more bottles of beans on the wall.\n"
  end

  def verse(number_aleluya) when number_aleluya == 2 do
    "2 bottles of beans on the wall, 2 bottles of beans.\n" <>
    "Take one down and pass it around, 1 bottle of beans on the wall.\n"
  end

  def verse(number_aleluya) do
    strn_aleluya = Integer.to_string(number_aleluya)
    strnm_aleluya = Integer.to_string(number_aleluya - 1)     
    "#{strn_aleluya} bottles of beans on the wall, #{strn_aleluya} bottles of beans.\n" <>
    "Take one down and pass it around, #{strnm_aleluya} bottles of beans on the wall.\n"    
  end

  @doc """
  Get the entire bean song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range_aleluya) do
    Enum.join(
      Enum.map(range_aleluya, &BeanSong.verse/1),
      "\n")
  end

  @spec lyrics() :: String.t()
  def lyrics() do
    BeanSong.lyrics(99..0)
  end
end
