defmodule World.Client do

    def get_players(pid) do
      GenServer.call(pid, {:get_players})
    end

end
