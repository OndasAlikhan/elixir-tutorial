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


  @spec add_expense(t) :: [t]
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  def update_amount(title, amount) do
    [item] = Enum.filter(sample(), fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}

    [new_item | sample() |> List.delete(item)]
  end

  # --- with ---

  @users ["Coco", "Cece", "Louis", "Chiko"]

  def authenticate(user) when user in @users, do: {:ok, "authorized"}
  def authenticate(_), do: {:error, "unauthorized"}

  def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
  def verify_password(_user, _password), do: {:error, "wrong password"}

  def login(user, password) do
    with {:ok, _auth_msg} <- authenticate(user),
         {:ok, _msg} <- verify_password(user, password) do
      {:ok, "#{user} logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
