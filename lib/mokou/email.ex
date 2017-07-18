defmodule Mokou.Email do
  use Bamboo.Phoenix, view: Mokou.EmailView

  def entry_complete_email(address, name, id, count) do
    new_email()
    |> to(address)
    |> from({"針の音楽団整理券システム", "noreply@ticket.harimusic.net"})
    |> subject("[針の音楽団]演奏会整理券のお知らせ")
    |> put_header("Reply-To", "harimusic896@gmail.com")
    |> put_header("Precedence", "bulk")
    |> put_header("Message-ID", "harimusicticket#{id}")
    |> put_text_layout({Mokou.LayoutView, "email.text"})
    |> render("entry_complete.text", name: name, id: id, count: count)
  end
end
