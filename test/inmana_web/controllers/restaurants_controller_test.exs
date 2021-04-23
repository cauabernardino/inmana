defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Two Birds", email: "twobirds@mail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "twobirds@mail.com",
                 "id" => _id,
                 "name" => "Two Birds"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "twobirds@mail.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "index/2" do
    test "when all params are valid, shows all restaurants", %{conn: conn} do
      params = %{name: "Two Birds", email: "twobirds@mail.com"}
      params2 = %{name: "Jedi Meals", email: "jedi@mail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> post(Routes.restaurants_path(conn, :create, params2))
        |> get(Routes.restaurants_path(conn, :index))
        |> json_response(:ok)

      assert %{
               "restaurants" => [
                 %{
                   "email" => "twobirds@mail.com",
                   "name" => "Two Birds"
                 },
                 %{
                   "email" => "jedi@mail.com",
                   "name" => "Jedi Meals"
                 }
               ]
             } = response
    end
  end
end
