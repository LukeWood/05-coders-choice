defmodule LobbyServer do

  alias LobbyServer.Client, as: Client

  defdelegate new_lobby(name),    to: Client
  defdelegate list_lobbies,       to: Client
  defdelegate join_lobby(conn),   to: Client
  defdelegate get_lobby(name),    to: Client
  defdelegate delete_lobby(name), to: Client

  def start(_type, _args) do
    GenServer.start_link(LobbyServer.Server, [], name: LobbyServer)
    LobbyServer.Supervisor.start_link()
  end
end
