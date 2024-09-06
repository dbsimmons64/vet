defmodule Vet.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :name, :string
      add :active, :boolean

      timestamps(type: :utc_datetime)
    end
  end
end
