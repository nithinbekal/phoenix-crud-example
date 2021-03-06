defmodule ElixirBlog.Router do
  use ElixirBlog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirBlog do
    pipe_through :browser # Use the default browser stack
    get "/", PostController, :index

    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirBlog do
  #   pipe_through :api
  # end
end
