defmodule Mokou.Entry do
  use Mokou.Web, :model

  schema "entries" do
    field :name, :string
    field :email, :string
    field :count, :integer

    timestamps()
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
