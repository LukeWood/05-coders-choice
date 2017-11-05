defmodule BulletServer.Client do

  def tick(timestamp, pid\\BulletServer) do
    GenServer.call(pid, {:tick, timestamp})
  end
  def add_bullet(x, y, direction, timestamp, pid\\BulletServer) do
    GenServer.cast(pid, {:add_bullet, x, y, direction, timestamp})
  end

  def peek(pid\\BulletServer) do
    GenServer.call(pid, {:peek})
  end
end
