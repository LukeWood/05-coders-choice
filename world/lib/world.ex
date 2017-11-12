defmodule World do

  alias World.Client,     as: Client
  alias World.Supervisor, as: Supervisor
  alias World.Server,     as: Server

  defdelegate get_players(pid), to: Client
  defdelegate start_link,       to: Server

  defdelegate new,              to: Supervisor

  defstruct [
    players: [],
  ]

end
