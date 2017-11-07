defmodule World.Impl do

  def wait_for p do
    Task.await(p)
  end

  def tick(state = %{bullets: bullets, players: players}) do
    collisions = Enum.map(bullets, fn bullet ->
      Task.async(fn -> Bullet.tick(bullet) |> Bullet.find_collisions(players) end)
    end)

    Enum.map(players, fn player ->
      Task.async(fn -> Player.tick(player) end)
    end) |>
    Enum.map(&wait_for/1)

    collisions = collisions |> Enum.map(&wait_for/1) |> Enum.into(MapSet)

    players = Enum.filter(players, fn player ->
      MapSet.member?(collisions, player)
    end)

    state |>
    Map.put(:players, players)
  end

end
