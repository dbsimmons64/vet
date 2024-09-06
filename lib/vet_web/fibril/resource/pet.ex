defmodule Radiance.Resource.Pets do
  def resource do
    %{schema: Vet.Pets.Pet, name: "pet", plural: "pets"}
  end

  def table() do
    %{
      columns: [
        %{
          name: :name,
          description: "A description above the name",
          column_type: VetWeb.Fibril.Resource.Components,
          description_position: :above,
          # limit: 5,
          words: 3,
          badge: true,
          icon: "hero-question-mark-circle",
          foo: "Wobble"
        },
        %{
          name: :type,
          column_value: %{
            "Cat" => "meow"
          }
        },
        %{
          name: :date_of_birth,
          column_value: [&set_value/1, :record],
          column_type: :text,
          # icon: "hero-cake"
          # icon: "hero-check-circle"

          boolean: true
          # true_icon: "true-icon",
          # false_icon: "false-icon"
        }
      ]
    }
  end

  # def form() do
  #   %{
  #     fields: [
  #       :name,
  #       :date_of_birth,
  #       %{
  #         name: :type,
  #         label: "Genus of Animal",
  #         html_type: :select,
  #         options: %{
  #           "dog" => "Dog",
  #           "cat" => "Cat",
  #           "rabbit" => "Rabbit"
  #         }
  #       },
  #       %{
  #         name: :owner_id,
  #         value: :name,
  #         createOptionForm: %{
  #           fields: [
  #             :name
  #           ]
  #         }
  #       }
  #     ]
  #   }
  # end

  # def table() do
  #   %{
  #     fields: [
  #       %{
  #         name: :name,
  #         display_type: :input,
  #         input: %{
  #           colour: "text-red-500"
  #         },
  #         description: %{
  #           text: "This is a description",
  #           position: :below
  #         },
  #         badge: true
  #       },
  #       %{
  #         name: :type,
  #         display_type: :select,
  #         select: %{
  #           options: %{
  #             "dog" => "Dog",
  #             "cat" => "Cat",
  #             "rabbit" => "Rabbit"
  #           }
  #         }
  #       },
  #       %{
  #         name: :type,
  #         display_type: :icon,
  #         icon: %{
  #           name: %{
  #             "Dog" => "hero-arrow-path",
  #             "Cat" => "hero-paint-brush",
  #             "Rabbit" => "hero-face-smile"
  #           },
  #           colour: "bg-red-500"
  #         }
  #       },
  #       # %{
  #       #   name: :type,
  #       #   colour: "text-red-500",

  #       #   # badge: %{
  #       #   #   colours: %{
  #       #   #     "Dog" => "badge-neutral",
  #       #   #     "Cat" => "badge-primary",
  #       #   #     "Rabbit" => "badge-secondary"
  #       #   #   }
  #       #   # },
  #       #   icon: %{
  #       #     name: "hero-envelope",
  #       #     position: :before,
  #       #     colour: "text-blue-500"
  #       #   }
  #       #   # badge: true
  #       # },
  #       %{
  #         name: :date_of_birth,
  #         date: %{
  #           format: "%b %Y",
  #           colour: "text-red-500"
  #         },
  #         icon: %{
  #           name: "hero-envelope",
  #           position: :before
  #         }
  #       }
  #       # %{
  #       #   name: [:owner, :name],
  #       #   label: "Owner"
  #       # }
  #       # %{
  #       #   name: :age,
  #       #   display_type: :calculated,
  #       #   calculation: [&calculate_age/1, :record],
  #       #   colour: "text-blue-300"
  #       # }
  #     ],
  #     pagination: %{
  #       page_size: 2
  #     }
  #   }
  # end

  def set_value(record) do
    dbg(record)
    "function call"
  end

  def calculate_age(record) do
    years = Timex.diff(Date.utc_today(), record.date_of_birth, :years)
    months = Timex.diff(Date.utc_today(), record.date_of_birth, :months)
    months = months - years * 12

    case {years, months} do
      {0, 0} -> "less than a month"
      {0, 1} -> "1 month"
      {1, 0} -> "1 year"
      {1, 1} -> "1 year and 1 month"
      {_, 1} -> "#{years} years and 1 month"
      {_, _} -> "#{years} years and #{months} months"
    end
  end
end
