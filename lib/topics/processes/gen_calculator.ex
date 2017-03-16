defmodule GenCalculator do
  use GenServer

  def start_link(start_at) do
    GenServer.start_link(__MODULE__, %{count: start_at})
  end

  def handle_info(:next, _state = %{count: count}) do
    next = count + 1
    IO.puts "current = #{next}"
    {:noreply, %{count: next}}
  end

  def handle_info(:previous, %{count: count} = state) do
    next = count - 1
    IO.puts "current = #{next}"
    {:noreply, %{state | count: next}}
  end
  
end