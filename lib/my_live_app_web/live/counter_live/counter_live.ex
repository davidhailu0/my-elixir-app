defmodule MyLiveAppWeb.CounterLive do
  use MyLiveAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~H"""
    <div class="text-center mt-10">
      <h1 class="text-2xl font-bold mb-4">Counter: {@count}</h1>
       <button phx-click="dec" class="mr-2 px-4 py-2 bg-red-500 text-white rounded">-</button>
      <button phx-click="inc" class="px-4 py-2 bg-green-500 text-white rounded">+</button>
    </div>
    """
  end

  def handle_event("inc", _value, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("dec", _value, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end
end
