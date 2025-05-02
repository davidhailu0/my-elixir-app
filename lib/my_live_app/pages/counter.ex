defmodule MyLiveApp.Pages.Counter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "counters" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [])
    |> validate_required([])
  end
end
