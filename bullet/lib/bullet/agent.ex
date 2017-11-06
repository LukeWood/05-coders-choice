defmodule Bullet.Agent do

  alias Bullet.Impl, as: Impl

  def create_event_handler(pid) do
    fn _ ->
      tick(pid)
    end
  end

  def tick(pid) do
    Agent.update(pid, &Impl.tick/1)
    pid
  end

  def tick(pid, objects) do
    Agent.update(pid, fn state ->
      Impl.tick(state, objects)
    end)
    pid
  end

  def peek(pid) do
    Agent.get(pid, &(&1))
  end

end
