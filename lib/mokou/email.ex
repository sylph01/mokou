defmodule Mokou.Email do
  use Bamboo.Phoenix, view: Mokou.EmailView

  def entry_complete_email(address, name, id) do
    new_email()
    |> to(address)
    |> from({"針の音楽団整理券システム", "mokou@s01.info"})
    |> subject("[針の音楽団]予約が完了しました")
    |> put_text_layout({Mokou.LayoutView, "email.text"})
    |> render("entry_complete.text", name: name, id: id)
  end
end
