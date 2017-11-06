defmodule PlayerServer.Server do
  use GenServer

  alias PlayerServer.Impl, as: Impl

  def start_link(name) do
    GenServer.start_link(PlayerServer.Server,
      PlayerServer.Impl.zero_state,
      name: name)
  end

  def handle_call({:tick, shoot_callback, timestamp}, _from, state) do
    state |>
    Impl.tick(shoot_callback, timestamp) |>
    reply
  end

  def handle_call({:add_player, conn}, _from, state) do
    state |>
    Impl.add_player(conn, %PlayerServer.Player{}) |>
    reply
  end

  def handle_call({:peek}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:player_input, player, :stop}, state) do
    state |>
    Impl.stop_player(player) |>
    no_reply
  end

  def handle_cast({:player_input, player, :shoot}, state) do
    state |>
    Impl.add_shot(player) |>
    no_reply
  end

  def handle_cast({:player_input, player, direction}, state) do
    state |>
    Impl.add_action(player, direction) |>
    no_reply
  end

  defp no_reply state do
    {:noreply, state}
  end

  def reply state do
    {:reply, state, state}
  end

end
