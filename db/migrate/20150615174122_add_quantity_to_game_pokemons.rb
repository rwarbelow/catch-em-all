class AddQuantityToGamePokemons < ActiveRecord::Migration
  def change
    add_column :game_pokemons, :quantity, :integer
  end
end
