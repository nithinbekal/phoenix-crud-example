defmodule ElixirBlog.RegistrationController do
  use ElixirBlog.Web, :controller

  alias ElixirBlog.User

  plug :action

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{ "user"=> user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      Registration.create(changeset)
      conn
      |> put_flash(:info, "Account created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn) do
    delete_session(conn, :current_user)
    |> put_flash(:info, "Logged out!")
    |> redirect(to: "/")
  end
end
