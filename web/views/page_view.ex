defmodule Mokou.PageView do
  use Mokou.Web, :view
  alias Mokou.EntryHelpers

  def entry_form_button(conn) do
    if EntryHelpers.entry_possible?() do
      link("予約を行う", to: page_path(conn, :privacy), class: "btn btn-primary btn-lg", role: "button")
    else
      link("現在予約を行うことができません", to: "#", class: "btn btn-disabled btn-lg", role: "button")
    end
  end
end
