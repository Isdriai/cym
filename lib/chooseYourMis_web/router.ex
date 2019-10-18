defmodule CymWeb.Router do
  use CymWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CymWeb do
    pipe_through :api
  end
end
