defmodule ElixirBlog.RegistrationController do
  use ElixirBlog.Web, :controller

  plug :action

  def new(conn, _params) do
    conn
    |> render("new.html")
  end
end
