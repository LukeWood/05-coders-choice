defmodule Lobbyserver.Mixfile do
  use Mix.Project

  def project do
    [
      app: :lobbyserver,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {LobbyServer, []}
    ]
  end

  defp deps do
    [
    ]
  end
end
