# Catch 'Em All!

* `git clone https://github.com/rwarbelow/catch-em-all.git`
* `rake db:create db:migrate db:seed`
* `rails s`
* navigate to `http://localhost:3000`
* Want hard mode? Uncomment the JS file to make your Pokemon run around. 

### Adding a capture button

Inside of views/pokemons/index.html.erb:

```erb
  <%= button_to "Capture", backpack_pokemons_path, class: "btn btn-danger" %>
```

Inside of routes.rb:

```ruby
  resources :backpack_pokemons, only: [:create]
```

Make a controller: `touch app/controllers/backpack_pokemons_controller.rb`. Inside of that file:

```ruby
class BackpackPokemonsController < ApplicationController
  def create
    redirect_to root_path
  end
end
```

How do we pass a Pokemon ID to the create action? Let's modify our button:

```erb
  <%= button_to "Capture", backpack_pokemons_path(pokemon_id: pokemon.id), class: "btn btn-danger" %>
```

Let's put some logic in the create action:

```ruby
class BackpackPokemonsController < ApplicationController
  def create
    backpack = {}
    backpack[params[:pokemon_id]] = 1
    redirect_to root_path
  end
end
```

This doesn't really do anything though. We'll need to save this info in the session. Let's first display the session on the layout:

```erb
  <%= session[:backpack] %>
```

```ruby
class BackpackPokemonsController < ApplicationController
  def create
    backpack = session[:backpack] || {}
    backpack[params[:pokemon_id]] ||= 0
    backpack[params[:pokemon_id]] += 1
    session[:backpack] = backpack
    redirect_to root_path
  end
end
```

This works, but the controller isn't where this belongs. Let's refactor:

```ruby
class BackpackPokemonsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    @backpack.add_pokemon(pokemon.id)
    session[:backpack] = @backpack.contents
    redirect_to root_path
  end
end
```

We'll also need a before action to set this @backpack variable. Go to the Application Controller:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_backpack

  def load_backpack
    @backpack = Backpack.new(session[:backpack])
  end

end

```


```ruby
class Backpack
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_pokemon(pokemon_id)
    contents[pokemon_id.to_s] ||= 0
    contents[pokemon_id.to_s] += 1
  end
end
```

And let's also change where we display the session:

```erb
  Backpack: <%= @backpack.count_all %>
```

We'll need to add this method in the Backpack class:

```ruby
  def count_all
    contents.values.sum
  end
```

We'll add a flash notice in order to tell the user how many of that Pokemon are in their backpack after each capture. 

```ruby
class BackpackPokemonsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    @backpack.add_pokemon(pokemon.id)
    session[:backpack] = @backpack.contents
    flash[:notice] = "You now have #{pluralize(@backpack.count_of(pokemon.id), pokemon.name)}."
    redirect_to root_path
  end
end
```

And add that method in the Backpack:

```ruby
  def count_of(pokemon_id)
    contents[pokemon_id.to_s]
  end
```

Display the flash notice in the layout (you'd probably want to use a content tag, but go with this for now):

```erb
  Backpack: <%= @backpack.count_all %>
  <%= flash[:notice] %>
```

Now let's allow users to end their games.

```erb
  Backpack: <%= @backpack.count_all %>
  <%= flash[:notice] %>
  <%= button_to "End Game", games_path %>
```

In your routes:

```ruby
  resources :games, only: [:create]
```

Make a Games Controller:

```ruby
class GamesController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    game = Game.new(user_name: "Rachel") do |game|
      @backpack.contents.each do |pokemon_id, quantity|
        game.game_pokemons.new(pokemon_id: pokemon_id, quantity: quantity)
      end
    end

    if game.save
      session[:backpack] = nil
      flash[:notice] = "Your game is finished! You captured #{game.pokemons.count} pokemon."
      redirect_to root_path
    else
      # implement if you have validations
    end
  end
end
```
