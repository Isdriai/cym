defmodule CymWeb.UserView do
  use CymWeb, :view
  alias CymWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      mail: user.mail,
      type: user.type}
  end
end
