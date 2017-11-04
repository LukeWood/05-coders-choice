defmodule BulletRegistry do

  defdelegate tick(),                       to: BulletRegistry.Client
  defdelegate add_bullet(x, y, direction),  to: BulletRegistry.Client
  defdelegate peek(),                       to: BulletRegistry.Client

  def start(_type, _opts) do
    BulletRegistry.Supervisor.start_link
  end

end
