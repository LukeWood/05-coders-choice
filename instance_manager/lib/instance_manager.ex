defmodule InstanceManager do
  use GenServer
  alias InstanceManager.Server, as: Server
  alias InstanceManager.Client, as: Client

  defstruct [
    bullets: [],
    players: [],
    world:   nil
  ]

  defdelegate start_link, to: Server

  defdelegate new_player, to: Client
  defdelegate get_state,  to: Client

end
