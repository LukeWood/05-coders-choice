defmodule ClockTest do
  use ExUnit.Case

  defmodule TestSubscribed do
    use GenServer

    def handle_call({:peek}, _from, state) do
      {:reply, state, state}
    end

    def handle_cast({:tick}, _) do
      {:noreply, :ticked}
    end

  end

  test "Clock starts automatically" do
    {:ok, pid} = GenServer.start(TestSubscribed, [])
    Observable.observe(Clock, pid)
    :timer.sleep(2000)
    assert GenServer.call(pid, {:peek}) == :ticked
  end

end
