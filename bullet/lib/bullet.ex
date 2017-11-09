defmodule Bullet do

  defdelegate tick(pid),                                to: Bullet.Client
  defdelegate find_collisions(pid, objects),            to: Bullet.Client
  defdelegate new_bullet(parent_pid, x, y, direction),  to: Bullet.Supervisor

  defstruct [
    world: nil
    lifetime:   100,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
