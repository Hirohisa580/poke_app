class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(user_id: current_user.id, pokemon_id: params[:pokemon_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, pokemon_id: params[:pokemon_id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end


end
