defmodule Player do

  defdelegate new,                 to: Player.Supervisor
  defdelegate new(pid),            to: Player.Supervisor
  defdelegate new_zero_state(pid), to: Player.Supervisor
  defdelegate action(pid, action), to: Player.Client

  defstruct [
    x:              Application.get_env(:player, :radius),
    y:              Application.get_env(:player, :radius),
    direction:      :left,
    moving:         false,
    reload_time:    0,
    radius:         Application.get_env(:player, :radius),
    color:          "#cc00ff",
    world:          nil,
    timestamp:      0,
    speed:          Application.get_env(:player, :speed),
    clock_interval: Application.get_env(:clock, :interval)
  ]

end
