defmodule ElixirBlog.RegistrationController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  plug :action

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, params) do
    changeset = User.changeset(%User{}, params)

    if changeset.valid? do
      new_user = User.create_account(changeset)
      conn
      |> put_flash(:info, "Account created")
      |> redirect(to: registration_path(conn, :new))
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> redirect(to: registration_path(conn, :new))
    end
  end
end
