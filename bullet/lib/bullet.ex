defmodule Bullet do

  defdelegate start_link,             to: Bullet.Server
  defdelegate peek(pid),              to: Bullet.Client
  defdelegate new,                    to: Bullet.Supervisor
  defdelegate new(player, world_pid), to: Bullet.Supervisor

  defstruct [
    world: nil,
    lifetime:   10,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
