defmodule Tutorials.Structs.Expense do
  alias Tutorials.Structs.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec sample :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2023-08-01], amount: 18.99, store: "Metro"},
      %Expense{title: "Mobile", date: ~D[2022-10-11], amount: 22.99, store: "Bell"},
      %Expense{title: "Jacket", date: ~D[2023-11-23], amount: 20.99, store: "Marks"},
      %Expense{title: "Air Jordans", date: ~D[2022-10-30], amount: 333.99, store: "Nike"}
    ]
  end

  @spec total([t]) :: number()
  def total(expenses) do
    expenses
    |> Enum.reduce(0, &(&1.amount + &2))
  end

  @spec sort_by_date([t]) :: [t]
  def sort_by_date(expenses) do
    expenses |> Enum.sort_by(& &1.date)
  end
end
