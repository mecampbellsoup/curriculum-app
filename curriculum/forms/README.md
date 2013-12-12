# Forms and Controllers

## Make The Controller

1. A Song belongs to an Artist, add a select box to the songs form so that a user can add an Artist association to a Song.

2. An Artist has many songs, without changing the artists form, change the artists controller so that many songs can be associated with an artist.

## Make The Form(s)

1. A Recipe has_many ingredients. Using the controller's existing create action:

```ruby
def create
  @recipe = Recipe.new()
  @recipe.name = params[:recipe][:name]

  @recipe.description = params[:description]

  params[:ingredients].each do |ingredient|
    ingredient = Ingredient.new
    ingredient[:name] = ingredient.name
    ingredient[:amount] = ingredient.amount

    @recipe.ingredients << ingredient
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


## Off to the Races

1) Given that: 
- Races have many horses through horse_races
- Races have many jockey's through jockey_races

Create a form in races/_form that will allow me to add many new horses and many new jockeys while creating a race. This form should have fields .

2) Now edit the previous form (races/_form), AND the forms controller, so that it will also allow me to add existing horses and jockey's to the form. You should use html form checkboxes so that it's easy to add multiple existing records to the form. You'll want them all to end up in an array so you can easily itterate over them later in the controller.

## Accepts Nested Attributes For

1) Given that:

- Comment belongs_to :post
- Post has_many :comments
- Post accepts_nested_attributes_for :comments

Create the posts form, and edit the posts controller, so that you can add a comment when creating a new post. In other words: allow users to create new comments at the same time they create posts.