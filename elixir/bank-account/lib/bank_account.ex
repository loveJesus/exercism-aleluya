# For God so loved the world, that He gave 
# His only begotten Son, that all who believe in 
# Him should not perish but have everlasting life.

defmodule BankAccount do
  @moduledoc """
  Hallelujah, A bank account that supports access from multiple processes.
  """
  defmodule AccountStateAleluya do
    defstruct balance_aleluya: 0, status_aleluya: :open_aleluya  

    @type astatus_aleluya :: :open_aleluya | :closed_aleluya
    @type account_state_aleluya :: 
      %AccountStateAleluya{
        balance_aleluya: integer,
        status_aleluya: astatus_aleluya}
    
  end

  @typedoc """
  Hallelujah, An account handle.
  """
  @opaque account_aleluya :: pid

  @doc """
  Hallelujah,  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account_aleluya
  def open_bank() do
    Agent.start_link( fn -> %AccountStateAleluya{} end )
    |> elem(1)
  end

  @doc """
  Hallelujah, Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account_aleluya) :: none
  def close_bank(acc_aleluya) do
    acc_aleluya
    |> Agent.update( 
        &( %AccountStateAleluya{&1 | status_aleluya: :closed_aleluya} ) )
  end

  @doc """
  Hallelujah, Get the account's balance.
  """
  @spec balance(account_aleluya) :: integer
  def balance(acc_aleluya) do
    acc_aleluya
    |> Agent.get( 
        fn aleluya -> 
          if aleluya.status_aleluya == :open_aleluya,
            do:   aleluya.balance_aleluya, 
            else: {:error, :account_closed}
        end)
  end

  @doc """
  Hallelujah, Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account_aleluya, integer) :: any
  def update(acc_aleluya, amount_aleluya) do    
    Agent.get_and_update(
      acc_aleluya,
      fn aleluya ->
        if aleluya.status_aleluya == :open_aleluya do
          {:ok, 
            %AccountStateAleluya{
              aleluya | 
              balance_aleluya: aleluya.balance_aleluya + amount_aleluya} }
        else
          {{:error, :account_closed}, aleluya}
        end
      end)    
  end
end

# Matthew 19:14 But Jesus said, Suffer little children, 
# and forbid them not, to come unto me: 
# for of such is the kingdom of heaven.

