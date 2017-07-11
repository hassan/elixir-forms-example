defmodule Example.ThingView do
  use Example.Web, :view

  def list_join(things \\ []) do
    Enum.join(things, ", ")
  end

  def as_options(things \\ []) do
    Enum.map(things, &({&1, &1}))
  end
end
