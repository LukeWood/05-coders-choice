defmodule Bullet.Supervisor do

  def start(x, y, direction) do
    Agent.start(fn -> %Bullet{x: x, y: y, direction: direction} end)
  end

end
