defmodule Integration.Mixfile do
  use Mix.Project

  def project do
    [
      app: :integration,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      start_permanent: Mix.env == :prod,
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

end
