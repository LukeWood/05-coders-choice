defmodule GameServer.Server do
  use GenServer
  def start_link do

  end

  def handle_cast({:tick}, _from, state) do
    time = :os.system_time(:millisecond)
    dt = time - state.time
    bullet_pid = state.bullet_pid
    player_pid = state.player_pid

    BulletServer.tick(bullet_pid)
    PlayerServer.tick(player_pid)

    {:reply, :nil, Map.put(state, :time, time)}
  end

end
