defmodule GameServer do

  defdelegate tick(pid),  to: GameServer.Client
  defdelegate new_server, to: GameServer.Supervisor

end
