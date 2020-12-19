Rails.application.routes.draw do
  devise_for :users
  root to: "pokemons#index"
  get "pokemons/search", to: "pokemons#search"
  get "pokemons/get",    to: "pokemons#get"  
  resources :pokemons, only: [:create, :index, :show] 
end
