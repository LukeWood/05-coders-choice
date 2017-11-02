defmodule LobbyServer.Agent do
  def start_link do
    Agent.start_link([])
  end
end
