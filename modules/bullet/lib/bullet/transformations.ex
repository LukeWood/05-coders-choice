defmodule Bullet.Transformations do

  def dx do
    Application.get_env(:bullet, :radius) + Application.get_env(:player, :radius) + 2*Application.get_env(:bullet, :speed)
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
