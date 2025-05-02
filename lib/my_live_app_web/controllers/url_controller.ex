defmodule MyLiveAppWeb.URLController do
  use MyLiveAppWeb, :controller

  alias MyLiveApp.URLS
  alias MyLiveApp.URLS.URL

  action_fallback MyLiveAppWeb.FallbackController

  def index(conn, _params) do
    urls = URLS.list_urls()
    render(conn, :index, urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    with {:ok, %URL{} = url} <- URLS.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/urls/#{url}")
      |> render(:show, url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = URLS.get_url!(id)
    render(conn, :show, url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = URLS.get_url!(id)

    with {:ok, %URL{} = url} <- URLS.update_url(url, url_params) do
      render(conn, :show, url: url)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = URLS.get_url!(id)

    with {:ok, %URL{}} <- URLS.delete_url(url) do
      send_resp(conn, :no_content, "")
    end
  end
end
