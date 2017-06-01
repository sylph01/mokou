# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mokou,
  ecto_repos: [Mokou.Repo],
  limit_of_count: 10

# Configures the endpoint
config :mokou, Mokou.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0xwQ9uPZHxFv+0Cl8MnNbqRvjRBGUE6CIAmh8i5Abhu/EiC6Eo8t7RSHpBHMZO44",
  render_errors: [view: Mokou.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mokou.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
