defmodule ImplTest.Impl do
  use ExUnit.Case

  alias PlayerServer.Impl, as: Impl

  test "add player to registry" do
    players = Impl.zero_state |>
    Impl.add_player("Luke", %PlayerServer.Player{}) |>
    Map.get(:players) |>
    Enum.count
    assert players == 1
  end

  test "players can move up" do
    player = Impl.zero_state |>
    Impl.add_player("Luke", %PlayerServer.Player{}) |>
    Impl.add_action("Luke", :up) |>
    Impl.tick(nil, 0) |>
    Map.get(:players) |>
    Map.get("Luke")
    assert player.direction == :up
    assert player.y == -1
  end

end
