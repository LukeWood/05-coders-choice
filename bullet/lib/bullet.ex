defmodule Bullet do

  defdelegate new(name), to: Bullet.Supervisor

  defstruct [
    world: nil,
    lifetime:   10,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
