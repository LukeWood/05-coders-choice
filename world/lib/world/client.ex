defmodule World.Client do

    def get_players(pid) do
      GenServer.call(pid, {:get_players})
    end

    def new_player(pid, player) do
      GenServer.cast(pid, {:new_player, player})
    end

    def remove_player(pid, player) do
      GenServer.cast(pid, {:remove_player, player})
    end

end
