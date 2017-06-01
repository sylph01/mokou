defmodule Mokou.Entry do
  use Mokou.Web, :model
  import Ecto.Query

  schema "entries" do
    field :name, :string
    field :email, :string
    field :count, :integer

    timestamps()
  end

  def total_count do
    Mokou.Repo.one(from e in Mokou.Entry, select: sum(e.count)) |> Decimal.to_integer
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :count])
    |> validate_required([:name, :email, :count])
  end
end
