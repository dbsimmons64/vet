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
        %{
          name: :status,
          html_type: :select,
          options: %{
            "New" => "New",
            "Issued" => "Issued",
            "Paid" => "Paid"
          }
        },
        %{name: :pet_id, value: :name, label: "Pet Name"}
      ]
    }
  end

  def table() do
    %{
      fields: [
        :description,
        %{
          name: [:pet, :type],
          hide: [&hide_dogs/1, :record]
        },
        %{
          name: :status,
          hide: false,
          display_type: :icon,
          options: %{
            "New" => "hero-arrow-path",
            "Issued" => "hero-paint-brush",
            "Paid" => "hero-face-smile"
          }
        },
        %{name: [:pet, :name], label: "Pet"}
      ]
    }
  end

  def hide_dogs(record) do
    if record.pet.type == "Dog" do
      true
    else
      false
    end
  end
end
