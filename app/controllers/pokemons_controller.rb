class PokemonsController < ApplicationController
  before_action :authenticate_user!, only:[:search, :get]

def index
  @pokemon_all = Pokemon.all
end

def show
  @pokemon = Pokemon.find(params[:id])
end

def favorite
  favorite = Favorite.where(user_id: current_user.id)
  favorite_pokemon_id = favorite.pluck(:pokemon_id)
  @favorite_pokemon = Pokemon.where(id: favorite_pokemon_id)
end

def search
  @pokemon_all = Pokemon.all
  pokemon_last = Pokemon.last
  @pokemon_last_id = pokemon_last.number
  if current_user.id != 1
    redirect_to root_path
  end
end

def get
  response = Faraday.get "https://pokeapi.co/api/v2/pokemon-species/#{params[:search]}"
  if response.status == 200
    @response_body = JSON.parse(response.body)
    response_names = @response_body["names"]
    @response = response_names[0]
    response_name = @response_body["name"]

    response_two = Faraday.get "https://pokeapi.co/api/v2/pokemon/#{response_name}"
    if response_two.status == 200
      @response_two = JSON.parse(response_two.body)
    end
  end
end

def create
  @pokemon = Pokemon.new(pokemon_params)
  @pokemon.save
  redirect_to root_path
end

private

def pokemon_params
  params.permit(:number, :name, :type_one, :type_two, :image_url)
end


end
