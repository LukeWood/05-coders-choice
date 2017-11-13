defmodule Clock do
  use Observable

  @clock_speed 50

  def recursive_clock() do
    :timer.sleep(@clock_speed)
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
