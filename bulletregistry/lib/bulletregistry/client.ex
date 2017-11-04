defmodule BulletRegistry.Client do
  def tick() do
    GenServer.call(BulletRegistry, {:tick})
  end
  def add_bullet(bullet) do
    GenServer.cast(BulletRegistry, {:add_bullet, bullet})
  end
  def new_registry do

  end

end
