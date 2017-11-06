defmodule Player.Impl do

  @player_speed 1
  defp move_player(player = %{moving: false}) do
    player
  end
  defp move_player(player = %{x: x, direction: :left}) do
    Map.put(player, :x, x - @player_speed)
  end
  defp move_player(player = %{x: x, direction: :right}) do
    Map.put(player, :x, x + @player_speed)
  end
  defp move_player(player = %{y: y, direction: :up}) do
    Map.put(player, :y, y - @player_speed)
  end
  defp move_player(player = %{y: y, direction: :down}) do
    Map.put(player, :y, y + @player_speed)
  end
  defp move_player(player) do
    player
  end

  defp shoot_if_shooting(player = %{shoot: true}) do
    # SHOOT
    player
  end

  defp shoot_if_shooting(player) do
    player
  end

  def tick(player) do
    player |>
    move_player |>
    shoot_if_shooting
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
