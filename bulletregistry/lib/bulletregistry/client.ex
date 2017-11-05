defmodule BulletRegistry.Client do

  def tick(timestamp, pid\\BulletRegistry) do
    GenServer.call(pid, {:tick, timestamp})
  end
  def add_bullet(x, y, direction, pid\\BulletRegistry) do
    GenServer.cast(pid, {:add_bullet, x, y, direction})
  end

  def peek(pid\\BulletRegistry) do
    GenServer.call(pid, {:peek})
  end
end
