defmodule LobbyserverTest do
  use ExUnit.Case

  test "we can add a lobby successfully" do
    assert LobbyServer.new_lobby("Luke") == :ok
  end

  test "the lobby added is associated with an Agent" do
    LobbyServer.new_lobby("Luke")
    assert {:ok, _pid} = LobbyServer.get_lobby("Luke")
  end

end
