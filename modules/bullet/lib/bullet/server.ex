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
    :timer.apply_interval(Application.get_env(:world, :interval), GenServer, :cast, [pid, {:tick}])
    {:ok, pid}
  end

  def handle_call({:peek}, _from, state) do
    {:reply, Map.drop(state, [:world]), state}
  end

  def handle_cast({:tick}, state = %{lifetime: 0}) do
    {:stop, :normal, Impl.tick(state)}
  end
  def handle_cast({:tick}, state) do
    {:noreply, Impl.tick(state)}
  end

end
