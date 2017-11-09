defmodule Bullet.Supervisor do
  use Supervisor

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def new(unique_name) do
    spec = worker(Bullet.Server, [], [id: unique_name, restart: :transient])
    Supervisor.start_link(Bullet.Supervisor, spec)
  end

  def init(_) do
    children =[
      worker(Bullet.Server, [])
    ]
    opts = [
      strategy: :simple_one_for_one
    ]
    supervise(children, opts)
  end

end
