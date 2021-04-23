defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You're very special!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "John", "age" => "23"}
      expected_result = {:ok, "Welcome john!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is underage, returns an error" do
      params = %{"name" => "James", "age" => "15"}
      expected_result = {:error, "You shall not pass, james!"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
