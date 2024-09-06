defmodule Radiance.Resource.Treatments do
  def resource do
    %{schema: Vet.Treatments.Treatment, name: "treatment", plural: "treatments"}
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
        %{
          name: :price,
          html_type: :text
        },
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
      columns: [
        :description,
        %{
          name: :notes,
          display_type: :textarea
          # textarea: %{
          #   colour: "text-red-500",
          #   html: true
          # }
        }
        # %{
        #   name: :price,
        #   display_type: :money,
        # money: %{
        #   currency: "£"
        #   # divide_by: 100
        # },
        #   icon: "hero-envelop"
        # }
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
