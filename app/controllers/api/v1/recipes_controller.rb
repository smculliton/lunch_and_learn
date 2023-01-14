class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country] || CountriesFacade.random_country
    recipes = RecipesFacade.get_recipes_from_country(country)

    render json: RecipesSerializer.new(recipes), status: 200
  end
end