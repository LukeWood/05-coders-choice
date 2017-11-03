defmodule LobbyServer.Agent do

  @name :DataStore

  def start_link do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def add_lobby(lobby) do
    Agent.update(@name, fn map -> Map.put(map, lobby, create_lobby()) end)
  end

  def list_lobbies() do
    Agent.get(@name, fn lobbylist -> lobbylist end)
  end

  def get_lobby(lobby) do
    Agent.get(@name, fn lobby_map -> Map.get(lobby_map, lobby) end)
  end

  def delete_lobby(lobby) do
    Agent.update(@name, fn map -> Map.delete(map, lobby) end)
  end

  #TODO(LukeWood) This should actually start a new lobby not just a list
  def create_lobby() do
    Agent.start_link(fn -> [] end)
  end

end
