Rails.application.routes.draw do
  root to: "pokemons#search"
  resources :pokemons, only: [:create] 
  get "pokemons/search", to: "pokemons#search"
  get "pokemons/get",    to: "pokemons#get"  
end
