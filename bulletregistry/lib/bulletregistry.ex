defmodule BulletRegistry do

  defdelegate tick(),              to: BulletRegistry.Client
  defdelegate add_bullet(bullet),  to: BulletRegistry.Client
  defdelegate new_registry,        to: BulletRegistry.Client

  def start(_type, _opts) do
    GenServer.start_link(BulletRegistry.Server, [], name: BulletRegistry)
    BulletRegistry.ChangeList.start_link
    BulletRegistry.StateMaintainer.start_link
  end

end
