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
          name: :type,
          label: "Genus of Animal",
          html_type: :select,
          options: %{
            "dog" => "Dog",
            "cat" => "Cat",
            "rabbit" => "Rabbit"
          }
        },
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
        %{name: :type},
        %{name: [:owner, :name]},
        %{name: :age, display_type: :calculated, calculation: [&calculate_age/1, :record]}
      ],
      pagination: %{
        page_size: 2
      }
    }
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
