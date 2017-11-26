defmodule Bullet.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bullet,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Bullet.Supervisor, []}
    ]
  end
end
