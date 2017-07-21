defmodule Mokou.DateHelpers do
  def to_string_without_millisecs(naive_date_time) do
    naive_date_time
    |> NaiveDateTime.to_string
    |> String.split(".")
    |> List.first
  end
end
