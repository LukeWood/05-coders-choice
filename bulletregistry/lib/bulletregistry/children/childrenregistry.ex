defmodule BulletRegistry.ChildrenRegistry do

  @registry :child_registry

  def start_link do
      Agent.start_link(fn -> %{} end, name: @registry)
  end

  def register_child(pid, child_pid) do
    Agent.update(@registry, &(Map.put(&1, pid, child_pid)))
  end

  def get_children(pid) do
    Agent.get(@registry, &(&1[pid]))
  end
end
