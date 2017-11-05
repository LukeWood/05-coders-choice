defmodule ImplTest.Server do
  use ExUnit.Case

  import PlayerRegistry

  test "Instantiate new PlayerRegistry instance" do
    pid = new_registry()
    assert pid != nil
  end

  test "Tick works through the server" do
    pid = new_registry()
    tick(pid, nil, 1000)
    assert peek(pid).timestamp == 1000
  end

  test "Players can take actions" do
    pid = new_registry()
    tick(pid, nil, 1000)
    add_player(pid, "Luke")
    player_input(pid, "Luke", :left)
    tick(pid, nil, 1000)

    player = peek(pid).players |>
     Map.get("Luke")

    assert player.direction == :left
    assert player.x == -1
    assert player.y == 0

  end

end
