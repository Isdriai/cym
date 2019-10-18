# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chooseYourMis,
  namespace: Cym,
  ecto_repos: [Cym.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :chooseYourMis, CymWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xtVDlC2ZUgvBY7JqVEbEO0XlkaqzCqCtzEC2RRy4wni/oqwOEABq+EX8t4xOv1lX",
  render_errors: [view: CymWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Cym.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
