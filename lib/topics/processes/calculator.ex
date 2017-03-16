defmodule Calculator do
  def count(current \\ 0) do
    IO.puts("current = #{current}")
    receive do
      :next -> count(current + 1)
      :previous -> count(current - 1)
      _ -> raise "I won't do that!"
    end
  end
end