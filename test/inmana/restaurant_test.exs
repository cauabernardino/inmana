defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Two Birds", email: "twobirds@mail.com"}

      result = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Two Birds", email: "twobirds@mail.com"},
               valid?: true
             } = result
    end

    test "when are invalid params, returns an invalid changeset" do
      params = %{name: "T", email: ""}

      expected_result = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      result = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = result
      assert errors_on(result) == expected_result
    end
  end
end
