defmodule BulletRegistry do

  defdelegate tick(timestamp, id\\BulletRegistry),                         to: BulletRegistry.Client
  defdelegate add_bullet(x, y, direction, timestamp, pid\\BulletRegistry),  to: BulletRegistry.Client
  defdelegate peek(pid\\BulletRegistry),                         to: BulletRegistry.Client

  defdelegate new_registry(),               to: BulletRegistry.Supervisor

  def start(_type, _opts) do

  end

end
