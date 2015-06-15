class Pokemon < ActiveRecord::Base
  has_many :game_pokemons
  has_many :games, through: :game_pokemons
end
