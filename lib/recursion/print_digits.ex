defmodule Tutorials.Recursion.PrintDigits do
  # Base case
  def upto(0), do: 0

  def upto(nums) do
    # num 3 -> 0 1 2 3
    IO.puts(nums)
    upto(nums - 1)
  end
end
