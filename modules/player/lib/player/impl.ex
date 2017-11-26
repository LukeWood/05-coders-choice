defmodule Player.Impl do

  def start_x do
    Application.get_env(:player, :radius) + :rand.uniform(Application.get_env(:world, :width) - 2*Application.get_env(:player, :radius))
  end

  def start_y do
    Application.get_env(:player, :radius) + :rand.uniform(Application.get_env(:world, :height) - 2*Application.get_env(:player, :radius))
  end

  defp shoot_if_shooting(player = %{shoot: true, reload_time: r}) when r <= 0 do
    Bullet.new(player)
    Map.put(player, :shoot, false) |>
    Map.put(:reload_time, Application.get_env(:player, :reload))
  end

  defp shoot_if_shooting(player) do
    player
  end

  def tick(player) do
    player |>
    Move.move |>
    shoot_if_shooting |>
    Map.update!(:reload_time, fn r -> r - 1 end) |>
    update_timestamp
  end

  def update_timestamp(player) do
    Map.put(player, :timestamp, :erlang.system_time(:milli_seconds))
  end

  def action(player, :shoot) do
    Map.put(player, :shoot, true)
  end

  def action(player, :stop) do
    Map.put(player, :moving, false)
  end

  def action(player, direction) do
    player |>
    Map.put(:moving, true) |>
    Map.put(:direction, direction)
  end

end

defimpl Move, for: Player do

  defp valid_move?(%{x: x, direction: :left}) do
    !(x <= Application.get_env(:player, :radius))
  end
  defp valid_move?(%{x: x, direction: :right}) do
    !(x >= Application.get_env(:world, :width) - Application.get_env(:player, :radius))
  end
  defp valid_move?(%{y: y, direction: :up}) do
    !(y <= Application.get_env(:player, :radius))
  end
  defp valid_move?(%{y: y, direction: :down}) do
    !(y >= Application.get_env(:world, :height) - Application.get_env(:player, :radius))
  end
  defp valid_move?(_) do
    true
  end

  defp apply_move(player = %{moving: false}) do
    player
  end
  defp apply_move(player = %{x: x, direction: :left}) do
    Map.put(player, :x, x - Application.get_env(:player, :speed))
  end
  defp apply_move(player = %{x: x, direction: :right}) do
    Map.put(player, :x, x + Application.get_env(:player, :speed))
  end
  defp apply_move(player = %{y: y, direction: :up}) do
    Map.put(player, :y, y - Application.get_env(:player, :speed))
  end
  defp apply_move(player = %{y: y, direction: :down}) do
    Map.put(player, :y, y + Application.get_env(:player, :speed))
  end
  defp apply_move(player) do
    player
  end

  def move(player) do
    if valid_move?(player) do
      apply_move(player)
    else
      player
    end
  end
end
