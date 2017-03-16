defmodule GenCalculator do
  use GenServer

  def start_link(start_at) do
    GenServer.start_link(__MODULE__, %{count: start_at})
  end

  def handle_call(:next, _from, %{count: count} = state) do
    next = count + 1
    {:reply, next, %{state | count: next}}
  end

  def handle_call(:previous, _from, %{count: count} = state) do
    next = count - 1
    {:reply, next, %{state | count: next}}
  end
  
end