Rails.application.routes.draw do
  devise_for :users
  root to: "pokemons#index"
  resources :pokemons, only: [:create, :index, :show] do
    collection do
      get 'search'
      get 'get'
      get 'favorite'
      get 'name'
      get 'type'
      get 'sort'
    end

    resources :favorites, only: [:create, :destroy]
  end
end
