defmodule BulletRegistry do

  defdelegate tick(state, timestamp),              to: BulletRegistry.Impl
  defdelegate tick(state, timestamp, new_bullets), to: BulletRegistry.Impl
  defdelegate new_registry,                        to: BulletRegistry.Impl

  def start_link do

  end

end
