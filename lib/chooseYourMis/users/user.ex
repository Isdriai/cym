defmodule Cym.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :firstName, :string
    field :lastName, :string
    field :mail, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstName, :lastName, :mail])
    |> validate_required([:firstName, :lastName, :mail])
  end
end
