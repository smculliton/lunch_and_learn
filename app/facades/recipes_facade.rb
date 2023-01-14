class RecipesFacade
  def self.get_recipes_from_country(country)
    recipes = RecipesService.search_recipes_by_country(country)[:hits]
    recipes.map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end
end