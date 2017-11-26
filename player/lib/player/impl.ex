defmodule Player.Impl do

  def start_x do
    Constants.player_radius + :rand.uniform(Constants.game_width - 2*Constants.player_radius)
  end

  def start_y do
    Constants.player_radius + :rand.uniform(Constants.game_height - 2*Constants.player_radius)
  end

  defp shoot_if_shooting(player = %{shoot: true, reload_time: r}) when r <= 0 do
    Bullet.new(player)
    Map.put(player, :shoot, false) |>
    Map.put(:reload_time, Constants.reload_time)
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
    Map.put(player, :timestamp, :erlang.system_time(:millisecond))
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
    !(x <= Constants.player_radius)
  end
  defp valid_move?(%{x: x, direction: :right}) do
    !(x >= Constants.game_width - Constants.player_radius)
  end
  defp valid_move?(%{y: y, direction: :up}) do
    !(y <= Constants.player_radius)
  end
  defp valid_move?(%{y: y, direction: :down}) do
    !(y >= Constants.game_height - Constants.player_radius)
  end
  defp valid_move?(_) do
    true
  end

  defp apply_move(player = %{moving: false}) do
    player
  end
  defp apply_move(player = %{x: x, direction: :left}) do
    Map.put(player, :x, x - Constants.player_speed)
  end
  defp apply_move(player = %{x: x, direction: :right}) do
    Map.put(player, :x, x + Constants.player_speed)
  end
  defp apply_move(player = %{y: y, direction: :up}) do
    Map.put(player, :y, y - Constants.player_speed)
  end
  defp apply_move(player = %{y: y, direction: :down}) do
    Map.put(player, :y, y + Constants.player_speed)
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
