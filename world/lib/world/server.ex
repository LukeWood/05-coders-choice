defmodule World.Server do
  use GenServer

#    defstruct [
#      bullets: [],
#      players: [],
#    ]


  def start do
    GenServer.start_link(World.Server, %World{})
  end

  def wait_for p do
    Task.await(p)
  end

  def handle_cast({:tick}, %{bullets: bullets, players: players}) do
    player_collisions = Enum.map(bullets, fn bullet ->
      Task.async(fn -> Bullet.tick(bullet) |> Bullet.find_collisions(players) end)
    end)

    Enum.map(players, fn player -> Task.async(fn -> ) end) end ) |> wait_for
    player_collisions = player_collisions |> Enum.map(player_collisions, wait_for)


  end

end
