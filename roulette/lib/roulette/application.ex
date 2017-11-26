defmodule Roulette.Application do
  
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Roulette, [], restart: :permanent)
    ]

    opts = [
      strategy: :one_for_one, 
    name: Roulette.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end