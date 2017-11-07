defmodule World do

  alias World.Client, as: Client
  alias World.Server, as: Server

  defdelegate tick(pid),           to: Client
  defdelegate request_player(pid), to: Client

  defdelegate start,               to: Server

  defstruct [
    bullets: [],
    players: [],
  ]

end
