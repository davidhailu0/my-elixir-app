defmodule MyLiveAppWeb.HelloJSON do
  use MyLiveAppWeb, :controller

  def index(conn, _params) do
    %{message: "this is some JSON"}
  end
end
