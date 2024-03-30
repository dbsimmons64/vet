defmodule Vet.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :date_of_birth, :date
      add :owner_id, references(:owners, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:pets, [:owner_id])
  end
end
