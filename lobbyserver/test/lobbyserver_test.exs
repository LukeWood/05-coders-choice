defmodule LobbyserverTest do
  use ExUnit.Case

  test "retrieving a non-existent lobby returns nil" do
    assert LobbyServer.get_lobby("luke") == nil
  end

  test "we can add a lobby successfully" do
    assert LobbyServer.new_lobby("Luke") == :ok
  end

  test "the lobby added is associated with an Agent" do
    LobbyServer.new_lobby("Luke")
    assert {:ok, _pid} = LobbyServer.get_lobby("Luke")
  end

  test "deleting a lobby is successful" do
    LobbyServer.new_lobby("luke")
    assert {:ok, _pid} = LobbyServer.get_lobby("Luke")
    LobbyServer.delete_lobby("luke")
    assert nil == LobbyServer.get_lobby("luke")
  end

end
