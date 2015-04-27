class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.order("RANDOM()")
  end
end