defmodule Bullet.Server do
  use GenServer

  alias Bullet.Impl, as: Impl
  def start_link() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Bullet{})
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def start_link(state) do
    {:ok, pid} = GenServer.start_link(__MODULE__, state)
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def handle_call({:peek}, _from, state) do
    {:reply, Map.drop(state, [:world]), state}
  end

  def handle_cast({:tick}, state = %{lifetime: 0}) do
    state = Impl.tick(state)
    {:stop, :normal, state}
  end

  def handle_cast({:tick}, state ) do
    new_state = Impl.tick(state)
    {:noreply, new_state}
  end

end
