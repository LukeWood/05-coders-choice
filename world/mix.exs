defmodule World.Mixfile do
  use Mix.Project

  def project do
    [
      app: :world,
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
      {:bullet, in_umbrella: true},
      {:player, in_umbrella: true}
    ]
  end
end
