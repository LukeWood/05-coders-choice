defmodule Client.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # TODO(lukewood) supervise client agent
    Client.start

    children = [
      supervisor(ClientWeb.Endpoint, [])
    ]

    opts = [strategy: :one_for_one, name: Client.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ClientWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end