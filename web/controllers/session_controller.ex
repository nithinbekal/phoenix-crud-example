defmodule ElixirBlog.SessionController do
  use ElixirBlog.Web, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case ElixirBlog.Session.login(session_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in!")
        |> redirect(to: "/")
      {:error} ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> render("new.html")
    end
  end
end
