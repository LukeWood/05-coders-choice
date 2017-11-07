defmodule Bullet do

  defdelegate tick(pid),                      to: Bullet.Agent
  defdelegate peek(pid),                      to: Bullet.Agent
  defdelegate find_collisions(pid, objects),  to: Bullet.Agent
  defdelegate start(x, y, direction),         to: Bullet.Agent

  defstruct [
    lifetime:   100,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
