defmodule PlayerRegistry.Client do

  def tick(bullet_pid, timestamp, pid\\PlayerRegistry) do
    GenServer.call(pid, {:tick, bullet_pid, timestamp})
  end

  def player_input(player_id, direction, pid\\PlayerRegistry) do
    GenServer.cast(pid, {:player_input, player_id, direction})
  end

end
