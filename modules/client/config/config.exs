# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :client, ClientWeb.Endpoint,
  server: true,
  url: [host: "localhost"],
  port: System.get_env("PORT"),
  secret_key_base: "fjGXXY2usmVRV9iIvVbXHISD0b4ZHaAK3pZ96LrBStNyS933ghZfRDRMvFSGVjLv",
  render_errors: [view: ClientWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Client.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
