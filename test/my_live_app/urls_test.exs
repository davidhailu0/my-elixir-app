defmodule MyLiveApp.URLSTest do
  use MyLiveApp.DataCase

  alias MyLiveApp.URLS

  describe "urls" do
    alias MyLiveApp.URLS.URL

    import MyLiveApp.URLSFixtures

    @invalid_attrs %{link: nil, title: nil}

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert URLS.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert URLS.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{link: "some link", title: "some title"}

      assert {:ok, %URL{} = url} = URLS.create_url(valid_attrs)
      assert url.link == "some link"
      assert url.title == "some title"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = URLS.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      update_attrs = %{link: "some updated link", title: "some updated title"}

      assert {:ok, %URL{} = url} = URLS.update_url(url, update_attrs)
      assert url.link == "some updated link"
      assert url.title == "some updated title"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = URLS.update_url(url, @invalid_attrs)
      assert url == URLS.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %URL{}} = URLS.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> URLS.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = URLS.change_url(url)
    end
  end
end
