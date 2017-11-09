defmodule Bullet.Server do

  alias Bullet.Impl, as: Impl

  def start_link(_args) do
    {:ok, pid} = GenServer.start_link(__MODULE__, [])
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def handle_cast({:tick}, state ) do
    new_state = Impl.tick(state) |>
    IO.inspect
    # state has world contained in it?
    # let's find collisions here next
    {:noreply, new_state}
  end

end
