defmodule Click.Counter do
  use GenServer

  def start_link(count) do
    GenServer.start_link(__MODULE__, count, name: __MODULE__)
  end

  def click() do
    GenServer.cast(__MODULE__, :clicked)
  end

  def click_count() do
    GenServer.call(__MODULE__, :click_count)
  end

  @impl true
  def init(count) do
    {:ok, count}
  end

  @impl true
  def handle_cast(:clicked, count) do
    new_count = count + 1
    Phoenix.PubSub.broadcast(Click.PubSub, "clicks:count", {:count, new_count})
    {:noreply, new_count}
  end

  @impl true
  def handle_call(:click_count, _from, count) do
    {:reply, count, count}
  end
end
