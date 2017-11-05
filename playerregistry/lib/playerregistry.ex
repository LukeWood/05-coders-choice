defmodule PlayerRegistry do

  defdelegate tick(bullet_pid, timestamp, pid\\PlayerRegistry),                         to: PlayerRegistry.Client

  defdelegate new_registry(),                                    to: PlayerRegistry.Supervisor

  def start(_type, _opts) do

  end

end
