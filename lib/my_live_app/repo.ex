defmodule MyLiveApp.Repo do
  use Ecto.Repo,
    otp_app: :my_live_app,
    adapter: Ecto.Adapters.Postgres
end
