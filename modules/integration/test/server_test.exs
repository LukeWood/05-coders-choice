defmodule IntegrationTest do
  import Player

  use ExUnit.Case

  test "Worlds track bullets" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new_zero_state world

    # PLAYER ACTIONS
    action(p1, :right)
    :timer.sleep(100)
    action(p1, :shoot)
    :timer.sleep(100)
    bullets = World.bullets(world) |> Enum.count
    assert bullets == 1
    :timer.sleep(1000)
  end

  test "Player 1 lives, Player 2 dies" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new_zero_state world
    {:ok, p2} = Player.new_zero_state world

    # Player Actions
    action(p1, :right)
    :timer.sleep(500)
    action(p1, :left)
    :timer.sleep(100)
    action(p1, :stop)
    action(p1, :shoot)
    :timer.sleep(800)

    assert Process.alive?(p1)
    assert !Process.alive?(p2)
  end

  test "Dead men shoot no bullets" do
    {:ok, world} = World.new
    {:ok, p1} = Player.new_zero_state world
    {:ok, p2} = Player.new_zero_state world

    # PLAYER ACTIONS
    action(p1, :right)
    :timer.sleep(500)
    action(p1, :left)
    action(p1, :stop)
    action(p1, :shoot)
    :timer.sleep(800)
    action(p2, :shoot)
    :timer.sleep(800)

    assert Process.alive?(p1)
    assert !Process.alive?(p2)
  end

end
