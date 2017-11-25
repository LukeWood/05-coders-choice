defmodule Player do

  defdelegate new,                 to: Player.Supervisor
  defdelegate new(pid),            to: Player.Supervisor
  defdelegate peek(pid),           to: Player.Client
  defdelegate action(pid, action), to: Player.Client

  defstruct [
    x:            Constants.player_radius,
    y:            Constants.player_radius,
    direction:    :left,
    moving:       false,
    reload_time:  0,
    radius:       Constants.player_radius,
    color:        "#cc00ff",
    world:        nil
  ]

end
