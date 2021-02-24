# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
defmodule Bowling do
  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """  
  @max_pins_aleluya 10
  @last_frame_aleluya 10

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
    defstruct frames_aleluya: [ %FrameAleluya{} ], 
              roll_aleluya:   0, 
              status_aleluya: :open_aleluya

    @type t_aleluya :: 
      %ScorerAleluya{
        frames_aleluya: [FrameAleluya.t_aleluya], 
        roll_aleluya:   integer,
        status_aleluya: :open_aleluya | :closed_aleluya }
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
  def roll(game_aleluya, roll_aleluya) do
    cond do
      roll_aleluya < 0  ->  
        {:error, "Negative roll is invalid"}
      roll_aleluya > @max_pins_aleluya  -> 
        {:error, "Pin count exceeds pins on the lane"}
      game_aleluya.status_aleluya == :closed_aleluya -> 
        {:error, "Cannot roll after game is over"}
      true ->        
        %ScorerAleluya{
          game_aleluya
          | roll_aleluya: roll_aleluya}          
        |> modify_strike_2_ago_aleluya
        |> modify_strike_1_ago_aleluya
        |> modify_spare_1_ago_aleluya
        |> calc_and_validate_new_cur_frame_score_aleluya
        |> check_still_open_aleluya    
    end  
  end

  defp check_still_open_aleluya(param_aleluya = {:error,_}) do
    param_aleluya
  end

  defp check_still_open_aleluya(
    game_aleluya = %ScorerAleluya{
      frames_aleluya: [ %FrameAleluya{number_aleluya: curframe_aleluya} | _ ]})
    when curframe_aleluya < @last_frame_aleluya do
      game_aleluya
  end

  defp check_still_open_aleluya(game_aleluya = %ScorerAleluya{}) do
    curframe_aleluya  = hd(game_aleluya.frames_aleluya)
    
 
    hdtl_aleluya      = hd(tl(game_aleluya.frames_aleluya))
    hdtltl_aleluya    = hd(tl(tl(game_aleluya.frames_aleluya)))
    
    cond do
      curframe_aleluya.number_aleluya == @last_frame_aleluya+1 and
        (hdtl_aleluya.status_aleluya == :normal_aleluya or
          hdtl_aleluya.status_aleluya == :spare_closed_aleluya)->
          %ScorerAleluya{
            game_aleluya
            | status_aleluya: :closed_aleluya }

      curframe_aleluya.number_aleluya == @last_frame_aleluya+2 and (
        hdtl_aleluya.status_aleluya     == :normal_aleluya or
        hdtltl_aleluya.status_aleluya   == :spare_closed_aleluya or
        hdtltl_aleluya.status_aleluya   == :strike_closed_aleluya) ->
          %ScorerAleluya{
            game_aleluya
            | status_aleluya: :closed_aleluya }

      curframe_aleluya.number_aleluya == @last_frame_aleluya+3 ->
          %ScorerAleluya{
            game_aleluya
            | status_aleluya: :closed_aleluya }

      true ->
        game_aleluya
     
    end    
  end

  defp calc_and_validate_new_cur_frame_score_aleluya(
    %ScorerAleluya{
      roll_aleluya: roll_aleluya,
      frames_aleluya: [
        %FrameAleluya{
          score_aleluya: score_aleluya
          } | _]}) 
    when score_aleluya + roll_aleluya > @max_pins_aleluya do
      {:error, "Pin count exceeds pins on the lane"}
  end

  defp calc_and_validate_new_cur_frame_score_aleluya(game_aleluya = %ScorerAleluya{}) do
    curframe_aleluya      = hd(game_aleluya.frames_aleluya)
    ftl_aleluya           = tl(game_aleluya.frames_aleluya)
    new_score_aleluya     = curframe_aleluya.score_aleluya + game_aleluya.roll_aleluya    
    num_aleluya           = curframe_aleluya.number_aleluya    
    status_aleluya        = curframe_aleluya.status_aleluya


    case status_aleluya do
      :new_aleluya when new_score_aleluya < @max_pins_aleluya -> 
        %ScorerAleluya {
          game_aleluya
          | frames_aleluya: [ 
              %FrameAleluya{
                number_aleluya: num_aleluya,
                score_aleluya:  new_score_aleluya,
                status_aleluya: :second_throw_aleluya }
              | ftl_aleluya ] }

      :new_aleluya when new_score_aleluya == @max_pins_aleluya -> 
        %ScorerAleluya {
          game_aleluya
          | frames_aleluya: [
              %FrameAleluya{ number_aleluya: num_aleluya + 1 }
              | [ %FrameAleluya{
                    number_aleluya: num_aleluya,
                    score_aleluya:  new_score_aleluya,
                    status_aleluya: :strike_t1_aleluya }
                  | ftl_aleluya ] ] }              

      :second_throw_aleluya when new_score_aleluya < @max_pins_aleluya ->
        %ScorerAleluya {
          game_aleluya
          | frames_aleluya: [
              %FrameAleluya{ number_aleluya: num_aleluya + 1 }
              | [ %FrameAleluya{
                    number_aleluya: num_aleluya,
                    score_aleluya:  new_score_aleluya,
                    status_aleluya: :normal_aleluya }
                  | ftl_aleluya ] ] }

      :second_throw_aleluya when new_score_aleluya == @max_pins_aleluya ->
        %ScorerAleluya {
          game_aleluya
          | frames_aleluya: [
              %FrameAleluya{ number_aleluya: num_aleluya + 1 }
              | [ %FrameAleluya{
                    number_aleluya: num_aleluya,
                    score_aleluya:  new_score_aleluya,
                    status_aleluya: :spare_t1_aleluya }
                  | ftl_aleluya ] ] }                  

    end
  end

  # Hallelujah - Add a second throw where second wasn't after another strike 
  defp modify_strike_2_ago_aleluya( 
    game_aleluya = 
      %ScorerAleluya{
        frames_aleluya: [ 
          curframe_aleluya 
          | [ frstrike_aleluya = 
              %FrameAleluya{
                status_aleluya: status_aleluya
              } | frstriketl_aleluya ] ] } ) 
    when status_aleluya == :strike_t2_aleluya do
    cur_roll_aleluya      = game_aleluya.roll_aleluya

    fr_new_strike_aleluya  = 
      %FrameAleluya{
        frstrike_aleluya
        | score_aleluya:  frstrike_aleluya.score_aleluya + cur_roll_aleluya,
          status_aleluya: :strike_closed_aleluya }
          
    %ScorerAleluya{
      game_aleluya
      | frames_aleluya: [
          curframe_aleluya | [  fr_new_strike_aleluya | frstriketl_aleluya  ] ] }
  end

  # Hallelujah - Modify strike that was before another strike
  defp modify_strike_2_ago_aleluya( 
    game_aleluya = 
      %ScorerAleluya{
        frames_aleluya: [ 
          curframe_aleluya 
          | [ ftlhd_aleluya
            | [ frstrike_aleluya = 
                %FrameAleluya{
                  status_aleluya: status_aleluya
                } | frstriketl_aleluya ] ] ] } ) 
    when status_aleluya == :strike_t2_aleluya do
    cur_roll_aleluya      = game_aleluya.roll_aleluya

    fr_new_strike_aleluya  = 
      %FrameAleluya{
        frstrike_aleluya
        | score_aleluya:  frstrike_aleluya.score_aleluya + cur_roll_aleluya,
          status_aleluya: :strike_closed_aleluya }
          
    %ScorerAleluya{
      game_aleluya
      | frames_aleluya: [
          curframe_aleluya | [ ftlhd_aleluya | [ fr_new_strike_aleluya | frstriketl_aleluya ] ] ] }
  end

  defp modify_strike_2_ago_aleluya( scorer_aleluya ) do
    scorer_aleluya
  end

  defp modify_strike_1_ago_aleluya( 
    game_aleluya = 
      %ScorerAleluya{
        frames_aleluya: [ 
          curframe_aleluya 
          | [ frstrike_aleluya = 
              %FrameAleluya{
                status_aleluya: status_aleluya
              } | frstriketl_aleluya ] ] } ) 
    when status_aleluya == :strike_t1_aleluya do
    cur_roll_aleluya      = game_aleluya.roll_aleluya

    fr_new_strike_aleluya  = 
      %FrameAleluya{
        frstrike_aleluya
        | score_aleluya:  frstrike_aleluya.score_aleluya + cur_roll_aleluya,
          status_aleluya: :strike_t2_aleluya }
          
    %ScorerAleluya{
      game_aleluya
      | frames_aleluya: [
          curframe_aleluya | [ fr_new_strike_aleluya | frstriketl_aleluya ] ] }
  end

  defp modify_strike_1_ago_aleluya( scorer_aleluya ) do
      scorer_aleluya
  end

  defp modify_spare_1_ago_aleluya( 
    game_aleluya = 
      %ScorerAleluya{
        frames_aleluya: [ 
          curframe_aleluya 
          | [ frspare_aleluya = 
              %FrameAleluya{
                status_aleluya: status_aleluya
              } | frsparetl_aleluya ] ] } ) 
    when status_aleluya == :spare_t1_aleluya do
    cur_roll_aleluya      = game_aleluya.roll_aleluya

    fr_new_spare_aleluya  = 
      %FrameAleluya{
        frspare_aleluya
        | score_aleluya:  frspare_aleluya.score_aleluya + cur_roll_aleluya,
          status_aleluya: :spare_closed_aleluya }

    %ScorerAleluya{
      game_aleluya
      | frames_aleluya: [
        curframe_aleluya | [ fr_new_spare_aleluya | frsparetl_aleluya ] ] }
  end

  defp modify_spare_1_ago_aleluya(game_aleluya = %ScorerAleluya{}) do
    game_aleluya
  end
    


  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """
  @spec score(ScorerAleluya.t_aleluya()) :: integer | String.t()
  def score(game_aleluya) do
    {:cont, game_aleluya}
    |> verify_done_aleluya
    |> score_reduce_aleluya
  end

  defp verify_done_aleluya({:cont, game_aleluya}) do
    if game_aleluya.status_aleluya != :closed_aleluya do
      {:error, "Score cannot be taken until the end of the game"}
    else
      {:cont, game_aleluya}
    end      
  end

  defp score_reduce_aleluya(param_aleluya = {:error,_}) do
    param_aleluya
  end

  defp score_reduce_aleluya({:cont, game_aleluya}) do
    game_aleluya.frames_aleluya
    |> Enum.reduce(
        0,
        fn frame_aleluya, acc_score_aleluya ->
          if frame_aleluya.number_aleluya <= @last_frame_aleluya,
            do:   acc_score_aleluya + frame_aleluya.score_aleluya,
            else: acc_score_aleluya
        end)
  end

end

# Jesus Christ is Lord of Lords and King of Kings
# Genesis 2:19 And out of the ground the LORD God formed every beast of the field, 
# and every fowl of the air; and brought them unto Adam to see what he would call 
# them: and whatsoever Adam called every living creature, that was the name thereof