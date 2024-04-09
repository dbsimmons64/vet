defmodule Fibril.Resource.Pets do
  def resource do
    %{module: Vet.Pets.Pet, name: "pet", plural: "pets"}
  end

  def form() do
    %{
      fields: [
        :name,
        :date_of_birth,
        %{
          name: :owner_id,
          value: :name,
          createOptionForm: %{
            fields: [
              :name
            ]
          }
        }
      ]
    }
  end

  def table() do
    %{
      fields: [
        %{name: :name},
        %{name: :date_of_birth},
        %{name: [:owner, :name]}
      ]
    }
  end
end
