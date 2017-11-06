defmodule Bullet do

  defdelegate tick(pid, objects),          to: Bullet.Agent
  defdelegate tick(pid),                   to: Bullet.Agent
  defdelegate peek(pid),                   to: Bullet.Agent
  defdelegate start(x, y, direction),      to: Bullet.Supervisor

  defstruct [
    lifetime:   100,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
