defmodule KeyVal do
  @registry :key_val

  def start(_type, _opts) do
      Agent.start_link(fn -> %{} end, name: @registry)
  end

  def set(pid, child_pid) do
    Agent.update(@registry, &(Map.put(&1, pid, child_pid)))
  end

  def get(pid) do
    Agent.get(@registry, &(&1[pid]))
  end

end
