defmodule World.Client do

    def tick(pid) do
      GenServer.cast(pid, {:tick})
    end


end
