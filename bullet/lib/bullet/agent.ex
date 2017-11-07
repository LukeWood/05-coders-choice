defmodule Bullet.Agent do

  alias Bullet.Impl, as: Impl

  def tick(pid) do
    Agent.update(pid, &Impl.tick/1)
    pid
  end

  def find_collisions(pid, objects) do
    Agent.get(pid, &(Impl.calculate_collisions(&1, objects)))
  end

  def peek(pid) do
    Agent.get(pid, &(&1))
  end

  def start(x, y, direction) do
    Agent.start(fn -> %Bullet{x: x, y: y, direction: direction} end)
  end

end
