defmodule World.Server do
  use GenServer

#    defstruct [
#      bullets: [],
#      players: [],
#    ]
  alias World.Impl, as: Impl

  def start do
    GenServer.start_link(World.Server, %World{})
  end

  def handle_cast({:tick}, state) do
    state = Impl.tick(state)
    {:noreply, state}
  end

end
