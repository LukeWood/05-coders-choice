defmodule LobbyServer do

  use Application

  def start_link do
    LobbyServer.Supervisor.start_link(LobbyServer)
  end
end
