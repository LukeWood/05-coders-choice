defmodule Bullet.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bullet,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Bullet.Supervisor, []}
    ]
  end

  defp deps do
    [
      {:world,      in_umbrella: true},
      {:constants,  in_umbrella: true},
      {:move,       in_umbrella: true},
      {:peek,       in_umbrella: true}
    ]
  end
end
