defmodule PlayerTest do
  use ExUnit.Case

  import Player

  test "Create a player" do
    {:ok, pid} = new()
    assert pid != nil
  end

  test "Actions update our player" do
    {:ok, pid} = new()
    action(pid, :left)
    assert peek(pid) |> Map.get(:direction) == :left
  end
end
