defmodule Bullet.Server do
  use GenServer

  alias Bullet.Impl, as: Impl
  def start_link() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Bullet{})
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def start_link(name) do
    {:ok, pid} = GenServer.start_link(__MODULE__, %Bullet{}, name: name)
    Observable.observe(Clock, pid)
    {:ok, pid}
  end

  def handle_call({:peek}, state) do
    {:reply, state, state}
  end

  def handle_cast({:tick}, state = %{lifetime: 0}) do
    {:stop, :normal, state}
  end

  def handle_cast({:tick}, state ) do
    new_state = Impl.tick(state) |> IO.inspect
    {:noreply, new_state}
  end

end
