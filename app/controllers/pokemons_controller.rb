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

def name
  pokemon_all_name = Pokemon.pluck(:name)
  if pokemon_all_name.include?(params[:name])
    @pokemon = Pokemon.find_by(name: params[:name])
  else
    redirect_to root_path
  end
end

def type
  ja_type
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

def ja_type

  if params[:type_id] == "2"
    @pokemons = Pokemon.where(type_one: "normal") + Pokemon.where(type_two: "normal")
  elsif params[:type_id] == "3"
    @pokemons = Pokemon.where(type_one: "fire") + Pokemon.where(type_two: "fire")
  elsif params[:type_id] == "4"
    @pokemons = Pokemon.where(type_one: "water") + Pokemon.where(type_two: "water")
  elsif params[:type_id] == "5"
    @pokemons = Pokemon.where(type_one: "grass") + Pokemon.where(type_two: "grass")
  elsif params[:type_id] == "6"
    @pokemons = Pokemon.where(type_one: "electric") + Pokemon.where(type_two: "electric")
  elsif params[:type_id] == "7"
    @pokemons = Pokemon.where(type_one: "ice") + Pokemon.where(type_two: "ice")
  elsif params[:type_id] == "8"
    @pokemons = Pokemon.where(type_one: "fighting") + Pokemon.where(type_two: "fighting")
  elsif params[:type_id] == "9"
    @pokemons = Pokemon.where(type_one: "poison") + Pokemon.where(type_two: "poison")
  elsif params[:type_id] == "10"
    @pokemons = Pokemon.where(type_one: "ground") + Pokemon.where(type_two: "ground")
  elsif params[:type_id] == "11"
    @pokemons = Pokemon.where(type_one: "flying") + Pokemon.where(type_two: "flying")
  elsif params[:type_id] == "12"
    @pokemons = Pokemon.where(type_one: "psychic") + Pokemon.where(type_two: "psychic")
  elsif params[:type_id] == "13"
    @pokemons = Pokemon.where(type_one: "bug") + Pokemon.where(type_two: "bug")
  elsif params[:type_id] == "14"
    @pokemons = Pokemon.where(type_one: "rock") + Pokemon.where(type_two: "rock")
  elsif params[:type_id] == "15"
    @pokemons = Pokemon.where(type_one: "ghost") + Pokemon.where(type_two: "ghost")
  elsif params[:type_id] == "16"
    @pokemons = Pokemon.where(type_one: "dragon") + Pokemon.where(type_two: "dragon")
  elsif params[:type_id] == "17"
    @pokemons = Pokemon.where(type_one: "dark") + Pokemon.where(type_two: "dark")
  elsif params[:type_id] == "18"
    @pokemons = Pokemon.where(type_one: "steel") + Pokemon.where(type_two: "steel")
  elsif params[:type_id] == "19"
    @pokemons = Pokemon.where(type_one: "fairy") + Pokemon.where(type_two: "fairy")
  else
    redirect_to root_path
  end

end


end
