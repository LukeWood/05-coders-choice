defmodule Bullet.Server do
  use GenServer

  alias Bullet.Impl, as: Impl
  def start_link() do
    start_link(%Bullet{})
  end

  def start_link(state) do
    millis = :erlang.system_time(:milli_seconds)
    state = Map.put(state, :timestamp, millis)
    {:ok, pid} = GenServer.start_link(__MODULE__, state)
    :timer.apply_interval(Constants.clock_interval, GenServer, :cast, [pid, {:tick}])
    {:ok, pid}
  end

  def handle_call({:peek}, _from, state) do
    {:reply, Map.drop(state, [:world]), state}
  end

  def handle_cast({:tick}, state = %{x: x}) when x < 0 do
    Impl.die(state)
    {:stop, :normal, nil}
  end
  def handle_cast({:tick}, state = %{y: y}) when y < 0 do
    Impl.die(state)
    {:stop, :normal, nil}
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
