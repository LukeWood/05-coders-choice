defmodule Bullet.Supervisor do
  use Supervisor

  alias Bullet.Transformations, as: Transformations

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def new do
    Supervisor.start_child(__MODULE__, [])
  end

  def new(player = %{world: world}) do
    new(Transformations.transform_player(player), world)
  end

  def new(_ = %{x: x, y: y, direction: direction}, world) do
    {:ok, pid} = Supervisor.start_child(__MODULE__, [
      %Bullet{
        x: x,
        y: y,
        direction: direction,
        world: world
      }
    ])
    World.new_bullet(world, pid)
    {:ok, pid}
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
