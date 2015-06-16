defmodule ElixirBlog.RegistrationController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  plug :action

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end
