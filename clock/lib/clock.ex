defmodule Clock do
  use Observable

  def recursive_clock() do
    :timer.sleep(Constants.clock_interval)
    emit({:tick})
    Clock.recursive_clock()
  end

  def start() do
    pid = spawn(Clock, :recursive_clock, [])
    {:ok, pid}
  end

  def start(_type, _args) do
    start()
  end

end
