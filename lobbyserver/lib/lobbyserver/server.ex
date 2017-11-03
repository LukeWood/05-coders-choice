defmodule LobbyServer.Server do
  use GenServer

  def handle_call({:create_lobby, name}, _from, _) do
    LobbyServer.Agent.add_lobby(name) |>
    reply_good
  end

  def handle_call({:get_lobby, name}, _from, _) do
    LobbyServer.Agent.get_lobby(name) |>
    reply_good
  end

  def handle_call({:list_lobbies}, _from, _) do
    LobbyServer.Agent.list_lobbies
  end

  def handle_cast({:delete_lobby, lobby}, _) do
    LobbyServer.Agent.delete_lobby(lobby)
    {:noreply, lobby}
  end

  def reply_good(param) do
    {:reply, param, param}
  end

end
