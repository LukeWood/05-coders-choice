defmodule PlayerRegistry.Impl do

  alias PlayerRegistry.Player, as: Player

  defp apply_actions(state) do
    actions = state.actions
    players = Enum.reduce(actions, state.players,
      fn(action, players) ->
        Enum.update(players, action.player_number, fn player ->
          Map.put(player, action.direction)
        end)
      end)
    Map.put(state, :players, players)
  end

  defp shoot(player, bullet_pid) do

  end

  defp apply_shots(state, bullet_pid) do
    
  end

  @player_speed 1

  defp move_player(player = {x: x, direction: :left}) do
    Map.put(player, :x, x - @player_speed)
  end
  defp move_player(player = {x: x, direction: :right}) do
    Map.put(player, :x, x + @player_speed)
  end
  defp move_player(player = {y: y, direction: :up}) do
    Map.put(player, :y, x - @player_speed)
  end
  defp move_player(player = {y: y, direction: :down}) do
    Map.put(player, :y, x + @player_speed)
  end

  defp apply_movements(state) do
    new_players = Enum.map(state, &move_player/1)
    Map.put(state, :players, new_players)
  end


  def tick(state, bullet_pid, timestamp) do
    state |>
    apply_actions |>
    apply_shots |>
    apply_movements
  end

  def zero_state do
    %{
      state:    %{},
      actions:  %{},
      shots:    %{}
    }
  end

end
