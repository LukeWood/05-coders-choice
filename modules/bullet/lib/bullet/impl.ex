defmodule Bullet.Impl do

  defp distance(x1, x2, y1, y2) do
    dx = x1-x2
    dy = y1-y2
    (dx*dx) + (dy*dy)
  end

  defp did_collide?(x1, x2, y1, y2) do
    rad = Application.get_env(:player, :radius) + Application.get_env(:bullet, :radius)
    distance(x1, x2, y1, y2) < rad*rad
  end

  defp inner_filter(x1, y1, %{x: x2, y: y2}) do
    did_collide?(x1, x2, y1, y2)
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

  defp reverse(state = %{direction: :left}) do
    Map.put(state, :direction, :right)
  end
  defp reverse(state = %{direction: :right}) do
    Map.put(state, :direction, :left)
  end
  defp reverse(state = %{direction: :up}) do
    Map.put(state, :direction, :down)
  end
  defp reverse(state = %{direction: :down}) do
    Map.put(state, :direction, :up)
  end

  def tick(state = %{x: x, y: y}) do
    if(x > Application.get_env(:world, :width) || y > Application.get_env(:world, :height) || y < 0 || x < 0) do
      reverse(state) |> inner_tick()
    else
      inner_tick(state)
    end
  end

  def inner_tick(%{lifetime: 0}, _) do
    die(self())
  end

  def inner_tick(state = %{world: nil}) do
    update_bullet(state)
  end

  def inner_tick(state = %{world: world}) do
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
    Map.update!(bullet, :x, fn x -> x - Application.get_env(:bullet, :speed) end)
  end
  def move(bullet = %{direction: :right}) do
    Map.update!(bullet, :x, fn x -> x + Application.get_env(:bullet, :speed) end)
  end
  def move(bullet = %{direction: :up}) do
    Map.update!(bullet, :y, fn y -> y - Application.get_env(:bullet, :speed) end)
  end
  def move(bullet = %{direction: :down}) do
    Map.update!(bullet, :y, fn y -> y + Application.get_env(:bullet, :speed) end)
  end
end
