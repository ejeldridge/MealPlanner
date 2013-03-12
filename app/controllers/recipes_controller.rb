class RecipesController < ApplicationController

  def index
  @recipes = recipes.all
  end
end
