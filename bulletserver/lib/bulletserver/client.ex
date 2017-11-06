defmodule BulletServer.Client do

  def tick(pid, timestamp) do
    GenServer.call(pid, {:tick, timestamp})
  end

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def add_bullet(pid, x, y, direction, timestamp) do
    GenServer.cast(pid, {:add_bullet, x, y, direction, timestamp})
  end

end
