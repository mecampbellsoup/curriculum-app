# Make The Form(s)

1. A Recipe has_many ingredients. Using the controller's existing create action:

```ruby
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
```

Create the recipes form in the recipes/_form partial, so that it will allow you to create a recipe and add multiple ingredients.

2. An Ingredient belongs_to a Recipe. Using the controller's existing created action:

```ruby
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
```

Create the ingredients form in the ingredients/_form partial so that it will allow you to create an ingredient and associate its recipe.
