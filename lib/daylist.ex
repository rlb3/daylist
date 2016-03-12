defmodule Daylist do
  @by_atom %{sun: 0, mon: 1, tues: 2, wed: 3, thurs: 4, fri: 5, sat: 6}
  @by_index %{0 => :sun, 1 => :mon, 2 => :tues, 3 => :wed, 4 => :thurs, 5 => :fri, 6 => :sat}

  def run({first,second}) do
    cond do
      consecutive?(first, second) -> build_range(first, second) |> day_range
      overlaping?(first, second) -> (build_range(first, :sat) |> day_range) ++ (build_range(:sun, second) |> day_range)
    end
  end

  defp consecutive?(first, second) when is_atom(first) and is_atom(second) do
    first_index(first) < second_index(second)
  end

  defp overlaping?(first, second) when is_atom(first) and is_atom(second) do
    first_index(first) > second_index(second)
  end

  defp first_index(value) when is_atom(value) do
    @by_atom[value]
  end

  defp second_index(value) when is_atom(value)do
    @by_atom[value]
  end

  defp build_range(first, second) do
    first_index(first)..second_index(second)
  end

  defp day_range(range) do
    range |> Enum.map(&(@by_index[&1]))
  end
end
