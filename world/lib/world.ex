defmodule World do

  alias World.Client,     as: Client
  alias World.Supervisor, as: Supervisor
  alias World.Server,     as: Server

  defdelegate get_players(pid),           to: Client
  defdelegate new_player(pid, player),    to: Client
  defdelegate remove_player(pid, player), to: Client

  defdelegate get_bullets(pid),           to: Client
  defdelegate new_bullet(pid, bullet),    to: Client
  defdelegate remove_bullet(pid, bullet), to: Client

  defdelegate start_link,              to: Server
  defdelegate new,                     to: Supervisor

  defstruct [
    players: [],
    bullets: []
  ]

end
