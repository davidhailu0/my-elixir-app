defmodule MyLiveApp.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do

      timestamps(type: :utc_datetime)
    end
  end
end
