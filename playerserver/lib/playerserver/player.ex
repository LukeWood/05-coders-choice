defmodule PlayerServer.Player do
  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0
  ]
end
