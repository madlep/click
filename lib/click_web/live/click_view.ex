defmodule ClickWeb.ClickView do
  use Phoenix.LiveView

  alias Phoenix.LiveView.Socket

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        <%= @click_count %>
      </div>
      <button phx-click="i_clicked">Click!</button>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, click_count: 0) }
  end

  def handle_event("i_clicked", _value, socket = %Socket{assigns: %{click_count: click_count}}) do
    {:noreply, assign(socket, [click_count: click_count + 1])}
  end
end
