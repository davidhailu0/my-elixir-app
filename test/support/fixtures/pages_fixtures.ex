defmodule MyLiveApp.PagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyLiveApp.Pages` context.
  """

  @doc """
  Generate a counter.
  """
  def counter_fixture(attrs \\ %{}) do
    {:ok, counter} =
      attrs
      |> Enum.into(%{

      })
      |> MyLiveApp.Pages.create_counter()

    counter
  end
end
