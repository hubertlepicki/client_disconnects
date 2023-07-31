defmodule ClientDisconnectsWeb.Router do
  use ClientDisconnectsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ClientDisconnectsWeb do
    pipe_through :api
  end
end
