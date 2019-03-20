defmodule ClickWeb.PageController do
  use ClickWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    LiveView.Controller.live_render(conn, ClickWeb.ClickView, session: %{})
  end
end
