defmodule BulletRegistry.ChangeList do

  @name :BulletChangeList

  def start_link() do
    Agent.start_link(fn -> [] end)
  end
  def start_link(name) do
    Agent.start_link(fn -> [] end, name: name)
  end

  def add(item, pid\\@name) do
    Agent.update(pid, fn list -> [item | list] end)
  end

  def flush_changes(pid\\@name) do
    Agent.get_and_update(pid, fn state -> {state, []} end)
  end

end
