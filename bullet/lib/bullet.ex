defmodule Bullet do

  defdelegate start_link(opts, args),      to: Bullet.Server
  defdelegate new_bullet(world_pid), to: Bullet.Supervisor

  defstruct [
    world: nil,
    lifetime:   100,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
