defmodule Mokou.EntryController do
  use Mokou.Web, :controller

  alias Mokou.{Entry, Email, Mailer}

  def new(conn, _params) do
    changeset = Entry.changeset(%Entry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"entry" => entry_params}) do
    changeset = Entry.changeset(%Entry{}, entry_params)

    case Repo.insert(changeset) do
      {:ok, entry} ->
        %Entry{email: address, name: name, id: id, count: count} = entry
        Email.entry_complete_email(address, name, id, count) |> Mailer.deliver_later()

        conn
        |> render("entry_complete.html")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
