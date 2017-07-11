defmodule Example.Thing do
  use Example.Web, :model
  use Ecto.Schema
  import Ecto.Changeset

  require Logger

  @valid_colors ["blue", "green", "red"]
  def valid_colors, do: @valid_colors

  schema "things" do
    field :name, :string
    field :colors, {:array, :string}
    field :valid_colors, {:array, :string}, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    keys = Map.keys(params) |> Enum.join(",")
    keystring = "keys: " <> keys
    Logger.info(keystring)
    struct
    |> cast(params, [:name, :colors, :valid_colors])
    |> validate_required([:name])
    |> validate_subset(:colors, @valid_colors)
    # |> change(%{data: {valid_colors: @valid_colors}})
  end
end
