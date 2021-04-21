defmodule Inmana.Supplies.Index do
  alias Inmana.{Repo, Supply}

  def call do
    case Repo.all(Supply) do
      nil -> {:error, %{result: "There's no supplies on the database!", status: :not_found}}
      supplies -> {:ok, supplies}
    end
  end
end
