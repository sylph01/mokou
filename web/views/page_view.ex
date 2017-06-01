defmodule Mokou.PageView do
  use Mokou.Web, :view

  def entry_form_button(conn) do
    if Mokou.Entry.total_count >= Application.get_env(:mokou, :limit_of_count) do
      link("現在予約を行うことができません", to: "#", class: "btn btn-disabled btn-lg", role: "button")
    else
      link("予約を行う", to: page_path(conn, :privacy), class: "btn btn-primary btn-lg", role: "button")
    end
  end
end
