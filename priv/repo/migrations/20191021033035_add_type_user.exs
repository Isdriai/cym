defmodule Cym.Repo.Migrations.AddTypeUser do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :type, :string # Database type
    end
  end
end
