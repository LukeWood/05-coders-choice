defmodule Bullet.Impl do

  @bullet_speed 1

  defp move_bullet(bullet = %{direction: :left}) do
    Map.update!(bullet, :x, fn x -> x - @bullet_speed end)
  end
  defp move_bullet(bullet = %{direction: :right}) do
    Map.update!(bullet, :x, fn x -> x + @bullet_speed end)
  end
  defp move_bullet(bullet = %{direction: :up}) do
    Map.update!(bullet, :y, fn y -> y - @bullet_speed end)
  end
  defp move_bullet(bullet = %{direction: :down}) do
    Map.update!(bullet, :y, fn y -> y + @bullet_speed end)
  end

  def distance(x1, x2, y1, y2) do
    :math.sqrt(
      :erlang.abs(:math.pow(x1-x2, 2) - :math.pow(y1-y2, 2))
    )
  end

  defp did_collide(x1, x2, y1, y2, radius) do
    distance(x1, x2, y1, y2) < radius + Bullet.radius
  end

  defp inner_filter(x1, y1, %{x: x2, y: y2, radius: radius}) do
    did_collide(x1, x2, y1, y2, radius)
  end
  defp find_collisions(x1, y1, pid) do
    inner_filter(x1, y1, GenServer.call(pid, {:peek}))
  end

  def calculate_collisions(%{x: x1, y: y1 }, players) do
    Enum.filter(players, &Process.alive?/1) |>
    Enum.filter(fn pid ->
      find_collisions(x1, y1, pid)
    end)
  end
  def apply_collisions(colls, world) do
    Enum.filter(colls, &Process.alive?/1) |>
    Enum.map(fn col_pid ->
      World.remove_player(world, col_pid)
    end)
  end

  def decrement_lifetime(state) do
    Map.update!(state, :lifetime, &(&1 - 1))
  end

  def tick(%{lifetime: 0}, _) do
    die(self())
  end

  def tick(state = %{world: nil}) do
    state |>
    move_bullet |>
    decrement_lifetime
  end

  def tick(state = %{world: world}) do
    calculate_collisions(state, World.get_players(world)) |>
    apply_collisions(world)

    state |>
    move_bullet |>
    # get players, kill player processes
    decrement_lifetime
  end

  def die(_pid) do
    nil
    # Bullet.Supervisor.kill(self())
  end

end
