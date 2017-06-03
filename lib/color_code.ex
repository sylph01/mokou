defmodule Mokou.ColorCode do
  @colors ["だいだい", "むらさき", "あお", "みずいろ", "あか", "ももいろ", "きいろ", "しろ", "くろ", "みどり"]

  def color(num) do
    Enum.at(@colors, rem(num, 10))
  end
end
