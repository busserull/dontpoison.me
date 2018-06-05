defmodule Tilpdat.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tilpdat.Post


  schema "posts" do
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:text])
    |> validate_required([:text])
    |> validate_length(:text, min: 1)
  end
end
