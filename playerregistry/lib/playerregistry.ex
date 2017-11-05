defmodule PlayerRegistry do

  defdelegate tick(pid\\PlayerRegistry),                         to: PlayerRegistry.Client

  defdelegate new_registry(),                                    to: PlayerRegistry.Supervisor

  def start(_type, _opts) do
    PlayerRegistry.Supervisor.start_child_registry
  end

end
