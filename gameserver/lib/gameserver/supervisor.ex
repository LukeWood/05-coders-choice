defmodule GameServer.Supervisor do
  def new_server do
    time = 1000
    {:ok, pid} = GenServer.start_link(GameServer.Server, time)
    bullet_pid = BulletServer.new_registry
    player_pid = PlayerServer.new_registry

    children = %GameServer.Children{
      bullet_server: bullet_pid,
      player_server: player_pid
    }
    KeyVal.set(pid, children)
  end
end
