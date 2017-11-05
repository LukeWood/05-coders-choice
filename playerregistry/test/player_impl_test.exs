defmodule ImplTest.Impl do
  use ExUnit.Case

  alias PlayerRegistry.Impl, as: Impl

  test "add player to registry" do
    players = Impl.zero_state |>
    Impl.add_player(%PlayerRegistry.Player{}) |>
    Map.get(:players) |>
    Enum.count
    assert players == 1
  end

  test "players can move" do
    player = Impl.zero_state |>
    Impl.add_player(%PlayerRegistry.Player{}) |>
    #|> add action
    Impl.tick(nil, 0) |>
    Map.get(:players) |>
    Enum.at(0)
  end

end
