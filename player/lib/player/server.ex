defmodule Player.Server do
  use GenServer
  alias Player.Impl, as: Impl

  def start_link() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Player{})
    Observable.observe(Clock, pid)
    Process.flag(:trap_exit, true)
    {:ok, pid}
  end

  def start_link(world) do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Player{world: world})
    World.new_player(world, pid)
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def handle_call({:peek}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:action, action}, state) do
    {:noreply, Impl.action(state, action)}
  end

  def handle_cast({:tick}, state) do
    {:noreply, Impl.tick(state)}
  end

  def terminate(_reason, _state = %{world: world}) do
    World.remove_player(world, self())
    :normal
  end

end
