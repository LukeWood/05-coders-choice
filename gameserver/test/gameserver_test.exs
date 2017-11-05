defmodule GameServerTest do
  use ExUnit.Case

  test "instantiate game server" do
    pid = GameServer.new_server
    assert pid != nil
  end
end
