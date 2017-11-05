defmodule GameServer.Server do
  use GenServer
  def start_link do

  end

  def handle_cast({:tick}, _from, state) do
    timestamp = :os.system_time(:millisecond)
    dt = timestamp - state.time

    bullet_pid = state.bullet_pid
    player_pid = state.player_pid
    bullet_callback = state.bullet_callback

    bullet_state = BulletServer.tick(bullet_pid, timestamp)
    player_state = PlayerServer.tick(player_pid, bullet_callback, timestamp)
    states = %{
      bullets: bullet_state,
      players: player_state
    }
    {:reply, states, Map.put(state, :timestamp, timestamp)}
  end

end
