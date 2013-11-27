class BlogController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page]).order(:created_at).reverse_order
  end

  def show
    @post = Post.find_by_friendly(params[:id])
  end

  def feed
    @posts = Post.all.order(:created_at).reverse_order

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
