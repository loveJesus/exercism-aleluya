defmodule SodaSong do
  @doc """
  Get a single verse of the soda song
  """
  @spec verse(integer) :: String.t()

  def verse(0), do: """
    No more bottles of soda on the wall, no more bottles of soda.
    Go to the store and buy some more, 99 bottles of soda on the wall.
    """  

  def verse(1), do: """
    1 bottle of soda on the wall, 1 bottle of soda.
    Take it down and pass it around, no more bottles of soda on the wall.
    """

  def verse(2), do: """
    2 bottles of soda on the wall, 2 bottles of soda.
    Take one down and pass it around, 1 bottle of soda on the wall.
    """
  
  def verse(number_aleluya), do: """
    #{number_aleluya} bottles of soda on the wall, #{number_aleluya} bottles of soda.
    Take one down and pass it around, #{number_aleluya - 1} bottles of soda on the wall.
    """
  
  @doc """
  Get the entire soda song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()  ) :: String.t()
  def lyrics(range_aleluya \\ 99..0) do
    Enum.map_join(range_aleluya, "\n", &SodaSong.verse/1)
  end
end
