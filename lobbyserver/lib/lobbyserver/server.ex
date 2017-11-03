defmodule LobbyServer.Server do
  use GenServer

  def handle_call({:create_lobby, name}, _from, _) do
    LobbyServer.Agent.add_lobby(name)
  end

  def handle_call({:list_lobbies}) do
    LobbyServer.Agent.list_lobbies
  end

end
