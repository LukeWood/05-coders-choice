defmodule World.Client do

    def players(pid) do
      GenServer.call(pid, {:players})
    end

    def new_player(pid, player) do
      GenServer.cast(pid, {:new_player, player})
    end

    def remove_player(pid, player) do
      GenServer.cast(pid, {:remove_player, player})
    end

    def bullets(pid) do
      GenServer.call(pid, {:bullets})
    end

    def new_bullet(pid, bullet) do
      GenServer.cast(pid, {:new_bullet, bullet})
    end

    def remove_bullet(pid, bullet) do
      GenServer.cast(pid, {:remove_bullet, bullet})
    end



end
