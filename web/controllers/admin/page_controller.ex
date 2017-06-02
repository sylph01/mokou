defmodule Mokou.Admin.PageController do
  use Mokou.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
