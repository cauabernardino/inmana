defmodule Inmana.Restaurants.Index do
  alias Inmana.{Repo, Restaurant}

  def call do
    case Repo.all(Restaurant) do
      nil -> {:error, %{result: "There's no restaurants on the database!", status: :not_found}}
      restaurants -> {:ok, restaurants}
    end
  end
end
