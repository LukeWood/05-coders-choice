defmodule BulletServer do

  defdelegate tick(timestamp, id\\BulletServer),                         to: BulletServer.Client
  defdelegate add_bullet(x, y, direction, timestamp, pid\\BulletServer),  to: BulletServer.Client
  defdelegate peek(pid\\BulletServer),                         to: BulletServer.Client

  defdelegate new_registry(),               to: BulletServer.Supervisor

  def start(_type, _opts) do

  end

end
