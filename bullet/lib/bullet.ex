defmodule Bullet do

  defdelegate tick(pid, objects),          to: Bullet.Client
  defdelegate tick(pid),                   to: Bullet.Client
  defdelegate peek(pid),                   to: Bullet.Client
  defdelegate start(x, y, direction),      to: Bullet.Supervisor

  defstruct [
    lifetime:   100,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
