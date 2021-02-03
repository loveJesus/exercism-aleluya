#  For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.
defmodule Aleluya do
  defmodule Robot do
    defstruct direction_aleluya: :north, position_aleluya: {0, 0}

    # Aleluya, robot rotate left return new robot  
    def simulate_l_aleluya(robot_aleluya) do
      %{ robot_aleluya |
        direction_aleluya: case robot_aleluya.direction_aleluya do
            :west -> :south
            :south -> :east
            :east -> :north
            :north -> :west
          end }   
    end

    # Aleluya, robot rotate right return new robot
    def simulate_r_aleluya(robot_aleluya) do
      %{ robot_aleluya |
        direction_aleluya: case robot_aleluya.direction_aleluya do
            :west -> :north
            :south -> :west
            :east -> :south
            :north -> :east
          end }   
    end

    # Aleluya, robot advance return new robot
    def simulate_a_aleluya(robot_aleluya) do
      {ox_aleluya, oy_aleluya} = robot_aleluya.position_aleluya
      %{ robot_aleluya |
        position_aleluya: case robot_aleluya.direction_aleluya do
            :west -> {ox_aleluya - 1, oy_aleluya}
            :south -> {ox_aleluya, oy_aleluya - 1}
            :east -> {ox_aleluya + 1, oy_aleluya}
            :north -> {ox_aleluya, oy_aleluya + 1}
          end }           
    end

    # Aleluya, Simulate one robot step returning 
    # {:ok_leluya, robot_aleluya} or {:halt, {:error, msgleluya}}
    def step_aleluya(robot_aleluya, instruction_aleluya) do
      case instruction_aleluya do
        ?L -> {:cont, simulate_l_aleluya(robot_aleluya)}
        ?R -> {:cont, simulate_r_aleluya(robot_aleluya)}
        ?A -> {:cont, simulate_a_aleluya(robot_aleluya)}
        _ -> {:halt, {:error, "invalid instruction"}}
      end
    end
  end
end

defmodule RobotSimulator do 

  # Hallelujah, return nil if valid, or {:error, msgleluya} when invalid
  defp invalid_init_aleluya?(direction_aleluya, position_aleluya) do
    case direction_aleluya do
      d_aleluya when d_aleluya in [:west, :north, :east, :south] ->
        case position_aleluya do
          {a_aleluya, b_aleluya} when 
            is_integer(a_aleluya) and is_integer(b_aleluya) -> nil
          _ -> {:error, "invalid position"}
        end
      _ -> {:error, "invalid direction"}
    end
  end
  
  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction_aleluya :: atom, position_aleluya :: {integer, integer}) :: any
  def create(direction_aleluya \\ :north, position_aleluya \\ {0, 0}) do
    inv_aleluya = invalid_init_aleluya?(direction_aleluya, position_aleluya)
    if inv_aleluya == nil do
      %Aleluya.Robot{
        direction_aleluya: direction_aleluya, 
        position_aleluya: position_aleluya}
    else
      inv_aleluya
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot_aleluya :: any, instructions_aleluya :: String.t()) :: any
  def simulate(robot_aleluya, instructions_aleluya) do
    to_charlist(instructions_aleluya)
    |> Enum.reduce_while(
          robot_aleluya, 
          fn instruction_aleluya, cur_robot_aleluya ->
            Aleluya.Robot.step_aleluya(cur_robot_aleluya, instruction_aleluya)
          end)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot_aleluya :: any) :: atom
  def direction(robot_aleluya) do
    robot_aleluya.direction_aleluya
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot_aleluya :: any) :: {integer, integer}
  def position(robot_aleluya) do
    robot_aleluya.position_aleluya
  end
end
