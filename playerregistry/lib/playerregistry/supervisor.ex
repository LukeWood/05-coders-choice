defmodule PlayerRegistry.Supervisor do

  alias PlayeyRegistry.ChildrenRegistry, as: ChildrenRegistry

  def new_registry do
    {:ok, par_pid} = GenServer.start_link(PlayerRegistry.Server, PlayerRegistry.Impl.zero_state)
    {:ok, child_pid} = PlayerRegistry.ChangeList.start_link
    ChildrenRegistry.register_child(par_pid, child_pid)
    par_pid
  end

end
