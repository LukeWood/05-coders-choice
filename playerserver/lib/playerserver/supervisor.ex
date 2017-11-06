defmodule PlayerServer.Supervisor do

  def new_registry do
    {:ok, pid} = GenServer.start_link(PlayerServer.Server,
        PlayerServer.Impl.zero_state)
    pid
  end

end
