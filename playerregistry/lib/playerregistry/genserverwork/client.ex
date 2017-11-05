defmodule PlayerRegistry.Client do

  def tick(pid\\PlayerRegistry) do
    GenServer.call(pid, {:tick})
  end

  def player_input(player_number, direction, pid\\PlayerRegistry) do
    GenServer.cast(pid, {:player_input, player_number, direction})
  end

end
