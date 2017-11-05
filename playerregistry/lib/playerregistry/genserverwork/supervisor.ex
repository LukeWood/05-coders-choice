defmodule PlayerRegistry.Supervisor do

  alias PlayeyRegistry.ChildrenRegistry, as: ChildrenRegistry

  def start_child_registry do
    import Supervisor.Spec
    children =  [
      worker(ChildrenRegistry, [])
    ]
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: PlayerRegistry.ChildrenRegistry
    ]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  def new_registry do
    {:ok, par_pid} = GenServer.start_link(PlayerRegistry.Server, PlayerRegistry.Impl.new_registry)
    {:ok, child_pid} = PlayerRegistry.ChangeList.start_link
    ChildrenRegistry.register_child(par_pid, child_pid)
    par_pid
  end

  PlayerRegistry.ChangeList.start_link
end
