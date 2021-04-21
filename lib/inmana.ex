defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Restaurants.Index, as: RestaurantsList
  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet
  alias Inmana.Supplies.Index, as: SuppliesList

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
  defdelegate get_supplies(), to: SuppliesList, as: :call
  defdelegate get_restaurants(), to: RestaurantsList, as: :call
end
