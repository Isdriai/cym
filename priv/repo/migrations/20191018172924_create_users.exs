defmodule Cym.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:firstName, :string)
      add(:lastName, :string)
      add(:mail, :string)
      add(:type, :string)

      timestamps()
    end
  end
end
