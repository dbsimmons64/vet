defmodule Vet.Owners.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :name, :string
    field :active, :boolean, default: true

    has_many :pets, Vet.Pets.Pet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:name, :active])
    |> validate_required([:name, :active])
  end
end
