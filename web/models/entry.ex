defmodule Mokou.Entry do
  use Mokou.Web, :model
  import Ecto.Query

  schema "entries" do
    field :name, :string
    field :email, :string, unique: true
    field :count, :integer

    timestamps()
  end

  def total_count do
    count_to_integer(Mokou.Repo.one(from e in Mokou.Entry, select: sum(e.count)))
  end

  defp count_to_integer(nil), do: 0
  defp count_to_integer(dec), do: Decimal.to_integer(dec)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :count])
    |> unique_constraint(:email)
    |> validate_required([:name, :email, :count])
    |> validate_format(:email, ~r/.+@.+\..+/)
    |> validate_confirmation(:email)
  end
end
