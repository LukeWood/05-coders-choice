defmodule GameServerTest do
  use ExUnit.Case

  test "instantiate game server" do
    pid = GameServer.new_server
    assert pid != nil
  end

  test "add player through game server" do

  end

  test "add bullet through game server" do
    pid = GameServer.new_server
    GameServer.tick(pid)
    GameServer.add_player(pid, "Luke")
    GameServer.player_input(pid, "Luke", :shoot)
    GameServer.tick(pid)
    GameServer.tick(pid)
    num_bullets = GameServer.peek(pid).bullets |>
    Map.get(:bullets) |>
    Enum.count
    assert num_bullets == 1
  end


end
