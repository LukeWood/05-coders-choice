defmodule Player do

  defdelegate new,                 to: Player.Supervisor
  defdelegate new(pid),            to: Player.Supervisor
  defdelegate peek(pid),           to: Player.Client
  defdelegate action(pid, action), to: Player.Client

  defstruct [
    x:            0,
    y:            0,
    direction:    :left,
    moving:       false,
    reload_time:  0,
    radius:       Constants.player_radius,
    world:        nil
  ]

end
