defmodule Player.Mixfile do
  use Mix.Project

  def project do
    [
      app: :player,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Player.Supervisor, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bullet,     in_umbrella: true},
      {:world,      in_umbrella: true},
      {:constants,  in_umbrella: true},
      {:move,       in_umbrella: true},
      {:peek,       in_umbrella: true},
      {:uuid,       "~> 1.1" }
    ]
  end
end
