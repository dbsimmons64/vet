defmodule Vet.Money do
  use Ecto.Type

  def type, do: :integer

  def cast(amount) when is_binary(amount) do
    {:ok,
     amount
     |> Decimal.new()
     |> Decimal.mult(100)
     |> Decimal.to_integer()}
  end

  def cast(amount) when is_integer(amount) do
    {:ok, amount}
  end

  def load(data) do
    {:ok,
     data
     |> Decimal.new()
     |> Decimal.div(100)
     |> Decimal.to_string()}
  end

  def dump(amount) do
    dbg(amount)
    {:ok, amount}
  end
end
