defmodule BulletRegistry do

  defdelegate tick(),              to: BulletRegistry.Client
  defdelegate add_bullet(x, y, direction),  to: BulletRegistry.Client

  def start(_type, _opts) do
    GenServer.start_link(BulletRegistry.Server,
      BulletRegistry.Impl.new_registry,
      name: BulletRegistry)
    BulletRegistry.ChangeList.start_link
  end

end
