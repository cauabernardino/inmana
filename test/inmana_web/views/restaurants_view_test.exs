defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true
  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Jedi Meals", email: "jedi@mail.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "jedi@mail.com",
                 id: _id,
                 name: "Jedi Meals"
               }
             } = response
    end
  end
end
