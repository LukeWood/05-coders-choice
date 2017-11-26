defmodule WoodBullet.Mixfile do
  use Mix.Project

  def project do
    [
      app: :wood_bullet,
      apps_path: "modules",
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:uuid,       "~> 1.1" },
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:distillery, "~> 1.5", runtime: false},
    ]
  end
end
