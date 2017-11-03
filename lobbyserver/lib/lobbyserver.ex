defmodule LobbyServer do

  alias LobbyServer.Client, as: Client
  use Application

  defdelegate new_lobby(name), to: Client
  defdelegate list_lobbies,       to: Client
  defdelegate join_lobby,         to: Client

  def start(_type, _args) do
    LobbyServer.Supervisor.start_link(LobbyServer)
  end
end
