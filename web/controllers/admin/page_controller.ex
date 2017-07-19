defmodule Mokou.Admin.PageController do
  use Mokou.Web, :controller

  alias Mokou.Entry
  import Ecto.Query

  def index(conn, _params) do
    entries = Repo.all(from e in Entry, order_by: [desc: e.id])
    render(conn, "index.html", entries: entries)
  end

  def show_entry(conn, %{"id" => id}) do
    entry = Repo.get!(Entry, id)
    render(conn, "entry.html", entry: entry)
  end
end
