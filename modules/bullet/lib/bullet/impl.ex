defmodule Bullet.Impl do

  def distance(x1, x2, y1, y2) do
    :math.sqrt(
      :erlang.abs((x1-x2)*(x1-x2) - (y1-y2)*(y1-y2))
    )
  end

  defp did_collide?(x1, x2, y1, y2, radius) do
    distance(x1, x2, y1, y2) < radius + Constants.bullet_radius
  end

  defp inner_filter(x1, y1, %{x: x2, y: y2, radius: radius}) do
    did_collide?(x1, x2, y1, y2, radius)
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

  def update_bullet(bullet) do
    bullet |>
    Move.move |>
    decrement_lifetime
  end

  def tick(%{lifetime: 0}, _) do
    die(self())
  end

  def tick(state = %{world: nil}) do
    update_bullet(state)
  end

  def tick(state = %{world: world}) do
    calculate_collisions(state, World.players(world)) |>
    apply_collisions(world)
    update_bullet(state)
  end

  def die(_state = %{world: world}) do
    World.remove_bullet(world, self())
    nil
  end

end

defimpl Move, for: Bullet do
  def move(bullet = %{direction: :left}) do
    Map.update!(bullet, :x, fn x -> x - Constants.bullet_speed end)
  end
  def move(bullet = %{direction: :right}) do
    Map.update!(bullet, :x, fn x -> x + Constants.bullet_speed end)
  end
  def move(bullet = %{direction: :up}) do
    Map.update!(bullet, :y, fn y -> y - Constants.bullet_speed end)
  end
  def move(bullet = %{direction: :down}) do
    Map.update!(bullet, :y, fn y -> y + Constants.bullet_speed end)
  end
end
