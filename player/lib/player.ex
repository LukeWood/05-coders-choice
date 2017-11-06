defmodule Player do

  @radius 25

  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0,
    radius:       @radius
  ]

end
