# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :drab_speed, DrabSpeedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XTmTr31RI9ExNAOJjIGRTWX6mnhg44Dze3d6X+4M4yUgVcLJTJNtzBy3QC5SM57p",
  render_errors: [view: DrabSpeedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DrabSpeed.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Drab
config :drab, DrabSpeedWeb.Endpoint,
  otp_app: :drab_speed

# Configures default Drab file extension
config :phoenix, :template_engines,
  drab: Drab.Live.Engine

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
