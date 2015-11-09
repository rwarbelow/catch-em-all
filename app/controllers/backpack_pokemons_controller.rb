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
