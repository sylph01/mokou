defmodule Mokou.Email do
  use Bamboo.Phoenix, view: Mokou.EmailView

  def entry_complete_email(address, name, id, count) do
    sender_in_iso2022jp  = :creole.convert("針の音楽団整理券システム", :utf8, :iso_2022_jp_1)
    
    new_email()
    |> to(address)
    |> from({sender_in_iso2022jp, "noreply@ticket.harimusic.net"})
    |> subject("[針の音楽団]演奏会整理券のお知らせ")
    |> put_text_layout({Mokou.LayoutView, "email.text"})
    |> render("entry_complete.text", name: name, id: id, count: count)
  end
end
