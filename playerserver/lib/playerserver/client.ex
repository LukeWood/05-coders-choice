defmodule PlayerServer.Client do

  def tick(pid, shoot_callback, timestamp) do
    GenServer.call(pid, {:tick, shoot_callback, timestamp})
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
