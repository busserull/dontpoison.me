defmodule TilpdatWeb.PageController do
  use TilpdatWeb, :controller

  import Ecto.Query
  alias Tilpdat.Repo
  alias Tilpdat.Post

  def index(conn, _params) do
    posts = Repo.all(Post) |> Enum.reverse

    changeset = Post.changeset(%Post{}, %{})

    render conn, "index.html", posts: posts, changeset: changeset
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    if changeset.valid? do
      posts_query = from p in Post,
        where: p.text == ^changeset.changes.text

      if Repo.all(posts_query) == [] do
        Repo.insert(changeset)
        changeset = Post.changeset(%Post{}, %{})
      end
    end

    posts = Repo.all(Post) |> Enum.reverse

    render conn, "index.html", posts: posts, changeset: changeset
  end

end
