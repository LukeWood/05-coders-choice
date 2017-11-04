defmodule BulletRegistry.Client do
  def tick() do
    GenServer.call(BulletRegistry, {:tick})
  end
  def add_bullet(x, y, direction) do
    GenServer.cast(BulletRegistry, {:add_bullet, x, y, direction})
  end
end
