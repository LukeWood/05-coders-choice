defmodule Bullet.Supervisor do

  def start(x, y, direction) do
    {:ok, pid} = Agent.start(fn -> %Bullet{x: x, y: y, direction: direction} end)
    pid
  end

end
