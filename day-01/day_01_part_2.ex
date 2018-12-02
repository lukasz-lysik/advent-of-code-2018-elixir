defmodule Day_01_Part_2 do
  def run do
    changes = IO.read(:stdio, :all)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)

    iterate(0, [], 0, changes)
  end

  defp iterate(prev_freq, reached, i, changes) do
    case Enum.fetch(changes, i) do
      :error ->
        iterate(prev_freq, reached, 0, changes)
      {:ok, c} ->
        next_freq = prev_freq + c
        if Enum.member?(reached, next_freq) do
          IO.puts "Result: #{next_freq}"
        else
          iterate(next_freq, [next_freq | reached], i+1, changes)
        end
    end
  end
end

Day_01_Part_2.run