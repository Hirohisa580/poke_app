Rails.application.routes.draw do
  devise_for :users
  root to: "pokemons#index"
  get "pokemons/search",     to: "pokemons#search"
  get "pokemons/get",        to: "pokemons#get"  
  get "pokemons/favorite",   to: "pokemons#favorite"
  resources :pokemons, only: [:create, :index, :show] do
    resources :favorites, only: [:create, :destroy]
  end
end
