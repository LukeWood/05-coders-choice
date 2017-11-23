defmodule IntegrationTest do
  import Player

  use ExUnit.Case
  test "Player 1 lives, Player 2 dies" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new world
    {:ok, p2} = Player.new world

    # Player Actions
    action(p1, :right)
    :timer.sleep(1000)
    action(p1, :left)
    action(p1, :stop)
    action(p1, :shoot)
    :timer.sleep(1300)

    assert Process.alive?(p1)
    assert !Process.alive?(p2)
  end

  test "We can't shoot ourself" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new world

    # PLAYER ACTIONS
    action(p1, :right)
    :timer.sleep(100)
    action(p1, :shoot)
    :timer.sleep(1000)

    assert Process.alive?(p1)
  end

  test "Dead men shoot no bullets" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new world
    {:ok, p2} = Player.new world

    # PLAYER ACTIONS
    action(p1, :right)
    :timer.sleep(1000)
    action(p1, :left)
    action(p1, :stop)
    action(p1, :shoot)
    :timer.sleep(1300)
    action(p2, :shoot)
    :timer.sleep(1300)

    assert Process.alive?(p1)
    assert !Process.alive?(p2)
  end

end
