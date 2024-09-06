defmodule Radiance.Resource.Owners do
  def resource do
    %{schema: Vet.Owners.Owner, name: "owner", plural: "owners"}
  end

  def form() do
    %{
      fields: [:name, :active]
    }
  end

  def table() do
    %{
      columns: [
        # :id,
        %{
          name: :active,
          column_type: :text
        },
        %{
          name: :name,
          # icon: "hero-envelope",
          icon: [&return_icon/2, :record, :column],
          icon_colour: "text-blue-500",
          icon_position: :after,
          badge: true,
          badge_colour: "text-red-500, bg-green-500"

          # badge: %{
          #   outline: true
          # }
        }
      ]
    }
  end

  def return_icon(record, column) do
    dbg(record)
    dbg(column)
    "hero-envelope"
  end
end

# def rad_column(%{column_type: :text} = assigns) do
#   ~H"""
#   <.rad_description
#     description={@column[:description]}
#     description_position={@column[:description_position]}
#   >
#     <.rad_badge badge={@column[:badge]} badge_colour={@column[:badge_colour]}>
#       <.rad_text_icon
#         icon={@column[:icon]}
#         icon_colour={@column[:icon_colour]}
#         icon_position={@column[:icon_position]}
#       >
#         <.rad_prefix prefix={@column[:prefix]} />
#         <.rad_text
#           value={@value}
#           limit={@column[:limit]}
#           words={@column[:words]}
#           date_format={@column[:date_format]}
#         />
#         <.rad_suffix suffix={@column[:suffix]} />
#       </.rad_text_icon>
#     </.rad_badge>
#   </.rad_description>
#   """
# end
