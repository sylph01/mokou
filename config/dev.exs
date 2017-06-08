use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :mokou, Mokou.Endpoint,
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :mokou, Mokou.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :mokou, Mokou.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: System,get_env("MOKOU_DB_USERNAME"),
  password: System.get_env("MOKOU_DB_PASSWORD"),
  database: "mokou_dev",
  hostname: "localhost",
  pool_size: 10

# mailer
config :mokou, Mokou.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "m.s01.info",
  port: 465,
  username: System.get_env("MOKOU_SMTP_USERNAME"),
  password: System.get_env("MOKOU_SMTP_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  ssl: true, # can be `true`
  retries: 1
