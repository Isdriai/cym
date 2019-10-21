defmodule Cym.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  import EctoEnum

  defenum Type,
    candidate: "candidate",
    recruiter: "recruiter"

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :firstName, :string
    field :lastName, :string
    field :mail, :string
    field :type, Type
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstName, :lastName, :mail, :type])
    |> validate_required([:firstName, :lastName, :mail, :type])
  end
end
