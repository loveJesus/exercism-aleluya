# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """

  @spec to_rna([char]) :: [char]
  def to_rna(dnaleluya) do
  	Enum.map(dnaleluya, fn(aleluya) -> %{?G=>?C, ?C=>?G, ?T=>?A, ?A=>?U}[aleluya] end)
  end
end
# Hallelujah