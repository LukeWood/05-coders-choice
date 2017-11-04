defmodule BulletRegistry.Supervisor do

  def start_child_registry do
    import Supervisor.Spec
    children =  [
      worker(BulletRegistry.ChildrenRegistry, [])
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
    {:ok, change_pid} = ChangeList.start_link

    par_pid
  end

  BulletRegistry.ChangeList.start_link
end
