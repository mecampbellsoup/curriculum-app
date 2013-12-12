class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new
    @ingredient.name = params[:ingredient][:name]

    @ingredient.recipe = Recipe.find(params[:recipe_id])

    if @ingredient.save
      redirect_to @ingredient, notice: 'Ingredient was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end