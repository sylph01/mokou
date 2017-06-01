defmodule Mokou.Repo.Migrations.CreateEntry do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :name, :string
      add :email, :string
      add :count, :integer

      timestamps()
    end

  end
end
