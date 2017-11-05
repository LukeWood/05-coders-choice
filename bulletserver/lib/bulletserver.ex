defmodule BulletServer do

  defdelegate tick(pid, timestamp),                         to: BulletServer.Client
  defdelegate add_bullet(pid, x, y, direction, timestamp),  to: BulletServer.Client
  defdelegate peek(pid),                                    to: BulletServer.Client

  defdelegate new_registry(),               to: BulletServer.Supervisor

  def start(_type, _opts) do

  end

end
