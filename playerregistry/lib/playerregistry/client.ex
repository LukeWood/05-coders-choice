defmodule PlayerRegistry.Client do

  def tick(bullet_pid, timestamp, pid\\PlayerRegistry) do
    GenServer.call(pid, {:tick, bullet_pid, timestamp})
  end

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def player_input(player_id, action, pid\\PlayerRegistry) do
    GenServer.cast(pid, {:player_input, player_id, action})
  end


end
