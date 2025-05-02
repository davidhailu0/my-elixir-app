defmodule MyLiveAppWeb.CounterLive.Show do
  use MyLiveAppWeb, :live_view

  alias MyLiveApp.Pages

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:counter, Pages.get_counter!(id))}
  end

  defp page_title(:show), do: "Show Counter"
  defp page_title(:edit), do: "Edit Counter"
end
