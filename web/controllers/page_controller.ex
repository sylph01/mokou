defmodule Mokou.PageController do
  use Mokou.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def privacy(conn, _params) do
    render conn, "privacy.html"
  end

  def form(conn, _params) do
    render conn, "form.html"
  end
end
