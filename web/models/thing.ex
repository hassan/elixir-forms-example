defmodule Example.Thing do
  use Example.Web, :model

  schema "things" do
    field :name, :string
    field :colors, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :colors])
    |> validate_required([:name, :colors])
  end
end
