defmodule World.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %World{})
  end

  def handle_call({:players}, _from, state) do
    {:reply, Map.get(state, :players), state}
  end

  def handle_call({:bullets}, _from, state) do
    {:reply, Map.get(state, :bullets), state}
  end

  def handle_cast({:new_player, player}, state) do
    {:noreply, Map.update!(state, :players, fn players -> [player | players] end)}
  end

  def handle_cast({:remove_player, player}, state) do
    Process.exit(player, :killed)
    {:noreply, Map.update!(state, :players, fn players ->
      Enum.filter(players, fn p -> p != player end)
    end)}
  end


  def handle_cast({:new_bullet, bullet}, state) do
    {:noreply, Map.update!(state, :bullets, fn bullets -> [bullet | bullets] end)}
  end

  def handle_cast({:remove_bullet, bullet}, state) do
    Process.exit(bullet, :killed)
    {:noreply, Map.update!(state, :bullets, fn bullets ->
      Enum.filter(bullets, fn p -> p != bullet end)
    end)}
  end


end
