defmodule BulletRegistry.Impl do

  def bullet_update(bullet = %{:direction => :left}) do
    Map.update!(bullet, :x, fn x -> x - 1 end)
  end
  def bullet_update(bullet = %{:direction => :right}) do
    Map.update!(bullet, :x, fn x -> x + 1 end)
  end
  def bullet_update(bullet = %{:direction => :up}) do
    Map.update!(bullet, :y, fn y -> y - 1 end)
  end
  def bullet_update(bullet = %{:direction => :down}) do
    Map.update!(bullet, :y, fn y -> y - 1 end)
  end

  def update_all_bullets(bullets) do
    Enum.map(bullets, &bullet_update/1)
  end

  def filter_bullets(bullets, timestamp) do
    bullets |>
    Enum.filter(&(Map.get(&1, :expiration) > timestamp))
  end

  def tick(state, timestamp, new_bullets) do
    new_bullets = Enum.map(new_bullets, &BulletRegistry.Bullet.create_bullet/1)
    Map.update!(state, :bullets, fn bullets -> bullets ++ new_bullets end) |>
    tick(timestamp)
  end

  def tick(state, timestamp) do
    state |>
    Map.update!(:bullets, &(filter_bullets(&1, timestamp))) |>
    Map.update!(:bullets, &update_all_bullets/1) |>
    Map.put(:timestamp, timestamp)
  end

  def new_registry do
    %{
      bullets:   [],
      timestamp: 0
    }
  end

end
