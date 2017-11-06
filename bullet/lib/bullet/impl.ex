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
      :math.pow(x1-x2, 2) - :math.pow(y1-y2, 2)
    )
  end

  def did_collide(x1, x2, y1, y2, radius) do
    distance(x1, x2, y1, y2) < radius + @bullet_radius
  end

  def calculate_colissions(%{x: x1, y: y1 }, objects) do
    Enum.filter(objects, fn %{x: x2, y: y2, radius: radius} ->
      did_collide(x1, x2, y1, y2, radius)
    end)
  end

  def handle_colissions(_colissions) do

  end

  def decrement_lifetime(state) do
    Map.update!(state, :lifetime, &(&1 - 1))
  end

  def tick(%{lifetime: 0}, _) do
    die(self())
  end

  def tick(state, objects) do
    state = state |> tick

    calculate_colissions(state, objects) |>
    handle_colissions

    state
  end

  def tick(state) do
    state |>
    bullet_update |>
    decrement_lifetime
  end

  def die(pid) do
    nil
  end

end
