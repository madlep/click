defmodule Click.Repo do
  use Ecto.Repo,
    otp_app: :click,
    adapter: Ecto.Adapters.Postgres
end
