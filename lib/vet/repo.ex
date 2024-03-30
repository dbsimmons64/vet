defmodule Vet.Repo do
  use Ecto.Repo,
    otp_app: :vet,
    adapter: Ecto.Adapters.Postgres
end
