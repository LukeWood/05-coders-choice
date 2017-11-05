defmodule GameServer do

  defdelegate new_server, to: GameServer.Supervisor
  
end
