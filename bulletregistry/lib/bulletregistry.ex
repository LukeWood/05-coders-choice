defmodule BulletRegistry do

  defdelegate tick(pid\\BulletRegistry),                         to: BulletRegistry.Client
  defdelegate add_bullet(x, y, direction, pid\\BulletRegistry),  to: BulletRegistry.Client
  defdelegate peek(pid\\BulletRegistry),                         to: BulletRegistry.Client

  defdelegate new_registry(),               to: BulletRegistry.Supervisor

  def start(_type, _opts) do
    BulletRegistry.Supervisor.start_child_registry
  end

end
