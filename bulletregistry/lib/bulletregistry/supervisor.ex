defmodule BulletRegistry.Supervisor do

  def start_link() do
    import Supervisor.Spec
    children = [
      worker(BulletRegistry.Server, [])
    ]
    other_child = [
      worker(BulletRegistry.ChangeList, [])
    ]
    opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: BulletRegistry.Server
    ]
    other_opts = [
      strategy: :one_for_one,
      restart: :permanent,
      name: BulletRegistry.ChangeList
    ]
    {:ok, _pid} = Supervisor.start_link(children, opts)
    {:ok, _pid} = Supervisor.start_link(other_child, other_opts)
  end

  BulletRegistry.ChangeList.start_link
end
