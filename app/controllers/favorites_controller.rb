class FavoritesController < ApplicationController
  skip_before_filter :check_user, :only => [ :index, :show ]

  def index
    respond_to do |format|
      format.html { render 'index.html' }
      format.json { render :json => Favorite.all }
    end
  end

  def show
    respond_to do |format|
      format.html { render 'index.html' } # Let angular handle it
      format.json { render :json => Favorite.find_by_friendly(params[:id]) }
    end
  end
end
