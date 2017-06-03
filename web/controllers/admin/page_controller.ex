defmodule Mokou.Admin.PageController do
  use Mokou.Web, :controller

  alias Mokou.Entry

  def index(conn, _params) do
    entries = Repo.all(Entry)
    render(conn, "index.html", entries: entries)
  end
end
