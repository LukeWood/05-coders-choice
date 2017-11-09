defmodule Bullet.Supervisor do
  use Supervisor

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, [], name: :bullet_supervisor)
  end

  def new_bullet(world_pid) do
    Supervisor.start_child(:bullet_supervisor, [world_pid])
  end

  def init(_) do
    children =[
      worker(Bullet.Server, [])
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

end
