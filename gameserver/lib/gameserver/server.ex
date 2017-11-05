defmodule GameServer.Server do
  use GenServer

  def handle_call({:tick}, _from, state = %{
      bullet_pid: bullet_pid,
      player_pid: player_pid,
      bullet_callback: bullet_callback,
      timestamp: _last_timestamp
      }) do

    timestamp = :os.system_time(:millisecond)

    bullet_state = BulletServer.tick(bullet_pid, timestamp)
    player_state = PlayerServer.tick(player_pid, bullet_callback, timestamp)
    states = %{
      bullets: bullet_state,
      players: player_state
    }

    {:reply, states, Map.put(state, :timestamp, timestamp)}
  end

  def handle_call({:peek}, _from, state = %{
    bullet_pid: bullet_pid,
    player_pid: player_pid,
    }) do
      bullet_state = BulletServer.peek(bullet_pid)
      player_state = PlayerServer.peek(player_pid)
      states = %{
        bullets: bullet_state,
        players: player_state
      }
    {:reply, states, state}
  end


  def handle_call({:add_player, name}, _from, state = %{player_pid: player_pid}) do
    PlayerServer.add_player(player_pid, name)
    {:reply, :ok, state}
  end

  def handle_cast({:player_input, from, action}, state = %{player_pid: player_pid}) do
    PlayerServer.player_input(player_pid, from, action)
    {:noreply, state}
  end
end
