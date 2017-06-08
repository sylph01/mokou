defmodule Mokou.Email do
  use Bamboo.Phoenix, view: Mokou.EmailView

  def test_email do
    new_email()
    |> to("sylph01@gmail.com")
    |> from("mokou-noreply@harimusic.net")
    |> subject("Test Mail (from Mokou)")
    |> text_body("Hello world!")
  end
end
