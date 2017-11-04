defmodule BulletRegistry.Impl do

  def bulletUpdate(bullet) do

  end

  def tick(state, timestamp, changes) do
    new_bullets = Enum.filter(state.bullets, &(&1.expiration > timestamp))
    Map.update!(state, :bullets, bulletUpdate)
  end

end
