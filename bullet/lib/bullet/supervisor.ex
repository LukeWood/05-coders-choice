defmodule Bullet.Supervisor do
  use Supervisor

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def new do
    Supervisor.start_child(__MODULE__, [])
  end
  
  def new(_player = %{x: x, y: y, direction: direction}, world_pid) do
    Supervisor.start_child(__MODULE__, [%Bullet{x: x, y: y, direction: direction, world: world_pid}])
  end

  def init(:ok) do
    children =[
      worker(Bullet.Server, [], restart: :temporary)
    ]
    opts = [
      strategy: :simple_one_for_one
    ]
    supervise(children, opts)
  end

end
