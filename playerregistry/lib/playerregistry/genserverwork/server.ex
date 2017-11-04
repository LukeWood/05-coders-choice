defmodule PlayerRegistry.Server do
  use GenServer

  def start_link(name) do
    GenServer.start_link(PlayerRegistry.Server,
      PlayerRegistry.Impl.zero_state,
      name: name)
  end

end
