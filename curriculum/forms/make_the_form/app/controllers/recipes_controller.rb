class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new()
    @recipe.name = params[:recipe][:name]

    @recipe.description = params[:description]

    params[:ingredients].each do |ingredient|
      new_ingredient = Ingredient.new
      new_ingredient.name = ingredient[:name]
      new_ingredient.amount = ingredient[:amount]

      @recipe.ingredients << new_ingredient
    end

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: "new"
    end
  end
end
