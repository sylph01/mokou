defmodule Mokou.Email do
  use Bamboo.Phoenix, view: Mokou.EmailView

  def test_email do
    new_email()
    |> to("sylph01@gmail.com")
    |> from("mokou-noreply@harimusic.net")
    |> subject("Test Mail (from Mokou)")
    |> put_text_layout({Mokou.LayoutView, "email.text"})
    |> render("entry_complete.text", name: "sylph01", id: 1)
  end
end
