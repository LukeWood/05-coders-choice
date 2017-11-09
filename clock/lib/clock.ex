defmodule Clock do
  use Observable

  def recursive_clock() do
    :timer.sleep(1000)
    emit({:tick})
    Clock.recursive_clock()
  end

  def start(_type, _args) do
    pid = spawn(Clock, :recursive_clock, [])
    {:ok, pid}
  end

end
