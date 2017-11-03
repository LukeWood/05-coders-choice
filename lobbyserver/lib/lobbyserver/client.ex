defmodule LobbyServer.Client do

    def new_lobby name do
      GenServer.call(LobbyServer, {:create_lobby, name})
    end

    def list_lobbies() do
      GenServer.call(LobbyServer, {:list_lobbies})
    end

    def join_lobby conn do
      GenServer.call(LobbyServer, {:join_lobby, conn})
    end

    def get_lobby name do
      GenServer.call(LobbyServer, {:get_lobby, name})
    end

end
