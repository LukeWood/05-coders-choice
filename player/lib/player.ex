defmodule Player do

  @radius 25

  defdelegate start,               to: Player.Supervisor
  defdelegate tick(pid),           to: Player.Agent
  defdelegate peek(pid),           to: Player.Agent
  defdelegate action(pid, action), to: Player.Agent

  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0,
    radius:       @radius
  ]

end
