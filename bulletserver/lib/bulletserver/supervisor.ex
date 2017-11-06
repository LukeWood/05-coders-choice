defmodule BulletServer.Supervisor do

  def new_registry do
    {:ok, par_pid} = GenServer.start_link(BulletServer.Server, BulletServer.Impl.new_registry)
    {:ok, child_pid} = BulletServer.ChangeList.start_link
    KeyVal.set(par_pid, child_pid)
    par_pid
  end
end
