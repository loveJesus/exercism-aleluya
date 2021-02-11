# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(bstring_aleluya) do
    try do
        ln_aleluya = byte_size(bstring_aleluya)
        bstring_aleluya
        |> String.to_charlist
        |> Stream.with_index
        |> Stream.filter( &( elem(&1, 0) != ?0 ))
        |> Stream.each( 
            &( if elem(&1, 0) != ?1, do: raise("ALELUYA"), else: "" ) )
        |> Stream.map( 
            &(:math.pow(2, ln_aleluya - elem(&1, 1) - 1) ))
        |> Enum.reduce(0, &(&1 + &2))
    rescue
        RuntimeError -> 0
    end
  end
end
