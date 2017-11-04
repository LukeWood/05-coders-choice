defmodule BulletRegistry.ChangeList do

  @name :BulletChangeList

  def start_link() do
    start_link(@name)
  end
  def start_link(name) do
    Agent.start_link(fn -> [] end, name: name)
  end

  def add(item) do
    add(item, @name)
  end
  def add(item, name) do
    Agent.update(name, fn list -> [list | item] end)
  end

  def flush_changes(name) do
    Agent.get_and_update(name, fn state -> {state, []} end)
  end
  def flush_changes() do
    flush_changes(@name)
  end

end
