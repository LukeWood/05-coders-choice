defmodule GameServerTest do
  use ExUnit.Case

  test "instantiate game server" do
    pid = GameServer.new_server
    assert pid != nil
  end

  test "add player through game server" do

  end

  test "add bullet through game server" do
    
  end


end
