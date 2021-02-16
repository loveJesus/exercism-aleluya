# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
defmodule Bowling do
  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """  
  defmodule FrameAleluya do
    defstruct number_aleluya: 1, 
              score_aleluya: 0, 
              status_aleluya: :new_aleluya

    @type t_aleluya ::  %FrameAleluya{
        number_aleluya: integer,
        score_aleluya:  integer,
        status_aleluya:
          :new_aleluya 
          | :second_throw_aleluya 
          | :normal_aleluya 
          | :spare_t1_aleluya 
          | :spare_closed_aleluya 
          | :strike_t1_aleluya
          | :strike_t2_aleluya
          | :strike_closed_aleluya
      }
  end

  defmodule ScorerAleluya do
    defstruct rolls_aleluya: [], frames_aleluya: [ %FrameAleluya{} ]

    @type t_aleluya :: 
      %ScorerAleluya{ 
        rolls_aleluya: [integer],
        frames_aleluya: [FrameAleluya.t_aleluya] }
  end

  @spec start() :: ScorerAleluya.t_aleluya()
  def start do
    %ScorerAleluya{}
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(ScorerAleluya.t_aleluya(), integer) :: ScorerAleluya.t_aleluya() | String.t()
  def roll(game_aleluya = %ScorerAleluya{frames_aleluya: frames_aleluya = [fhd_aleluya | ftl_aleluya]}, roll_aleluya) 
    when fhd_aleluya.number_aleluya == 11 do
      {:error, "ALELUYA"}

  end
  def roll(game_aleluya = %ScorerAleluya{frames_aleluya: frames_aleluya = [fhd_aleluya | ftl_aleluya]}, roll_aleluya) do

    %ScorerAleluya {
      game_aleluya
      | rolls_aleluya: [ roll_aleluya | game_aleluya.rolls_aleluya],
        frames_aleluya: [ 
          %FrameAleluya{
            number_aleluya: 0,
            score_aleluya: roll_aleluya,
            status_aleluya: :new_aleluya}
          | frames_aleluya]
      } 
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(ScorerAleluya.t_aleluya()) :: integer | String.t()
  def score(game_aleluya) do
    game_aleluya.frames_aleluya
    |> Enum.reduce(
        0,
        fn frame_aleluya, acc_score_aleluya ->
          acc_score_aleluya + frame_aleluya.score_aleluya
        end)
  end
end
