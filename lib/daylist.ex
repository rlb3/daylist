defmodule Daylist do
  @days [:sun, :mon, :tues, :wed, :thurs, :fri, :sat]

  def run({first,second}) do
    cond do
      consecutive?(first, second) -> Enum.slice(@days, first_index(first)..second_index(second))
      overlaping?(first, second) -> Enum.slice(@days, first_index(first)..last_index) ++ Enum.slice(@days, 0..second_index(second))
    end
  end

  defp consecutive?(first, second) do
    first_index(first) < second_index(second)
  end

  defp overlaping?(first, second) do
    first_index(first) > second_index(second)
  end

  defp first_index(value) do
    Enum.find_index(@days, &(&1 == value))
  end

  defp second_index(value) do
    Enum.find_index(@days, &(&1 == value))
  end

  defp last_index do
    last = List.last(@days)
    Enum.find_index(@days, &(&1 == last))
  end
end
