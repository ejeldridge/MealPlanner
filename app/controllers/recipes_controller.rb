class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Successfully updated product titled: #{@recipe.recipe_name}"
    end
    #TODO: Redirect to the show recipe in main view after editing a recipe
    redirect_to root_url
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    if @recipe.destroyed?
      flash[:notice] = "Successfully destroyed #{@recipe.recipe_name}!!!!"
    else
      flash[:error] = "Could not delete the object"
    end
    redirect_to root_url
  end

  def new
    @recipe = Recipe.new()
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
    #TODO: redirect to show recipe in main view after a new recipe is added
    redirect_to root_url
  end

end
