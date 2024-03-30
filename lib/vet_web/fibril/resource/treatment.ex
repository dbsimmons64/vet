defmodule Fibril.Resource.Treatments do
  def resource do
    %{module: Vet.Treatments.Treatment, name: "treatment", plural: "treatments"}
  end

  def form() do
    %{
      fields: [
        :description,
        :notes,
        :price,
        %{name: :pet_id, value: :name}
      ]
    }
  end

  def table() do
    %{
      fields: [
        :description,
        %{name: [:pet, :name], label: "Pet"}
      ]
    }
  end
end
