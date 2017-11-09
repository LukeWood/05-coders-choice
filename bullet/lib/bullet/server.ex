defmodule Bullet.Server do

  alias Bullet.Impl, as: Impl

  def handle_cast({:tick}, state) do
    new_state = Impl.tick(state)
    {:noreply, new_state}
  end

  def handle_call({:find_collisions, objects}, state) do
    collisions = find_collisions(state, objects)
    {:reply, collisions}
  end

end
