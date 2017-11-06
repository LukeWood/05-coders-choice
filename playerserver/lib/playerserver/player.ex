defmodule PlayerServer.Player do

  @radius 25
  def radius do
    @radius
  end

  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0
  ]
end
