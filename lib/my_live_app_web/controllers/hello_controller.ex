defmodule MyLiveAppWeb.HelloController do
  use MyLiveAppWeb, :controller

  plug :put_view, html: MyLiveAppWeb.HelloHTML, json: MyLiveAppWeb.HelloJSON

  def index(conn, _params) do
    conn
    |> put_layout(html: :admin)
    |> render(:index)
  end

  def show(conn, %{"message" => message}) do
    render(conn, :show, message: message)
  end
end
