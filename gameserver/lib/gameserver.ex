defmodule GameServer do

  defdelegate tick(pid),                       to: GameServer.Client
  defdelegate peek(pid),                       to: GameServer.Client
  defdelegate player_input(pid, from, action), to: GameServer.Client
  defdelegate add_player(pid, name),           to: GameServer.Client
  defdelegate new_server,                      to: GameServer.Supervisor

end
