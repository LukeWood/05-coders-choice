defmodule KeyVal do
  
  def start(_type, _opts) do
      Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def set(pid, child_pid) do
    Agent.update(__MODULE__, &(Map.put(&1, pid, child_pid)))
  end

  def get(pid) do
    Agent.get(__MODULE__, &(&1[pid]))
  end

end
