defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.NotifyExpiration

  # Client side
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server side
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    NotifyExpiration.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    # Select time (10 sec for debug or a week for prod)
    Process.send_after(self(), :generate, 1000 * 10)
    # Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
  end
end
