defmodule LobbyServer.Agent do

  @name :DataStore

  def start_link do
    Agent.start_link(fn -> [] end, name: @name)
  end

  def add_lobby(lobby) do
    Agent.update(@name, fn lobbylist -> [lobby | lobbylist] end)
  end

  def list_lobbies() do
    Agent.get(@name, fn lobbylist -> lobbylist end)
  end

end
