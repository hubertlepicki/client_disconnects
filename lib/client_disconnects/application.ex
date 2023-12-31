defmodule ClientDisconnects.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ClientDisconnectsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ClientDisconnects.PubSub},
      # Start the Endpoint (http/https)
      ClientDisconnectsWeb.Endpoint,
      # Start a worker by calling: ClientDisconnects.Worker.start_link(arg)
      # {ClientDisconnects.Worker, arg}
      {Registry, name: ClientDisconnectsWeb.Registry, keys: :unique},
      {Finch, name: HttpClient}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClientDisconnects.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClientDisconnectsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
