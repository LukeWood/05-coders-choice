defmodule PlayerRegistry.Client do

  def tick(pid, bullet_pid, timestamp) do
    GenServer.call(pid, {:tick, bullet_pid, timestamp})
  end

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def player_input(pid, player_id, action) do
    GenServer.cast(pid, {:player_input, player_id, action})
  end

  def add_player(pid, player_id) do
    GenServer.call(pid, {:add_player, player_id})
  end

end
