defmodule Fibril.Resource.Owners do
  def resource do
    %{module: Vet.Owners.Owner, name: "owner", plural: "owners"}
  end

  def form() do
    %{
      fields: [:name]
    }
  end

  def table() do
    %{
      fields: [
        %{
          name: :name,
          icon: %{
            name: "hero-envelope",
            position: :after,
            colour: "text-blue-500"
          },
          badge: %{
            outline: true
          }
        }
      ]
    }
  end
end
