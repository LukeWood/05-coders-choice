defmodule World.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %World{})
  end

  def handle_call({:get_players}, _from, state) do
    {:reply, Map.get(state, :players), state}
  end

  def handle_cast({:new_player, player}, state) do
    {:noreply, Map.update!(state, :players, fn players -> [player | players] end)}
  end

  def handle_cast({:remove_player, player}, state) do
    {:noreply, Map.update!(state, :players, fn players ->
      Enum.filter(players, fn p -> p != player end)
    end)}
  end

end
