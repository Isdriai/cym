defmodule Cym.Repo do
  use Ecto.Repo,
    otp_app: :chooseYourMis,
    adapter: Ecto.Adapters.Postgres
end
