defmodule World.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %World{})
  end

  def handle_call({:get_players}, _from, state) do
    {:reply, Map.get(state, :players), state}
  end

end
