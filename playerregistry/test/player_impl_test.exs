defmodule ImplTest.Impl do
  use ExUnit.Case


  def tick(state, timestamp) do
    actions
  end

  def zero_state do
    %{
      players:    [],
      actions:  %{},
      shots:    %{}
    }
  end

end
