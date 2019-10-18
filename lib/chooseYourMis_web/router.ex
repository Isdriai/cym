defmodule CymWeb.Router do
  use CymWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CymWeb do
    pipe_through :api

    resources "/users", UserController
    resources "/skills", SkillController
    end
end
