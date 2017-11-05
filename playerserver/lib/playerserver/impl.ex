defmodule PlayerServer.Impl do

  defp apply_actions(state) do
    actions = state.actions
    players = Enum.reduce(actions, state.players,
      fn({player_id, action}, players) ->
        Map.update!(players, player_id,
          fn player ->
            Map.put(player, :direction, action)
          end)
      end)
    Map.put(state, :players, players)
  end

  defp shoot(player, shoot_callback, timestamp) do
    shoot_callback.(player, timestamp)
  end

  defp apply_shots(state, shoot_callback, timestamp) do
    state.shots |>
    #Enum.filter(fn {shot, _} -> Map.get(state.players, shot).reload_time > timestamp end) |>
    Enum.map(
      fn {player_name, _} ->
        shoot(Map.get(state.players, player_name),
        shoot_callback, timestamp)
      end)
    Map.put(state, :shots, %{})
  end

  @player_speed 1
  defp move_player(player = %{x: x, direction: :left}) do
    Map.put(player, :x, x - @player_speed)
  end
  defp move_player(player = %{x: x, direction: :right}) do
    Map.put(player, :x, x + @player_speed)
  end
  defp move_player(player = %{y: y, direction: :up}) do
    Map.put(player, :y, y - @player_speed)
  end
  defp move_player(player = %{y: y, direction: :down}) do
    Map.put(player, :y, y + @player_speed)
  end
  defp move_player(player) do
    player
  end

  defp apply_movements(state) do
    new_players = Enum.map(state.players,
      fn{player_id, player} -> {player_id, move_player(player)} end) |>
      Enum.into(%{})
    Map.put(state, :players, new_players)
  end

  def tick(state, shoot_callback, timestamp) do
    state |>
    apply_actions |>
    apply_shots(shoot_callback, timestamp) |>
    apply_movements |>
    Map.put(:timestamp, timestamp)
  end

  def add_player(state, player_id, player) do
    Map.update!(state, :players, fn players -> Map.put(players, player_id, player) end)
  end

  def add_shot(state, player) do
    Map.update!(state, :shots, fn shots -> Map.put(shots, player, :shoot) end)
  end

  def add_action(state, player_id, action) do
    Map.update!(state, :actions,
     fn actions -> Map.put(actions,
      player_id,
      action
      ) end
    )
  end

  def zero_state do
    %{
      players:    %{},
      actions:    %{},
      shots:      %{},
      timestamp:  0
    }
  end


end
