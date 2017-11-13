defmodule Bullet.Supervisor do
  use Supervisor

  def start(_opts, _args) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def dx do
    5 + Bullet.radius + 1
  end

  def transform_player(player = %{direction: :left}) do
    Map.update!(player, :x, fn x -> x - dx() end)
  end
  def transform_player(player = %{direction: :right}) do
    Map.update!(player, :x, fn x -> x + dx() end)
  end
  def transform_player(player = %{direction: :up}) do
    Map.update!(player, :y, fn y -> y - dx() end)
  end
  def transform_player(player = %{direction: :down}) do
    Map.update!(player, :y, fn y -> y + dx() end)
  end

  def new do
    Supervisor.start_child(__MODULE__, [])
  end

  def new(player = %{world: world}) do
    new(transform_player(player), world)
  end

  def new(_ = %{x: x, y: y, direction: direction}, world) do
    Supervisor.start_child(__MODULE__, [
      %Bullet{
        x: x,
        y: y,
        direction: direction,
        world: world
      }
    ])
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
