defmodule Bullet do

  defdelegate tick(pid, timestamp, objects), to: Bullet.Client

  defstruct [
    expiration: 0,
    timestamp:  0,
    x:          0,
    y:          0,
    direction:  :left
  ]

end
