defmodule BulletRegistry do

  defdelegate tick(),                       to: BulletRegistry.Client
  defdelegate add_bullet(x, y, direction),  to: BulletRegistry.Client
  defdelegate peek(),                       to: BulletRegistry.Client

  defdelegate new_registry(),               to: BulletRegistry.Supervisor
  
  def start(_type, _opts) do
    BulletRegistry.Supervisor.start_child_registry
  end

end
