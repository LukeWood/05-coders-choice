defmodule PlayerRegistry.Supervisor do

  def new_registry do
    {:ok, pid} = GenServer.start_link(PlayerRegistry.Server,
        PlayerRegistry.Impl.zero_state)
    pid
  end

end
