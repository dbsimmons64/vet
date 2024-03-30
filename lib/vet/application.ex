defmodule Vet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VetWeb.Telemetry,
      Vet.Repo,
      {DNSCluster, query: Application.get_env(:vet, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Vet.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Vet.Finch},
      # Start a worker by calling: Vet.Worker.start_link(arg)
      # {Vet.Worker, arg},
      # Start to serve requests, typically the last entry
      VetWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VetWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
