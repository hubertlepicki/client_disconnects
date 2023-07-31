import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :client_disconnects, ClientDisconnectsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "n8m7TG/2lwAadRsv/FmPzBzV7syGNuu/G3oFZSCnsRyS9h7qd5IkBxrCFHjW0M6a",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
