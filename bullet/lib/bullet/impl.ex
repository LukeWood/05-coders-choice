defmodule Bullet.Impl do

  @bullet_speed 1
  @bullet_radius 5

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

  def distance(x1, x2, y1, y2) do
    :math.sqrt(
      :erlang.abs(:math.pow(x1-x2, 2) - :math.pow(y1-y2, 2))
    )
  end

  defp did_collide(x1, x2, y1, y2, radius) do
    distance(x1, x2, y1, y2) < radius + @bullet_radius
  end

  defp inner_filter(x1, y1, %{x: x2, y: y2, radius: radius}) do
    did_collide(x1, x2, y1, y2, radius)
  end

  defp filter_fn(x1, y1, obj = %{x: _x2, y: _y2, radius: _radius}) do
    inner_filter(x1, y1, obj)
  end

  defp filter_fn(x1, y1, agent_pid) do
    inner_filter(x1, y1, Agent.get(agent_pid, &(&1)))
  end

  def calculate_collisions(%{x: x1, y: y1 }, objects) do
    Enum.filter(objects, fn object ->
      filter_fn(x1, y1, object)
    end)
  end

  def decrement_lifetime(state) do
    Map.update!(state, :lifetime, &(&1 - 1))
  end

  def tick(%{lifetime: 0}, _) do
    die(self())
  end

  def tick(state) do
    state |>
    bullet_update |>
    decrement_lifetime
  end

  def die(_pid) do
    nil
  end

end
