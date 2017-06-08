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
        %Entry{email: address, name: name, id: id} = entry
        Email.entry_complete_email(address, name, id) |> Mailer.deliver_later()

        conn
        |> put_flash(:info, "予約を行いました。登録したEメールアドレスに詳細を送信しました。")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
