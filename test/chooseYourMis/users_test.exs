defmodule Cym.UsersTest do
  use Cym.DataCase

  alias Cym.Users

  describe "users" do
    alias Cym.Users.User

    @valid_attrs %{firstName: "some firstName", lastName: "some lastName", mail: "some mail", type: User.Type.Candidate}
    @update_attrs %{firstName: "some updated firstName", lastName: "some updated lastName", mail: "some updated mail", type: User.Type.Candidate}
    @invalid_attrs %{firstName: nil, lastName: nil, mail: nil, type: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.firstName == "some firstName"
      assert user.lastName == "some lastName"
      assert user.mail == "some mail"
      assert user.type == User.Type.Candidate
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.firstName == "some updated firstName"
      assert user.lastName == "some updated lastName"
      assert user.mail == "some updated mail"
      assert user.type == User.Type.Candidate
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
