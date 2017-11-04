defmodule BulletRegistry.Impl do

  @bullet_speed 1

  #TODO(lukewood)
  # bullets should move by dx and dy defined by:
  # (timestamp - last_timestamp)/1000 * bullet_speed

  defp bullet_update(bullet = %{:direction => :left}) do
    Map.update!(bullet, :x, fn x -> x - @bullet_speed end)
  end
  defp bullet_update(bullet = %{:direction => :right}) do
    Map.update!(bullet, :x, fn x -> x + @bullet_speed end)
  end
  defp bullet_update(bullet = %{:direction => :up}) do
    Map.update!(bullet, :y, fn y -> y - @bullet_speed end)
  end
  defp bullet_update(bullet = %{:direction => :down}) do
    Map.update!(bullet, :y, fn y -> y + @bullet_speed end)
  end

  defp update_all_bullets(bullets) do
    Enum.map(bullets, &bullet_update/1)
  end

  defp filter_bullets(bullets, timestamp) do
    bullets |>
    Enum.filter(&(Map.get(&1, :expiration) > timestamp))
  end

  def tick(state, timestamp, []) do
    tick(state, timestamp)
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
