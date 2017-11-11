defmodule Player.Server do
  use GenServer
  alias Player.Impl, as: Impl

  def start_link() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Player{})
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
end
