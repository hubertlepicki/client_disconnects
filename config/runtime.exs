import Config

if System.get_env("SERVER") == "bandit" do
  config :client_disconnects, ClientDisconnectsWeb.Endpoint, adapter: Bandit.PhoenixAdapter
end
