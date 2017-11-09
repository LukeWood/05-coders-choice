defmodule Bullet.Supervisor do
  use Supervisor

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def new do
    Supervisor.start_child(__MODULE__, [])
  end

  def new(name) do
    Supervisor.start_child(__MODULE__, [name])
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
