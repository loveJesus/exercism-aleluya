# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.


defmodule Markdown do
  # Praise Jesus, we use state to hold whether we have started a ul
  # The previous implementation would fail if starting a header after
  # a list and then another list.
  # Another thing of note is try to make the variables more descriptive 
  # and praise the Lord
  defmodule StateAleluya do
    @type pstatus_aleluya :: :void_aleluya | :ul_aleluya
    defstruct status_aleluya: :void_aleluya, parsed_lines_aleluya: []    
  end

  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(input_aleluya) do
    String.split(input_aleluya, "\n")
    |> Enum.reduce( 
        %StateAleluya{}, # Hold state down the line to keep opened ul status
        fn line_aleluya, state_aleluya -> 
          process_aleluya(line_aleluya, state_aleluya) end)
    |> finish_aleluya
  end

  defp process_aleluya(in_line_aleluya, state_aleluya) do
    # First element indicates if it becomes nil, indicates it was already processed
    {in_line_aleluya, state_aleluya}
    |> process_header_aleluya
    |> process_list_aleluya
    |> process_paragraph_aleluya
    |> elem(1)
  end
  
  defp process_header_aleluya(qline_aleluya = {nil, _}), do: qline_aleluya
  defp process_header_aleluya(
    qline_aleluya = 
      { line_aleluya, 
        %StateAleluya{
          status_aleluya: listatus_aleluya, 
          parsed_lines_aleluya: output_aleluya} } )  do
    # Check if we are a header, if so close any pending ul, transform line and return state
    if String.starts_with?(line_aleluya, "#") do
      { nil,
        %StateAleluya{ 
          status_aleluya: :void_aleluya, 
          parsed_lines_aleluya:  
            [( (if listatus_aleluya == :ul_aleluya, do: "</ul>", else: "") <>
              (line_aleluya |> parse_header_md_level_aleluya |> enclose_with_header_tag_aleluya)) 
            | output_aleluya] }}
    else
      qline_aleluya
    end
  end
  
  defp process_list_aleluya(qline_aleluya = {nil, _}), do: qline_aleluya
  defp process_list_aleluya(
    qline_aleluya = 
      { line_aleluya, 
        %StateAleluya{
          status_aleluya: listatus_aleluya, 
          parsed_lines_aleluya: output_aleluya} } ) do
    # Check if we are a list item, if so open any pending ul, transform line and return state
    if String.starts_with?(line_aleluya, "*") do
      { nil,
        %StateAleluya{ 
          status_aleluya: :ul_aleluya,
          parsed_lines_aleluya:             
            [((if listatus_aleluya == :void_aleluya, do: "<ul>", else: "") <>
            parse_list_md_level_aleluya(line_aleluya)) 
            | output_aleluya] }}
    else
      qline_aleluya
    end
  end
  
  defp process_paragraph_aleluya(qline_aleluya = {nil, _}), do: qline_aleluya
  defp process_paragraph_aleluya(
    { line_aleluya, 
      %StateAleluya{
        status_aleluya: listatus_aleluya, 
        parsed_lines_aleluya: output_aleluya} }  ) do
    # If here assume we are a paragraph, so close any pending ul, transform line and return state
    { nil,
      %StateAleluya{ 
        status_aleluya: :void_aleluya, 
        parsed_lines_aleluya: 
          [((if listatus_aleluya == :ul_aleluya, do: "</ul>", else: "") <>
          enclose_with_paragraph_tag_aleluya(line_aleluya)) 
          | output_aleluya] }}
  end

  # Join the related methods a little bit better Hallelujah
  defp parse_header_md_level_aleluya(header_line_aleluya) do
    [hd_aleluya | tl_aleluya] = String.split(header_line_aleluya)
    {String.length(hd_aleluya), Enum.join(tl_aleluya, " ")}
  end

  defp enclose_with_header_tag_aleluya({level_aleluya, text_aleluya}) do
    # Attempt to use the string templating builtins
    "<h#{level_aleluya}>#{text_aleluya}</h#{level_aleluya}>"
  end

  defp parse_list_md_level_aleluya(list_line_aleluya) do
    trimmed_line_aleluya = String.trim_leading(list_line_aleluya, "* ")
    "<li>#{join_words_with_tags_aleluya(trimmed_line_aleluya)}</li>"
  end

  # Try to use a group of regex for the inner transforms over whole line
  # Instead of word by word
  defp join_words_with_tags_aleluya(words_aleluya) do
    aleluya = Regex.replace( ~r/_{2}(\w)/, words_aleluya, "<strong>\\1")
    aleluya = Regex.replace( ~r/(\w)_{2}/, aleluya, "\\1</strong>")
    aleluya = Regex.replace( ~r/_{1}(\w)/, aleluya, "<em>\\1")
    Regex.replace( ~r/(\w){1}_{1}/, aleluya, "\\1</em>")    
  end

  defp enclose_with_paragraph_tag_aleluya(p_line_aleluya) do
    "<p>#{join_words_with_tags_aleluya(p_line_aleluya)}</p>"
  end

  defp finish_aleluya(
    %StateAleluya{
      status_aleluya: listatus_aleluya, 
      parsed_lines_aleluya: output_aleluya}) do
    # Join the lines and close any possible last </ul>
    (output_aleluya
    |> Enum.reverse
    |> Enum.join)
    <> (if listatus_aleluya == :ul_aleluya, 
      do:   "</ul>", 
      else: "")
  end  

end
