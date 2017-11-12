defmodule PlayerTest do
  use ExUnit.Case
  import Player

  def tick() do
    Observable.emit(Clock, {:tick})
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

    test "move" do
      {:ok, pid} = new()
      action(pid, :left)
      tick()
      assert peek(pid) |> Map.get(:x) == -1
    end

  end

end
