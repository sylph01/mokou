defmodule Mokou.PageView do
  use Mokou.Web, :view
  alias Mokou.EntryHelpers

  def entry_form_button(conn) do
    if EntryHelpers.entry_possible?() do
      link("整理券を発行する", to: page_path(conn, :privacy), class: "btn btn-primary btn-lg", role: "button")
    else
      link("現在整理券の発行を行うことができません", to: "#", class: "btn btn-disabled btn-lg", role: "button")
    end
  end
end
