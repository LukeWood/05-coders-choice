defmodule Player.Supervisor do
  def start do
    {:ok, pid} = Agent.start(fn -> %Player{} end)
    pid
  end

  def start(x, y) do
    {:ok, pid} = Agent.start(fn -> %Player{x: x, y: y})
    pid
  end

end
