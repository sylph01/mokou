defmodule Mokou.ColorCode do
  @colors ["しろ", "みずいろ", "あお", "むらさき", "ももいろ", "あか", "だいだい", "きいろ", "みどり", "くろ"]

  def color(num) do
    Enum.at(@colors, rem(num, 10))
  end
end
