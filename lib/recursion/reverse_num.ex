defmodule Tutorials.Recursion.ReverseNum do
  def revers(num), do: revers_tail(num)
  def revers_tail(num, acc \\ 0)
  def revers_tail(0, acc), do: acc
  def revers_tail(num, acc) do
    new_num = div(num, 10)
    new_acc = acc * 10 + rem(num,10)
    revers_tail(new_num, new_acc)
  end
end
