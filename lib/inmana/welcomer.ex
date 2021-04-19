defmodule Inmana.Welcomer do
  # Receive name and age of user and check some params

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You're very special!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}!"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass, #{name}!"}
  end
end
