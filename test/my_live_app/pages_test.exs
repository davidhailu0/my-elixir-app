defmodule MyLiveApp.PagesTest do
  use MyLiveApp.DataCase

  alias MyLiveApp.Pages

  describe "counters" do
    alias MyLiveApp.Pages.Counter

    import MyLiveApp.PagesFixtures

    @invalid_attrs %{}

    test "list_counters/0 returns all counters" do
      counter = counter_fixture()
      assert Pages.list_counters() == [counter]
    end

    test "get_counter!/1 returns the counter with given id" do
      counter = counter_fixture()
      assert Pages.get_counter!(counter.id) == counter
    end

    test "create_counter/1 with valid data creates a counter" do
      valid_attrs = %{}

      assert {:ok, %Counter{} = counter} = Pages.create_counter(valid_attrs)
    end

    test "create_counter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pages.create_counter(@invalid_attrs)
    end

    test "update_counter/2 with valid data updates the counter" do
      counter = counter_fixture()
      update_attrs = %{}

      assert {:ok, %Counter{} = counter} = Pages.update_counter(counter, update_attrs)
    end

    test "update_counter/2 with invalid data returns error changeset" do
      counter = counter_fixture()
      assert {:error, %Ecto.Changeset{}} = Pages.update_counter(counter, @invalid_attrs)
      assert counter == Pages.get_counter!(counter.id)
    end

    test "delete_counter/1 deletes the counter" do
      counter = counter_fixture()
      assert {:ok, %Counter{}} = Pages.delete_counter(counter)
      assert_raise Ecto.NoResultsError, fn -> Pages.get_counter!(counter.id) end
    end

    test "change_counter/1 returns a counter changeset" do
      counter = counter_fixture()
      assert %Ecto.Changeset{} = Pages.change_counter(counter)
    end
  end
end
