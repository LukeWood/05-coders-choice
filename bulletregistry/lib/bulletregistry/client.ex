defmodule BulletRegistry.Client do
  def tick(pid\\BulletRegistry) do
    GenServer.call(pid, {:tick})
  end
  def add_bullet(x, y, direction, pid\\BulletRegistry) do
    GenServer.cast(pid, {:add_bullet, x, y, direction})
  end

  def peek(pid\\BulletRegistry) do
    GenServer.call(pid, {:peek})
  end
end
