defmodule Mokou.Repo.Migrations.MakeEmailUnique do
  use Ecto.Migration

  def change do
    create unique_index(:entries, [:email])
  end
end
