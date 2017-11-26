defmodule Bullet do

  defdelegate start_link,             to: Bullet.Server
  defdelegate new,                    to: Bullet.Supervisor
  defdelegate new(player),            to: Bullet.Supervisor
  defdelegate new(player, world_pid), to: Bullet.Supervisor

  defstruct [
    world: nil,
    lifetime:   100,
    radius:     Constants.bullet_radius,
    x:          0,
    y:          0,
    direction:  :left,
    color:      "#ffffff",
    timestamp:  0
  ]

end
