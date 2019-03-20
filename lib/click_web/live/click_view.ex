defmodule ClickWeb.ClickView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        <%= @click_count %>
      </div>
      <button phx-click="i_clicked">Click!</button>
    </div>

    <a href="https://github.com/madlep/click">Check me out on github</a>
    """
  end

  def mount(_session, socket) do
    Phoenix.PubSub.subscribe(Click.PubSub, "clicks:count")
    {:ok, assign(socket, click_count: Click.Counter.click_count()) }
  end

  def handle_event("i_clicked", _value, socket) do
    Click.Counter.click()
    {:noreply, socket}
  end

  def handle_info({:count, new_count}, socket) do
    {:noreply, assign(socket, [click_count: new_count])}
  end
end
