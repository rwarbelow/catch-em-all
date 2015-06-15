class Game < ActiveRecord::Base
  has_many :game_pokemons
  has_many :pokemons, through: :game_pokemons
end
