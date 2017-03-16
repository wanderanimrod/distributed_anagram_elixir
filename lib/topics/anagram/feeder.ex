defmodule Feeder do
  use GenServer

  def start_link(calc_process) do
    GenServer.start_link(__MODULE__, %{calc: calc_process})
  end

  def handle_info(:start, state) do
    send(self(), :beat)
    {:noreply, state}
  end

  def handle_info(:beat, state = %{calc: calc}) do
    Dictionary
    Process.send_after self(), :beat, 1000
    {:noreply, state}
  end

end