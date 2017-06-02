defmodule Mokou.Router do
  use Mokou.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug BasicAuth, username: Application.get_env(:mokou, :admin_username), password: Application.get_env(:mokou, :admin_password)
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mokou do
    pipe_through :browser # Use the default browser stack

	  resources "/entries", EntryController, only: [:new, :create]

    get "/",        PageController, :index
    get "/privacy", PageController, :privacy
  end

  scope "/admin", Mokou do
    pipe_through [:browser, :admin]

    get "/", Admin.PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mokou do
  #   pipe_through :api
  # end
end
