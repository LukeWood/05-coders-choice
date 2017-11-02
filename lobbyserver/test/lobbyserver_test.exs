defmodule LobbyserverTest do
  use ExUnit.Case
  doctest Lobbyserver

  test "greets the world" do
    assert Lobbyserver.hello() == :world
  end
end
