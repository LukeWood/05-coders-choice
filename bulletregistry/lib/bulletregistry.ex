defmodule BulletRegistry do

  defdelegate tick(state, timestamp),              to: BulletRegistry.Impl
  defdelegate tick(state, timestamp, new_bullets), to: BulletRegistry.Impl
  defdelegate new_registry,                        to: BulletRegistry.Impl

  def start_link do
    GenServer.start_link(BulletRegistry.Server, [], name: BulletRegistry)
    BulletRegistry.ChangeList.start_link
    BulletRegistry.StateMaintainer.start_link
  end

end
