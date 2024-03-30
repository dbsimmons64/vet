defmodule Vet.Treatments.Treatment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "treatments" do
    field :description, :string
    field :notes, :string
    field :price, :integer

    belongs_to :pet, Vet.Pets.Pet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(treatment, attrs) do
    treatment
    |> cast(attrs, [:description, :notes, :price, :pet_id])
    |> validate_required([:description, :notes, :price, :pet_id])
  end
end
