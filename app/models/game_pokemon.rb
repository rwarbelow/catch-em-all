class GamePokemon < ActiveRecord::Base
  belongs_to :game
  belongs_to :pokemon
end
