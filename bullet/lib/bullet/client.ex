defmodule Bullet.Client do

  alias Bullet.Impl, as: Impl

  def tick(pid, timestamp, objects) do
    Agent.get_and_update(pid, fn state ->
      state = Impl.tick(state, timestamp, objects)
      {state, state}
    end)
  end
end
