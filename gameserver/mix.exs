defmodule GameServer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gameserver,
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
      {:bulletserver,   in_umbrella: true},
      {:keyval,         in_umbrella: true},
      {:playerserver, in_umbrella: true}
    ]
  end
end
