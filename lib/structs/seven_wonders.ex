defmodule Tutorials.Structs.SevenWonders do
  defstruct name: "", country: ""
  alias Tutorials.Structs.SevenWonders

  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t()
  }

  # --- All ---

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal",country: "India"},
      %SevenWonders{name: "Chichen Itza",country: "Mexico"},
      %SevenWonders{name: "Petra",country: "Jordan"},
      %SevenWonders{name: "Machu Picchu",country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer",country: "Brazil"},
      %SevenWonders{name: "Colosseum",country: "Italy"},
      %SevenWonders{name: "The Greate Wall of China",country: "China"},

    ]
  end

  # ------

  @spec print_names([t()]) :: [String.t()]
  def print_names(wonders) do
    Enum.map(wonders, fn %{ name: name } -> name end)
  end

  @spec filter_by_country([t()], t()) :: [t()]
  def filter_by_country(wonders, country) do
    wonders |> Enum.filter(fn x -> x.name == country.name end)
  end
end
