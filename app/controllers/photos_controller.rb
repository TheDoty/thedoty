class PhotosController < ApplicationController
  def index
    @photos = Photo.paginate(:page => params[:page]).order(:created_at).reverse_order
    photos = @photos.dup
    @photo_rows = []
    
    while photos.length > 0 do
      @photo_rows <<= photos.take 3
      photos = photos.drop 3
    end    
  end

  def show
    @photo = Photo.find(params[:id])
  end
end
