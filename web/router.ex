defmodule Mokou.Router do
  use Mokou.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mokou do
    pipe_through :browser # Use the default browser stack

	resources "/entries", EntryController

    get "/",        PageController, :index
    get "/privacy", PageController, :privacy
    get "/form",    PageController, :form
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mokou do
  #   pipe_through :api
  # end
end
