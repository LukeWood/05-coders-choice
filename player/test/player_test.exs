defmodule PlayerTest do
  use ExUnit.Case
  import Player

  defp tick() do
    Observable.emit(Clock, {:tick})
  end

  defp default_x() do
    %Player{} |> Map.get(:x)
  end

  defp default_y() do
    %Player{} |> Map.get(:y)
  end

  describe "Players can be " do
    test "created" do
      {:ok, pid} = new()
      assert pid != nil
    end

    test "associated with a world" do
      {:ok, world} = Agent.start_link(fn -> [] end)
      {:ok, pid} = new(world)
      assert pid != nil
    end
  end

  describe "Players will " do

    test "respond to updates" do
      {:ok, pid} = new()
      action(pid, :left)
      assert peek(pid) |> Map.get(:direction) == :left
    end

    test "move right" do
      {:ok, pid} = new()
      action(pid, :right)
      tick()
      assert peek(pid) |> Map.get(:x) == default_x() + Constants.player_speed
    end

    test "move left" do
      {:ok, pid} = new()
      action(pid, :right)
      tick()
      tick()
      assert peek(pid) |> Map.get(:x) == default_x() + 2*Constants.player_speed
      action(pid, :left)
      tick()
      assert peek(pid) |> Map.get(:x) == default_x() + Constants.player_speed
    end

    test "move down" do
      {:ok, pid} = new()
      action(pid, :down)
      tick()
      assert peek(pid) |> Map.get(:y) == default_y() + Constants.player_speed
    end

    test "move up" do
      {:ok, pid} = new()
      action(pid, :down)
      tick()
      tick()
      assert peek(pid) |> Map.get(:y) == default_y() + 2*Constants.player_speed
      action(pid, :up)
      tick()
      assert peek(pid) |> Map.get(:y) == default_y() + Constants.player_speed
    end



    test "not move past the world's boundaries" do
      {:ok, pid} = new()
      action(pid, :left)
      tick()
      assert peek(pid) |> Map.get(:x) == default_x()
    end

  end

end
