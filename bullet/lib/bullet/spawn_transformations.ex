defmodule Bullet.SpawnTransformations do

  def dx do
    Constants.bullet_radius + Constants.player_radius + 1
  end

  def transform_player(player = %{direction: :left}) do
    Map.update!(player, :x, fn x -> x - dx() end)
  end
  def transform_player(player = %{direction: :right}) do
    Map.update!(player, :x, fn x -> x + dx() end)
  end
  def transform_player(player = %{direction: :up}) do
    Map.update!(player, :y, fn y -> y - dx() end)
  end
  def transform_player(player = %{direction: :down}) do
    Map.update!(player, :y, fn y -> y + dx() end)
  end

end
