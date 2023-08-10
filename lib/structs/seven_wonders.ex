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

  @spec in_countries_starting_with_i([t()]) :: [t()]
  def in_countries_starting_with_i(wonders) do
    wonders |> Enum.filter(fn %{ country: country } -> String.starts_with?(country, "I") end)
  end

  def sort_by_country_length(wonders) do
    wonders
    |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list(wonders) do
    wonders |> Enum.reduce([], fn x,acc -> [[x.name, x.country] | acc] end)
  end


end
