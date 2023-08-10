defmodule Tutorials.Lists.Map do
  # --- Sum ---
  @spec sum([number()], number()) :: number()
  def sum(nums, acc \\ 0)
  def sum([], acc), do: acc
  def sum([head | tail], acc), do: sum(tail, acc + head)

  # --- Reverse ---
  def reverse(nums, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  # --- Map ---
  def map(nums, func, acc \\ [])
  def map([], _, acc), do: acc |> reverse()
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  # --- Concat ---
  @spec concat([any()], [any()]) :: [any()]
  def concat(source, destination), do: concat_func(source |> reverse(), destination)
  defp concat_func([], destination), do: destination
  defp concat_func([h | t], destination), do: concat_func(t, [h | destination])

  # --- FlatMap ---
  def flat_map(elements, func, acc \\ [])
  def flat_map([], _func, acc), do: acc
  def flat_map([head | tail], func, acc), do: flat_map(tail, func, concat(acc, func.(head)))

end
