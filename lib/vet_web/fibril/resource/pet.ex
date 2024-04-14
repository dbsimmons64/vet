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
        %{name: [:owner, :name]}
      ],
      pagination: %{
        page_size: 2
      },
      foo: [&hello/2, :table_opts, :foo]
    }
  end

  def hello(name, other) do
    "Page size is #{name}"
  end
end
