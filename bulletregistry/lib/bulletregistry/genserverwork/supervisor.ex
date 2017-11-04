defmodule BulletRegistry.Supervisor do

  alias KeyVal, as: ChildrenRegistry



  def new_registry do
    {:ok, par_pid} = GenServer.start_link(BulletRegistry.Server, BulletRegistry.Impl.new_registry)
    {:ok, child_pid} = BulletRegistry.ChangeList.start_link
    ChildrenRegistry.set(par_pid, child_pid)
    par_pid
  end

  BulletRegistry.ChangeList.start_link
end
