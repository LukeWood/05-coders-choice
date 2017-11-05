defmodule ImplTest.Server do
  use ExUnit.Case

  import PlayerServer

  test "Instantiate new PlayerServer instance" do
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

  test "Adding a bullet works through PlayerServer" do
    pid = new_registry()

    agent_pid = Agent.start(fn -> 0 end)
    callback = fn (player, _) ->
      Agent.update(agent_pid, fn x -> x+1 end)
    end

    tick(pid, callback, 0)
    add_player(pid, "Luke")
    player_input(pid, "Luke", :shoot)
    tick(pid, callback, 1)
    assert Agent.get(agent_pid, fn x -> x end) == 1
  end

end
