defmodule MyLiveAppWeb.HelloHTML do
  use MyLiveAppWeb, :html

  embed_templates "hello_html/*"
  # def index(assigns) do
  #   ~H"""
  #   Hello!
  #   """
  # end

  attr :message, :string, required: true

  def greet(assigns) do
    ~H"""
    <h2>Hello World, from {@message}!</h2>
    """
  end
end
