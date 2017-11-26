defmodule Client.Mixfile do
  use Mix.Project

  def project do
    [
      app: :client,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
    ]
  end

  # Configuration for the OTP application.
  #
  def application do
    [
      mod: {Client.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end
