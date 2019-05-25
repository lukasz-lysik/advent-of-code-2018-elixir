defmodule Day_02 do
  def run do
    IO.read(:stdio, :all)
    |> String.split("\n", trim: true)
    |> Enum.map(&process_single/1)
    |> Enum.reduce({0, 0}, fn {x2, x3}, {acc2, acc3} -> {
        acc2 + (if x2, do: 1, else: 0), 
        acc3 + (if x3, do: 1, else: 0)
        } end)
    |> (fn {x2, x3} -> x2*x3 end).()
    |> IO.inspect
  end

  defp process_single(line) do
    line
    |> String.graphemes
    |> Enum.group_by(fn arg -> arg end)
    |> Enum.map(fn {k, v} -> {k, length(v)} end)
    |> Enum.reduce({false, false}, fn ({_, v}, {acc2, acc3}) -> {(v == 2) or acc2, (v == 3) or acc3} end)
    |> IO.inspect
  end
end

Day_02.run

#"lucjymedmvsbhqtkxiwnaorzmq"
#|> String.graphemes
#|> Enum.group_by(fn arg -> arg end)
#|> Enum.map(fn {k, v} -> {k, length(v)} end)
#|> Enum.reduce(fn ({_, v}, {acc2, acc3}) -> {v == 2 or acc2, v == 3 or acc3} end)
#|> IO.inspect
