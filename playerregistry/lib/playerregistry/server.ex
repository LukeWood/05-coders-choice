defmodule PlayerRegistry.Server do
  use GenServer

  alias PlayerRegistry.Impl, as: Impl

  def start_link(name) do
    GenServer.start_link(PlayerRegistry.Server,
      PlayerRegistry.Impl.zero_state,
      name: name)
  end

  def handle_call({:tick, bullet_pid, timestamp}, _from, state) do
    state |>
    Impl.tick(bullet_pid, timestamp) |>
    reply
  end

  def handle_call({:add_player, conn}, _from, state) do
    state |>
    Impl.add_player(conn, %PlayerRegistry.Player{}) |>
    reply
  end

  def handle_call({:peek}, _from, state) do
    {:reply, state, state}
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
