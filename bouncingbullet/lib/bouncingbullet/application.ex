defmodule Bouncingbullet.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(BouncingbulletWeb.Endpoint, []),
    ]
    opts = [strategy: :one_for_one, name: Bouncingbullet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BouncingbulletWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
