defmodule GenCalculator do
  use GenServer
  require Logger

  def start_link(start_at \\ 0, name \\ :gen_calculator) do
    Logger.debug "I have been started by somebody I don't know ..."
    GenServer.start_link(__MODULE__, %{count: start_at}, name: name)
  end

  def handle_info(:next, _state = %{count: count}) do
    next = count + 1
    IO.puts "current = #{next}"
    {:noreply, %{count: next}}
  end

  def handle_info({:divide, numerator, denominator}, state = %{count: count}) do
    IO.puts "(#{numerator}/#{denominator}) + #{count} = #{count + numerator/denominator}"
    {:noreply, state}
  end
end