Rails.application.routes.draw do
  root to: "pokemons#index"
  resources :backpack_pokemons, only: [:create]
end
