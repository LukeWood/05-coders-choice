defmodule LobbyserverTest do
  use ExUnit.Case

  test "create a lobby" do
    assert LobbyServer.new_lobby("Luke") == :ok
  end

end
