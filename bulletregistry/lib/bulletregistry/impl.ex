defmodule BulletRegistry.Impl do

  def bulletUpdate(bullet = %{"direction" => :left}) do
    Map.update!(bullet, :x, fn x -> x - 1 end)
  end
  def bulletUpdate(bullet = %{"direction" => :right}) do
    Map.update!(bullet, :x, fn x -> x + 1 end)
  end
  def bulletUpdate(bullet = %{"direction" => :up}) do
    Map.update!(bullet, :y, fn y -> y - 1 end)
  end
  def bulletUpdate(bullet = %{"direction" => :down}) do
    Map.update!(bullet, :y, fn y -> y - 1 end)
  end

  def tick(state, timestamp, new_bullets) do
    new_bullets = Enum.map(new_bullets, &BulletRegistry.Bullet.create_bullet/1)
    Map.update!(state, :bullets, fn bullets -> bullets ++ new_bullets end) |>
    tick(timestamp)
  end

  def tick(state, timestamp) do
    state |>
    Map.update!(:bullets, &(&1.expiration > timestamp)) |>
    Map.update!(:bullets, &bulletUpdate/1) |>
    Map.set(:timestamp, timestamp)
  end

  def new_registry do
    %{
      bullets:   [],
      timestamp: 0
    }
  end

end
