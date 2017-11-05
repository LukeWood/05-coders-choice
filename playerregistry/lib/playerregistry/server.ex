defmodule PlayerRegistry.Server do
  use GenServer

  def start_link(name) do
    GenServer.start_link(PlayerRegistry.Server,
      PlayerRegistry.Impl.zero_state,
      name: name)
  end

  def handle_call({:tick}, _from, state) do

  end

  def handle_call({:add_player, conn}, _From, state) do

  end

  def handle_cast({:player_input, player, :shoot}, state) do
    state |>
    Map.put(
      :shots,
      Map.put(state.shots, player, :shoot)
    ) |>
    no_reply
  end

  def handle_cast({:player_input, player, direction}, state) do
    state |>
    Map.put(
      :actions,
      Map.put(state.actions, :direction, direction)
    ) |>
    no_reply
  end

  defp no_reply state do
    {:no_reply, state}
  end

end
