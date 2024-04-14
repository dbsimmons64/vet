defmodule Vet.Treatments.Treatment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treatments" do
    field :description, :string
    field :notes, :string
    field :price, :integer
    field :status, :string, default: "New"

    belongs_to :pet, Vet.Pets.Pet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(treatment, attrs) do
    treatment
    |> cast(attrs, [:description, :notes, :price, :status, :pet_id])
    |> validate_required([:description, :notes, :price, :status, :pet_id])
  end
end
