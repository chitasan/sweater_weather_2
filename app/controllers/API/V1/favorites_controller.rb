class Api::V1::FavoritesController < ApplicationController
  protect_from_forgery with: :null_session
  
  before_action :require_api_key
  
  def index
    render json: FavoriteSerializer.new(current_user.favorites)
  end
  
  def create
    current_user.favorites.create(location: location)
    render json: FavoriteSerializer.new(Favorite.last), status: :created
  end
  
  private
  
  def current_user
    User.find_by(api_key: params[:api_key])
  end
  
  def location
    @location ||= Location.find(params[:location])
  end
  
  def favorite
    @favorite ||= Favorite.find_by(location: params[:location])
  end
  
  def require_api_key
    unless authorized
      render json: {}, status: :unauthorized
    end
  end
  
  def authorized
    params[:api_key] && current_user
  end
end