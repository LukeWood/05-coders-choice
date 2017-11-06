defmodule PlayerTest do
  use ExUnit.Case

  import Player

  test "Create a player" do
    pid = start()
    assert pid != nil
  end

  test "move our player" do
    %{x: x, y: y, direction: dir, moving: moving} = start() |>
    action(:left) |>
    tick() |>
    tick() |>
    action(:up) |>
    tick() |>
    tick() |>
    action(:stop) |>
    tick() |>
    tick() |>
    peek()

    assert x == -2
    assert y == -2
    assert dir == :up
    assert moving == false
  end
end
