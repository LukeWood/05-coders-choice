defmodule LobbyServer.Client do
    def new_lobby(name) do
      GenServer.call(LobbyServer, {:new_lobby, name})
    end
    def list_lobbies do

    end
    def join_lobby do

    end
end
