defmodule Client.Test do
  use ExUnit.Case

  test "Client can manage a connection to a world" do
    %{players: players, bullets: bullets} = Client.state
    assert players == []
    assert bullets == []
  end

end
