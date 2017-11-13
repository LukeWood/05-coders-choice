defmodule IntegrationTest do
  
  use ExUnit.Case
  test "Player 1 lives, Player 2 dies" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new world
    {:ok, p2} = Player.new world
    import Player
    action(p1, :left)
    :timer.sleep(1000)
    action(p1, :right)
    action(p1, :stop)
    action(p1, :shoot)
    :timer.sleep(1300)

    assert Process.alive?(p1)
    assert !Process.alive?(p2)
  end

end
