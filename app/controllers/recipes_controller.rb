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

    redirect_to recipe_path
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


    redirect_to(recipes_path + '/' + @recipe.id.to_s)
  end

end
