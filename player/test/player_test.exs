defmodule PlayerTest do
  use ExUnit.Case
  import Player

  def tick() do
    Observable.emit(Clock, {:tick})
  end

  test "Create a player" do
    {:ok, pid} = new()
    assert pid != nil
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
