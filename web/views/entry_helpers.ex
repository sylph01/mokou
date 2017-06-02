defmodule Mokou.EntryHelpers do
  def entry_possible?() do
    count_less_than_limit?() && date_before_end?()
  end

  def count_less_than_limit?() do
    Mokou.Entry.total_count <= Application.get_env(:mokou, :limit_of_count)
  end

  def date_before_end?() do
    {:ok, end_date, _utc_offset} = DateTime.from_iso8601(Application.get_env(:mokou, :end_date))
    DateTime.compare(DateTime.utc_now(), end_date) == :lt
  end
end
