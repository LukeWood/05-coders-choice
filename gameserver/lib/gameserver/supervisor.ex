defmodule GameServer.Supervisor do
  def new_server do
    time = :os.system_time(:millisecond)

    # We need to change this to be supervised somehow
    bullet_pid = BulletServer.new_registry
    player_pid = PlayerServer.new_registry
    bullet_callback = GameServer.Impl.create_bullet_callback(bullet_pid)
    state = %{
      timestamp:       time,
      bullet_pid:      bullet_pid,
      player_pid:      player_pid,
      bullet_callback: bullet_callback
    }
    {:ok, pid} = GenServer.start_link(GameServer.Server, state)
    pid
  end
end
