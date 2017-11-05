defmodule PlayerRegistry do

  alias PlayerRegistry.Client, as: Client

  defdelegate tick(pid, bullet_pid, timestamp),     to: Client
  defdelegate peek(pid),                            to: Client
  defdelegate player_input(pid, player_id, action), to: Client
  defdelegate add_player(pid, player_id),           to: Client
  defdelegate new_registry(),                       to: PlayerRegistry.Supervisor

  def start(_type, _opts) do
    
  end

end
