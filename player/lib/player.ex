defmodule Player do

  @radius 25

  defdelegate start,                     to: Player.Atgent
  defdelegate start(x, y)                to: Player.Agen
  defdelegate tick(pid),                 to: Player.Agent
  defdelegate peek(pid),                 to: Player.Agent
  defdelegate action(pid, action),       to: Player.Agent
  defdelegate create_event_handler(pid), to: Player.Agent

  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0,
    radius:       @radius
  ]

end
