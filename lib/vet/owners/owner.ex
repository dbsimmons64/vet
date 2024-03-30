defmodule Vet.Owners.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :name, :string

    has_many :pets, Vet.Pets.Pet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
