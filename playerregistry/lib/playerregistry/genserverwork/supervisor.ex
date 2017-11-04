defmodule BulletRegistry.Supervisor do

  alias PlayeyRegistry.ChildrenRegistry, as: ChildrenRegistry

  def start_child_registry do
    import Supervisor.Spec
    children =  [
      worker(ChildrenRegistry, [])
    ]
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: BulletRegistry.ChildrenRegistry
    ]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end

  def new_registry do
    {:ok, par_pid} = GenServer.start_link(BulletRegistry.Server, BulletRegistry.Impl.new_registry)
    {:ok, child_pid} = BulletRegistry.ChangeList.start_link
    ChildrenRegistry.register_child(par_pid, child_pid)
    par_pid
  end

  BulletRegistry.ChangeList.start_link
end
