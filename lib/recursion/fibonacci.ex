defmodule Tutorials.Recursion.Fibonacci do
  def upto(0), do: 0

  def upto(num) do
    upto(num - 1) + upto(num - 2)
  end
end
