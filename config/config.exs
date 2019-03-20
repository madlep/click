# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :click,
  ecto_repos: [Click.Repo]

# Configures the endpoint
config :click, ClickWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/R7h02GXzxcdFiglymZM2vyT9cpwTayHVp+CgqGgFMJNQPkdVo8atvsm2kLx3YD4",
  render_errors: [view: ClickWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Click.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "kvi1HZNk4PiRZdxWCIzF3qHxk4MRqhUm89gL5LpaG0/INqyk1Um3an6mPpeaI30L"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix,
  json_library: Jason,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
