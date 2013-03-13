class RecipesController < ApplicationController

  def index
    @recipes = Recipes.all
  end

  def edit
    @recipe = Recipes.find_by_id(params[:id])
  end

  def update
    @recipe = Recipes.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Successfully updated product titled: #{@recipe.recipename}"
    end
    redirect_to root_url
  end

  def destroy
    @recipe = Recipes.find(params[:id])
    @recipe.destroy
    if @recipe.destroyed?
      flash[:notice] = "Successfully destroyed #{@recipe.recipename}!!!!"
    else
      flash[:error] = "Could not delete the object"
    end
    redirect_to root_url
  end

  def new
    @recipe = Recipes.new()
  end

  def create
    @recipe = Recipes.new(params[:recipe])
    @recipe.save

    redirect_to root_url
  end

end
