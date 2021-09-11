# For God so loved the world, that He gave His only begotten Son, that all who believe in Him should not perish
# But have everlasting life
defmodule Forth do

  defmodule StackAleluya do
    defstruct sl_aleluya: [],
              curw_aleluya: ""
    @type t_aleluya :: %StackAleluya {
      sl_aleluya: List.t(),
      curw_aleluya: String.t()
    }
  end

  defmodule EvaluatorAleluya do
    defstruct number_aleluya: 1,              
              status_aleluya: :new_aleluya,
              rlist_aleluya: [],
              list_aleluya: []              

    @type t_aleluya :: %EvaluatorAleluya{
      number_aleluya: integer,
      rlist_aleluya: List.t(),
      list_aleluya: List.t(),  
      status_aleluya:
        :new_aleluya 
        | :second_throw_aleluya           
      }
  end

  @opaque evaluator :: EvaluatorAleluya.t_aleluya

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %EvaluatorAleluya{}
  end


  @doc """
  Internal, parse a string into a List, Hallelujah
  """
  @spec parse_aleluya(String.t()) :: List.t()
  defp parse_aleluya(s_aleluya) do
    s_aleluya 
    |> String.replace(~r/[^-\w*+\/]/," ")
    |> String.replace(~r/[\xE1 ]+/," ")
    |> String.split(" ") 
  end

  @spec evalstep_aleluya(evaluator, List.t()) :: evaluator

  defp evalstep_aleluya(ev_aleluya = %EvaluatorAleluya{ rlist_aleluya: [o2_aleluya | [o1_aleluya | rtl_aleluya]] }, [hd_aleluya | tl_aleluya]) when hd_aleluya == "+"  do
    result_aleluya = to_string(String.to_integer(o1_aleluya) + String.to_integer(o2_aleluya))
    nrlist_aleluya = [result_aleluya | rtl_aleluya]
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: nrlist_aleluya}
    evalstep_aleluya(nev_aleluya, tl_aleluya)
  end

  defp evalstep_aleluya(ev_aleluya = %EvaluatorAleluya{ rlist_aleluya: [o2_aleluya | [o1_aleluya | rtl_aleluya]] }, [hd_aleluya | tl_aleluya]) when hd_aleluya == "-" do
    result_aleluya = to_string(String.to_integer(o1_aleluya) - String.to_integer(o2_aleluya))
    nrlist_aleluya = [result_aleluya | rtl_aleluya]
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: nrlist_aleluya}
    evalstep_aleluya(nev_aleluya, tl_aleluya)
  end

  defp evalstep_aleluya(ev_aleluya = %EvaluatorAleluya{ rlist_aleluya: [o2_aleluya | [o1_aleluya | rtl_aleluya]] }, [hd_aleluya | tl_aleluya]) when hd_aleluya == "*"  do
    result_aleluya = to_string(String.to_integer(o1_aleluya) * String.to_integer(o2_aleluya))
    nrlist_aleluya = [result_aleluya | rtl_aleluya]
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: nrlist_aleluya}
    evalstep_aleluya(nev_aleluya, tl_aleluya)
  end

  defp evalstep_aleluya(ev_aleluya = %EvaluatorAleluya{ rlist_aleluya: [o2_aleluya | [o1_aleluya | rtl_aleluya]] }, [hd_aleluya | tl_aleluya]) when hd_aleluya == "/" do
    result_aleluya = to_string(trunc(String.to_integer(o1_aleluya) / String.to_integer(o2_aleluya)))
    nrlist_aleluya = [result_aleluya | rtl_aleluya]
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: nrlist_aleluya}
    evalstep_aleluya(nev_aleluya, tl_aleluya)
  end

  defp evalstep_aleluya(ev_aleluya, [hd_aleluya | tl_aleluya]) do
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: [ hd_aleluya | ev_aleluya.rlist_aleluya]}
    evalstep_aleluya(nev_aleluya, tl_aleluya)
  end

  defp evalstep_aleluya(ev_aleluya, []) do
    %EvaluatorAleluya{ev_aleluya | list_aleluya: Enum.reverse(ev_aleluya.rlist_aleluya) }
  end

  @spec evalsteps_aleluya(evaluator, List.t() ) :: evaluator
  defp evalsteps_aleluya(ev_aleluya, steps_aleluya) do
    nev_aleluya = %EvaluatorAleluya{ev_aleluya | rlist_aleluya: []}
    evalstep_aleluya(nev_aleluya, steps_aleluya)
  end



  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t()) :: evaluator
  def eval(ev_aleluya, s_aleluya) do    
    steps_aleluya = parse_aleluya(s_aleluya) 
    nev_aleluya = evalsteps_aleluya(ev_aleluya, steps_aleluya)

    nev_aleluya
  end

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t()
  def format_stack(ev_aleluya) do
    Enum.join(ev_aleluya.list_aleluya, " ")    
  end

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception word: nil
    def message(e), do: "invalid word: #{inspect(e.word)}"
  end

  defmodule UnknownWord do
    defexception word: nil
    def message(e), do: "unknown word: #{inspect(e.word)}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end
