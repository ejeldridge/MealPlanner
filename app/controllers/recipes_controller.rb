class RecipesController < ApplicationController

  def index
    @recipes = Recipes.all
  end
end
