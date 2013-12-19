class PhotosController < ApplicationController
  skip_before_filter :check_user, :only => [ :index, :page, :show ]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo].permit(:alt, :description, :photo))

    if @photo.save
      flash[:notice] = 'Photo Created'
      redirect_to url_for(controller: :admin, action: :index)
    else
      render action: :new
    end
  end
    
  def show
    respond_to do |format|
      format.html { render 'index.html' } # Let angular handle it
      format.json do 
        photo = Photo.find(params[:id])

        # We really only want to pass back certain things
        res = {
          id: photo.id,
          detail_url: photo.photo.detail.url,
          alt: photo.alt,
          description: photo.description,
          older_id: nil,
          newer_id: nil,
        }

        res[:older_id] = photo.older.id if photo.older
        res[:newer_id] = photo.newer.id if photo.newer

        render :json => res
      end
    end
  end

  def page
    @photos = Photo.paginate(:page => params[:page]).order(:created_at).reverse_order
    photos = @photos.dup
    @rows = []
    
    while photos.length > 0 do
      @rows <<= photos.take(3).map { |p| 
        { id: p.id, url: p.photo.thumb.url } 
      }
      photos = photos.drop 3
    end

    respond_to do |format|
      format.json { render :json => { total_pages: @photos.total_pages, rows: @rows } }
    end
  end
end
