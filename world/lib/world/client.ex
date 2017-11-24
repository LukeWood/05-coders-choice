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

    def get_bullets(pid) do
      GenServer.call(pid, {:get_bullets})
    end

    def new_bullet(pid, bullet) do
      GenServer.cast(pid, {:new_bullet, bullet})
    end

    def remove_bullet(pid, bullet) do
      GenServer.cast(pid, {:remove_bullet, bullet})
    end



end
