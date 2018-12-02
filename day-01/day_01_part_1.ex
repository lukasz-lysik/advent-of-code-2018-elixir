defmodule Day_01_Part_1 do
  def run(old_freq) do
    case IO.read(:stdio, :line) do
      :eof -> 
        IO.puts "Result: #{old_freq}"
        :ok
      {:error, reason} -> IO.puts "Error: #{reason}"
      data ->
        {change, _} = Integer.parse(data)
        run old_freq + change
    end
  end
end

Day_01_Part_1.run 0