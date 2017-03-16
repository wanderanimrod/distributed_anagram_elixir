defmodule Feeder do
  use GenServer

  def start_link(calc_process) do
    GenServer.start_link(__MODULE__, %{calc: calc_process})
  end

  def handle_info(:start, state) do
    send(self(), :feed)
    {:noreply, state}
  end

  def handle_info(:feed, state = %{calc: calc}) do
    send calc, :next
    timer = Process.send_after self(), :feed, 1000
    {:noreply, Map.put(state, :timer, timer)}
  end

  def handle_info(:stop, state = %{timer: timer}) do
    Process.cancel_timer timer
    {:noreply, state}
  end
end