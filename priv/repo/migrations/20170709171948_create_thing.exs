defmodule Example.Repo.Migrations.CreateThing do
  use Ecto.Migration

  def change do
    create table(:things) do
      add :name, :string
      add :colors, {:array, :string}

      timestamps()
    end

  end
end
