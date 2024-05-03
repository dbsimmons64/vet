defmodule Fibril.Resource.Treatments do
  def resource do
    %{module: Vet.Treatments.Treatment, name: "treatment", plural: "treatments"}
  end

  def form() do
    %{
      fields: [
        %{
          name: :description,
          html_type: :textarea
        },
        %{
          name: :notes,
          html_type: :textarea
        },
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
        :price,
        %{
          name: :notes,
          display_type: :textarea,
          textarea: %{
            colour: "text-red-500",
            html: true
          }
        },
        %{
          name: :price,
          money: %{
            currency: "£",
            divide_by: 100
          }
        }
        # %{
        #   name: [:pet, :type],
        #   hide: [&hide_dogs/1, :current_user]
        # },
        # %{
        #   name: :status,
        #   hide: false,
        #   display_type: :icon,
        #   icon: %{
        #     name: %{
        #       "New" => "hero-arrow-path",
        #       "Issued" => "hero-paint-brush",
        #       "Paid" => "hero-face-smile"
        #     },
        #     size: %{width: 48, height: 48}
        #   },
        #   description: %{
        #     text: "This is a description",
        #     position: :above
        #   }
        # },
        # %{name: [:pet, :name], label: "Pet"}
      ]
    }
  end

  def hide_dogs(record) do
    dbg(record)

    true
  end
end
