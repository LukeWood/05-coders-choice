defmodule GameServer.Client do
  def tick(pid) do
    GenServer.call(pid, {:tick})
  end

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def add_player(pid, name) do
    GenServer.call(pid, {:add_player, name})
  end

  def player_input(pid, from, action) do
    GenServer.cast(pid, {:player_input, from, action})
  end

end
